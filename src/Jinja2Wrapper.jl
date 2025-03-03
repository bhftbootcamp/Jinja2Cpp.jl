module Jinja2Wrapper

export Jinja2Template,
    Jinja2Environment,
    Jinja2Error,
    jinja2_render

using ..Jinja2Cpp

const TEMPLATE_NULL      = Ptr{Jinja2CppTemplate}(C_NULL)
const RESULT_VOID_NULL   = Ptr{Jinja2CppResult{Cvoid}}(C_NULL)
const RESULT_STRING_NULL = Ptr{Jinja2CppResult{Ptr{UInt8}}}(C_NULL)
const VALUE_NULL         = Ptr{Jinja2CppValue}(C_NULL)
const VALUES_LIST_NULL   = Ptr{Jinja2CppValuesList}(C_NULL)
const VALUES_MAP_NULL    = Ptr{Jinja2CppValuesMap}(C_NULL)
const ERROR_INFO_NULL    = Ptr{Jinja2CppErrorInfo}(C_NULL)
const TEMPLATE_ENV_NULL  = Ptr{Jinja2CppTemplateEnv}(C_NULL)
const MEMORY_FS_NULL     = Ptr{Jinja2CppMemoryFileSystem}(C_NULL)
const UINT8_NULL         = Ptr{UInt8}(C_NULL)

include("Jinja2Value.jl")

"""
    Jinja2Error <: Exception

Error thrown when Jinja2 syntax is invalid.

## Fields
- `code::Int`: Error code.
- `message::String`: Error message.
"""
struct Jinja2Error <: Exception
    code::Int
    message::String

    function Jinja2Error(x::Ptr{Jinja2CppErrorInfo})
        error_msg_ptr = jinja2cpp_error_info_to_string(x)
        msg = error_msg_ptr === UINT8_NULL ? "" : unsafe_string(error_msg_ptr)
        code = jinja2cpp_error_info_get_code(x)
        return new(code, msg)
    end

    function Jinja2Error(msg::AbstractString)
        return new(-1, msg)
    end
end

function Base.show(io::IO, e::Jinja2Error)
    print(io, "Jinja2Error(code=$(e.code)): $(e.message)")
end

"""
    Jinja2Environment

Type describing the context and settings of the [`Jinja2Template`](@ref).

For more information see the [source](https://jinja.palletsprojects.com/en/stable/api/#jinja2.Environment).
"""
mutable struct Jinja2Environment
    tmpl_env_ptr::Ptr{Jinja2CppTemplateEnv}
    mem_fs_ptr::Ptr{Jinja2CppMemoryFileSystem}

    function Jinja2Environment(tmpl_dir::AbstractString)
        mem_fs_ptr = jinja2cpp_memory_file_system_create()
        if mem_fs_ptr === MEMORY_FS_NULL
            throw(Jinja2Error("Failed to create Jinja2Cpp memory file system"))
        end
        for (root, _, files) in walkdir(tmpl_dir)
            for file in files
                file_path = joinpath(root, file)
                rel_path = relpath(file_path, tmpl_dir)
                if isfile(file_path)
                    jinja2cpp_memory_file_system_add_file(mem_fs_ptr, rel_path, read(file_path))
                end
            end
        end
        tmpl_env_ptr = jinja2cpp_template_env_create()
        if tmpl_env_ptr === TEMPLATE_ENV_NULL
            throw(Jinja2Error("Failed to create Jinja2Cpp template environment"))
        end
        jinja2cpp_template_env_add_filesystem_handler(tmpl_env_ptr, "", mem_fs_ptr)
        obj = new(tmpl_env_ptr, mem_fs_ptr)
        finalizer(close, obj)
        return obj
    end
end

function Base.show(io::IO, x::Jinja2Environment)
    print(io, "Jinja2Environment")
end

"""
    Jinja2Environment(tmpl_dir::String)

Creates a new environment object used for more flexible template customization.
The `tmpl_dir` parameter specifies the directory path relative to which templates will be searched
(when using constructions such as `{% include %}`, `{% import %}` or `{% extend %}`).
"""
Jinja2Environment(::AbstractString)

function Base.close(x::Jinja2Environment)
    if x.tmpl_env_ptr !== TEMPLATE_ENV_NULL
        jinja2cpp_template_env_destroy(x.tmpl_env_ptr)
        x.tmpl_env_ptr = TEMPLATE_ENV_NULL
    end
    if x.mem_fs_ptr !== MEMORY_FS_NULL
        jinja2cpp_memory_file_system_destroy(x.mem_fs_ptr)
        x.mem_fs_ptr = MEMORY_FS_NULL
    end
    return nothing
end

"""
    Jinja2Template

A type containing information about the Jinja2 template used.
"""
mutable struct Jinja2Template
    handle_ptr::Ptr{Jinja2CppTemplate}
end

function Base.show(io::IO, x::Jinja2Template)
    print(io, "Jinja2Template")
end

function _create_jinja2_template(handle_ptr::Ptr{Jinja2CppTemplate}, source::AbstractString, name::AbstractString)
    if handle_ptr === TEMPLATE_NULL
        throw(Jinja2Error("Failed to create Jinja2Cpp template"))
    end
    result_ptr = jinja2cpp_load(handle_ptr, source, name)
    if result_ptr === RESULT_VOID_NULL
        throw(Jinja2Error("Failed to load source into Jinja2Cpp template"))
    end
    try
        if !jinja2cpp_result_has_value_void(result_ptr)
            error_info_ptr = jinja2cpp_result_error_void(result_ptr)
            throw(Jinja2Error(error_info_ptr))
        end
        obj = Jinja2Template(handle_ptr)
        finalizer(close, obj)
        return obj
    catch e
        jinja2cpp_template_destroy(handle_ptr)
        rethrow(e)
    finally
        jinja2cpp_result_free_void(result_ptr)
    end
end

"""
    Jinja2Template([tmpl_env::Jinja2Environment, ] source::String; name::String = "")

Creates a template object using a `source` Jinja2 string.
In addition, the environment context `tmpl_env` can be passed.
The optional `name` is used for debugging errors.
"""
Jinja2Template(::AbstractString)

function Jinja2Template(source::AbstractString; name::AbstractString = "")
    handle_ptr = jinja2cpp_template_create()
    return _create_jinja2_template(handle_ptr, source, name)
end

function Jinja2Template(tmpl_env::Jinja2Environment, source::AbstractString; name::AbstractString = "")
    handle_ptr = jinja2cpp_template_create_template_env(tmpl_env.tmpl_env_ptr)
    return _create_jinja2_template(handle_ptr, source, name)
end

function Base.close(x::Jinja2Template)
    if x.handle_ptr !== TEMPLATE_NULL
        jinja2cpp_template_destroy(x.handle_ptr)
        x.handle_ptr = TEMPLATE_NULL
    end
    return nothing
end

"""
    jinja2_render(template::Jinja2Template, [, values]) -> String

Renders the provided Jinja2 `template`, replacing the template's placeholders
with the corresponding values from `vals`.

## Example

```jldoctest
julia> tmpl = Jinja2Template("<p>Hello, {{ name }}!</p>");

julia> result = jinja2_render(tmpl, Dict("name" => "Julia"))
"<p>Hello, Julia!</p>"
```

You can find more examples in [Manual section](@ref Manual).
"""
function jinja2_render(tmpl::Jinja2Template, vals)
    values_map_ptr = convert_to_jinja_map(vals)
    result_ptr = jinja2cpp_render_as_string(tmpl.handle_ptr, values_map_ptr)
    if result_ptr === RESULT_STRING_NULL
        throw(Jinja2Error("Failed to render Jinja2Cpp template"))
    end
    try
        if jinja2cpp_result_has_value_string(result_ptr)
            string_value_ptr = jinja2cpp_result_value_string(result_ptr)
            if string_value_ptr === UINT8_NULL
                throw(Jinja2Error("Failed to render Jinja2Cpp template"))
            end
            unsafe_string(string_value_ptr)
        else
            error_info_ptr = jinja2cpp_result_error_string(result_ptr)
            throw(Jinja2Error(error_info_ptr))
        end
    finally
        jinja2cpp_result_free_string(result_ptr)
        jinja2cpp_values_map_destroy(values_map_ptr)
    end
end

jinja2_render(x::Jinja2Template) = jinja2_render(x, Dict{String,Any}())

end
