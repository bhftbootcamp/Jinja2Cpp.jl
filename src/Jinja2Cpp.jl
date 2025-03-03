module Jinja2Cpp

export JINJA2CPP_ERROR_UNSPECIFIED,
    JINJA2CPP_ERROR_UNEXPECTED_EXCEPTION,
    JINJA2CPP_ERROR_YET_UNSUPPORTED,
    JINJA2CPP_ERROR_FILE_NOT_FOUND,
    JINJA2CPP_ERROR_EXTENSION_DISABLED,
    JINJA2CPP_ERROR_TEMPLATE_ENV_ABSENT,
    JINJA2CPP_ERROR_TEMPLATE_NOT_FOUND,
    JINJA2CPP_ERROR_TEMPLATE_NOT_PARSED,
    JINJA2CPP_ERROR_INVALID_VALUE_TYPE,
    JINJA2CPP_ERROR_INVALID_TEMPLATE_NAME,
    JINJA2CPP_ERROR_METADATA_PARSE_ERROR,
    JINJA2CPP_ERROR_EXPECTED_STRING_LITERAL,
    JINJA2CPP_ERROR_EXPECTED_IDENTIFIER,
    JINJA2CPP_ERROR_EXPECTED_SQUARE_BRACKET,
    JINJA2CPP_ERROR_EXPECTED_ROUND_BRACKET,
    JINJA2CPP_ERROR_EXPECTED_CURLY_BRACKET,
    JINJA2CPP_ERROR_EXPECTED_TOKEN,
    JINJA2CPP_ERROR_EXPECTED_EXPRESSION,
    JINJA2CPP_ERROR_EXPECTED_END_OF_STATEMENT,
    JINJA2CPP_ERROR_EXPECTED_RAW_END,
    JINJA2CPP_ERROR_EXPECTED_META_END,
    JINJA2CPP_ERROR_UNEXPECTED_TOKEN,
    JINJA2CPP_ERROR_UNEXPECTED_STATEMENT,
    JINJA2CPP_ERROR_UNEXPECTED_COMMENT_BEGIN,
    JINJA2CPP_ERROR_UNEXPECTED_COMMENT_END,
    JINJA2CPP_ERROR_UNEXPECTED_EXPR_BEGIN,
    JINJA2CPP_ERROR_UNEXPECTED_EXPR_END,
    JINJA2CPP_ERROR_UNEXPECTED_STMT_BEGIN,
    JINJA2CPP_ERROR_UNEXPECTED_STMT_END,
    JINJA2CPP_ERROR_UNEXPECTED_RAW_BEGIN,
    JINJA2CPP_ERROR_UNEXPECTED_RAW_END,
    JINJA2CPP_ERROR_UNEXPECTED_META_BEGIN,
    JINJA2CPP_ERROR_UNEXPECTED_META_END

export Jinja2CppTemplate,
    Jinja2CppResult,
    Jinja2CppValue,
    Jinja2CppValuesMap,
    Jinja2CppValuesList,
    Jinja2CppErrorInfo,
    Jinja2CppMemoryFileSystem,
    Jinja2CppTemplateEnv

export jinja2cpp_template_create,
    jinja2cpp_template_create_template_env,
    jinja2cpp_template_destroy,
    jinja2cpp_load,
    jinja2cpp_render_as_string,
    jinja2cpp_result_free_void,
    jinja2cpp_result_free_string,
    jinja2cpp_result_free_template,
    jinja2cpp_result_has_value_void,
    jinja2cpp_result_has_value_string,
    jinja2cpp_result_has_value_template,
    jinja2cpp_result_value_void,
    jinja2cpp_result_value_string,
    jinja2cpp_result_value_template,
    jinja2cpp_result_error_void,
    jinja2cpp_result_error_string,
    jinja2cpp_result_error_template,
    jinja2cpp_error_info_get_code,
    jinja2cpp_error_info_to_string,
    jinja2cpp_value_create_empty,
    jinja2cpp_value_create_string,
    jinja2cpp_value_create_int,
    jinja2cpp_value_create_double,
    jinja2cpp_value_create_list,
    jinja2cpp_value_create_map,
    jinja2cpp_value_destroy,
    jinja2cpp_value_is_string,
    jinja2cpp_value_is_list,
    jinja2cpp_value_is_map,
    jinja2cpp_value_is_empty,
    jinja2cpp_value_as_string,
    jinja2cpp_value_as_list,
    jinja2cpp_value_as_map,
    jinja2cpp_values_map_create,
    jinja2cpp_values_map_destroy,
    jinja2cpp_values_map_set,
    jinja2cpp_values_map_get,
    jinja2cpp_values_map_size,
    jinja2cpp_values_list_create,
    jinja2cpp_values_list_destroy,
    jinja2cpp_values_list_push,
    jinja2cpp_values_list_get,
    jinja2cpp_values_list_size,
    jinja2cpp_memory_file_system_create,
    jinja2cpp_memory_file_system_destroy,
    jinja2cpp_memory_file_system_add_file,
    jinja2cpp_template_env_create,
    jinja2cpp_template_env_destroy,
    jinja2cpp_template_env_add_filesystem_handler,
    jinja2cpp_template_env_load_template

export Jinja2Template,
    Jinja2Environment,
    Jinja2Error,
    jinja2_render

using jinja2cppwrapper_jll

const JINJA2CPP_ERROR_UNSPECIFIED = 0
const JINJA2CPP_ERROR_UNEXPECTED_EXCEPTION = 1
const JINJA2CPP_ERROR_YET_UNSUPPORTED = 2
const JINJA2CPP_ERROR_FILE_NOT_FOUND = 3
const JINJA2CPP_ERROR_EXTENSION_DISABLED = 4
const JINJA2CPP_ERROR_TEMPLATE_ENV_ABSENT = 5
const JINJA2CPP_ERROR_TEMPLATE_NOT_FOUND = 6
const JINJA2CPP_ERROR_TEMPLATE_NOT_PARSED = 7
const JINJA2CPP_ERROR_INVALID_VALUE_TYPE = 8
const JINJA2CPP_ERROR_INVALID_TEMPLATE_NAME = 9
const JINJA2CPP_ERROR_METADATA_PARSE_ERROR = 10
const JINJA2CPP_ERROR_EXPECTED_STRING_LITERAL = 1001
const JINJA2CPP_ERROR_EXPECTED_IDENTIFIER = 1002
const JINJA2CPP_ERROR_EXPECTED_SQUARE_BRACKET = 1003
const JINJA2CPP_ERROR_EXPECTED_ROUND_BRACKET = 1004
const JINJA2CPP_ERROR_EXPECTED_CURLY_BRACKET = 1005
const JINJA2CPP_ERROR_EXPECTED_TOKEN = 1006
const JINJA2CPP_ERROR_EXPECTED_EXPRESSION = 1007
const JINJA2CPP_ERROR_EXPECTED_END_OF_STATEMENT = 1008
const JINJA2CPP_ERROR_EXPECTED_RAW_END = 1009
const JINJA2CPP_ERROR_EXPECTED_META_END = 1010
const JINJA2CPP_ERROR_UNEXPECTED_TOKEN = 1011
const JINJA2CPP_ERROR_UNEXPECTED_STATEMENT = 1012
const JINJA2CPP_ERROR_UNEXPECTED_COMMENT_BEGIN = 1013
const JINJA2CPP_ERROR_UNEXPECTED_COMMENT_END = 1014
const JINJA2CPP_ERROR_UNEXPECTED_EXPR_BEGIN = 1015
const JINJA2CPP_ERROR_UNEXPECTED_EXPR_END = 1016
const JINJA2CPP_ERROR_UNEXPECTED_STMT_BEGIN = 1017
const JINJA2CPP_ERROR_UNEXPECTED_STMT_END = 1018
const JINJA2CPP_ERROR_UNEXPECTED_RAW_BEGIN = 1019
const JINJA2CPP_ERROR_UNEXPECTED_RAW_END = 1020
const JINJA2CPP_ERROR_UNEXPECTED_META_BEGIN = 1021
const JINJA2CPP_ERROR_UNEXPECTED_META_END = 1022

struct Jinja2CppTemplate end
struct Jinja2CppResult{T} end
struct Jinja2CppValue end
struct Jinja2CppValuesList end
struct Jinja2CppValuesMap end
struct Jinja2CppErrorInfo end
struct Jinja2CppMemoryFileSystem end
struct Jinja2CppTemplateEnv end

#__ Template

function jinja2cpp_template_create()
    ccall((:jinja2cpp_template_create, libjinja2cppwrapper), Ptr{Jinja2CppTemplate}, ())
end

function jinja2cpp_template_create_template_env(tmpl_env)
    ccall((:jinja2cpp_template_create_template_env, libjinja2cppwrapper), Ptr{Jinja2CppTemplate}, (Ptr{Jinja2CppTemplateEnv},), tmpl_env)
end

function jinja2cpp_template_destroy(tmpl)
    ccall((:jinja2cpp_template_destroy, libjinja2cppwrapper), Cvoid, (Ptr{Jinja2CppTemplate},), tmpl)
end

function jinja2cpp_load(tmpl, source, tmpl_name)
    ccall((:jinja2cpp_load, libjinja2cppwrapper), Ptr{Jinja2CppResult{Cvoid}}, (Ptr{Jinja2CppTemplate}, Ptr{UInt8}, Ptr{UInt8}), tmpl, source, tmpl_name)
end

function jinja2cpp_render_as_string(tmpl, tmpl_vars)
    ccall((:jinja2cpp_render_as_string, libjinja2cppwrapper), Ptr{Jinja2CppResult{Ptr{UInt8}}}, (Ptr{Jinja2CppTemplate}, Ptr{Jinja2CppValuesMap}), tmpl, tmpl_vars)
end

#__ Result

function jinja2cpp_result_free_void(result)
    ccall((:jinja2cpp_result_free_void, libjinja2cppwrapper), Cvoid, (Ptr{Jinja2CppResult{Cvoid}},), result)
end

function jinja2cpp_result_free_string(result)
    ccall((:jinja2cpp_result_free_string, libjinja2cppwrapper), Cvoid, (Ptr{Jinja2CppResult{Ptr{UInt8}}},), result)
end

function jinja2cpp_result_free_template(result)
    ccall((:jinja2cpp_result_free_template, libjinja2cppwrapper), Cvoid, (Ptr{Jinja2CppResult{Ptr{Jinja2CppTemplate}}},), result)
end

function jinja2cpp_result_has_value_void(result)
    ccall((:jinja2cpp_result_has_value_void, libjinja2cppwrapper), Bool, (Ptr{Jinja2CppResult{Cvoid}},), result)
end

function jinja2cpp_result_has_value_string(result)
    ccall((:jinja2cpp_result_has_value_string, libjinja2cppwrapper), Bool, (Ptr{Jinja2CppResult{Ptr{UInt8}}},), result)
end

function jinja2cpp_result_has_value_template(result)
    ccall((:jinja2cpp_result_has_value_template, libjinja2cppwrapper), Bool, (Ptr{Jinja2CppResult{Ptr{Jinja2CppTemplate}}},), result)
end

function jinja2cpp_result_value_void(result)
    ccall((:jinja2cpp_result_value_void, libjinja2cppwrapper), Cvoid, (Ptr{Jinja2CppResult{Cvoid}},), result)
end

function jinja2cpp_result_value_string(result)
    ccall((:jinja2cpp_result_value_string, libjinja2cppwrapper), Ptr{UInt8}, (Ptr{Jinja2CppResult{Ptr{UInt8}}},), result)
end

function jinja2cpp_result_value_template(result)
    ccall((:jinja2cpp_result_value_template, libjinja2cppwrapper), Ptr{Jinja2CppTemplate}, (Ptr{Jinja2CppResult{Ptr{Jinja2CppTemplate}}},), result)
end

function jinja2cpp_result_error_void(result)
    ccall((:jinja2cpp_result_error_void, libjinja2cppwrapper), Ptr{Jinja2CppErrorInfo}, (Ptr{Jinja2CppResult{Cvoid}},), result)
end

function jinja2cpp_result_error_string(result)
    ccall((:jinja2cpp_result_error_string, libjinja2cppwrapper), Ptr{Jinja2CppErrorInfo}, (Ptr{Jinja2CppResult{Ptr{UInt8}}},), result)
end

function jinja2cpp_result_error_template(result)
    ccall((:jinja2cpp_result_error_template, libjinja2cppwrapper), Ptr{Jinja2CppErrorInfo}, (Ptr{Jinja2CppResult{Ptr{Jinja2CppTemplate}}},), result)
end

#__ ErrorInfo

function jinja2cpp_error_info_get_code(error_info)
    ccall((:jinja2cpp_error_info_get_code, libjinja2cppwrapper), Int, (Ptr{Jinja2CppErrorInfo},), error_info)
end

function jinja2cpp_error_info_to_string(error_info)
    ccall((:jinja2cpp_error_info_to_string, libjinja2cppwrapper), Ptr{UInt8}, (Ptr{Jinja2CppErrorInfo},), error_info)
end

#__ Value

function jinja2cpp_value_create_empty()
    ccall((:jinja2cpp_value_create_empty, libjinja2cppwrapper), Ptr{Jinja2CppValue}, ())
end

function jinja2cpp_value_create_string(value)
    ccall((:jinja2cpp_value_create_string, libjinja2cppwrapper), Ptr{Jinja2CppValue}, (Ptr{UInt8},), value)
end

function jinja2cpp_value_create_int(value)
    ccall((:jinja2cpp_value_create_int, libjinja2cppwrapper), Ptr{Jinja2CppValue}, (Int,), value)
end

function jinja2cpp_value_create_double(value)
    ccall((:jinja2cpp_value_create_double, libjinja2cppwrapper), Ptr{Jinja2CppValue}, (Float64,), value)
end

function jinja2cpp_value_create_list(value)
    ccall((:jinja2cpp_value_create_list, libjinja2cppwrapper), Ptr{Jinja2CppValue}, (Ptr{Jinja2CppValuesList},), value)
end

function jinja2cpp_value_create_map(value)
    ccall((:jinja2cpp_value_create_map, libjinja2cppwrapper), Ptr{Jinja2CppValue}, (Ptr{Jinja2CppValuesMap},), value)
end

function jinja2cpp_value_destroy(value)
    ccall((:jinja2cpp_value_destroy, libjinja2cppwrapper), Cvoid, (Ptr{Jinja2CppValue},), value)
end

function jinja2cpp_value_is_string(value)
    ccall((:jinja2cpp_value_is_string, libjinja2cppwrapper), Bool, (Ptr{Jinja2CppValue},), value)
end

function jinja2cpp_value_is_list(value)
    ccall((:jinja2cpp_value_is_list, libjinja2cppwrapper), Bool, (Ptr{Jinja2CppValue},), value)
end

function jinja2cpp_value_is_map(value)
    ccall((:jinja2cpp_value_is_map, libjinja2cppwrapper), Bool, (Ptr{Jinja2CppValue},), value)
end

function jinja2cpp_value_is_empty(value)
    ccall((:jinja2cpp_value_is_empty, libjinja2cppwrapper), Bool, (Ptr{Jinja2CppValue},), value)
end

function jinja2cpp_value_as_string(value)
    ccall((:jinja2cpp_value_as_string, libjinja2cppwrapper), Ptr{UInt8}, (Ptr{Jinja2CppValue},), value)
end

function jinja2cpp_value_as_list(value)
    ccall((:jinja2cpp_value_as_list, libjinja2cppwrapper), Ptr{Jinja2CppValuesList}, (Ptr{Jinja2CppValue},), value)
end

function jinja2cpp_value_as_map(value)
    ccall((:jinja2cpp_value_as_map, libjinja2cppwrapper), Ptr{Jinja2CppValuesMap}, (Ptr{Jinja2CppValue},), value)
end

#__ ValuesMap

function jinja2cpp_values_map_create()
    ccall((:jinja2cpp_values_map_create, libjinja2cppwrapper), Ptr{Jinja2CppValuesMap}, ())
end

function jinja2cpp_values_map_destroy(map)
    ccall((:jinja2cpp_values_map_destroy, libjinja2cppwrapper), Cvoid, (Ptr{Jinja2CppValuesMap},), map)
end

function jinja2cpp_values_map_set(map, key, value)
    ccall((:jinja2cpp_values_map_set, libjinja2cppwrapper), Cvoid, (Ptr{Jinja2CppValuesMap}, Ptr{UInt8}, Ptr{Jinja2CppValue}), map, key, value)
end

function jinja2cpp_values_map_get(map, key)
    ccall((:jinja2cpp_values_map_get, libjinja2cppwrapper), Ptr{Jinja2CppValue}, (Ptr{Jinja2CppValuesMap}, Ptr{UInt8}), map, key)
end

function jinja2cpp_values_map_size(map)
    ccall((:jinja2cpp_values_map_size, libjinja2cppwrapper), Int, (Ptr{Jinja2CppValuesMap},), map)
end

#__ ValuesList

function jinja2cpp_values_list_create()
    ccall((:jinja2cpp_values_list_create, libjinja2cppwrapper), Ptr{Jinja2CppValuesList}, ())
end

function jinja2cpp_values_list_destroy(list)
    ccall((:jinja2cpp_values_list_destroy, libjinja2cppwrapper), Cvoid, (Ptr{Jinja2CppValuesList},), list)
end

function jinja2cpp_values_list_push(list, value)
    ccall((:jinja2cpp_values_list_push, libjinja2cppwrapper), Cvoid, (Ptr{Jinja2CppValuesList}, Ptr{Jinja2CppValue}), list, value)
end

function jinja2cpp_values_list_get(list, index)
    ccall((:jinja2cpp_values_list_get, libjinja2cppwrapper), Ptr{Jinja2CppValue}, (Ptr{Jinja2CppValuesList}, Int), list, index)
end

function jinja2cpp_values_list_size(list)
    ccall((:jinja2cpp_values_list_size, libjinja2cppwrapper), Int, (Ptr{Jinja2CppValuesList},), list)
end

#__ FileSystem

function jinja2cpp_memory_file_system_create()
    ccall((:jinja2cpp_memory_file_system_create, libjinja2cppwrapper), Ptr{Jinja2CppMemoryFileSystem}, ())
end

function jinja2cpp_memory_file_system_destroy(file_system)
    ccall((:jinja2cpp_memory_file_system_destroy, libjinja2cppwrapper), Cvoid, (Ptr{Jinja2CppMemoryFileSystem},), file_system)
end

function jinja2cpp_memory_file_system_add_file(file_system, file_name, file_content)
    ccall((:jinja2cpp_memory_file_system_add_file, libjinja2cppwrapper), Cvoid, (Ptr{Jinja2CppMemoryFileSystem}, Ptr{UInt8}, Ptr{UInt8}), file_system, file_name, file_content)
end

#__ TemplateEnv

function jinja2cpp_template_env_create()
    ccall((:jinja2cpp_template_env_create, libjinja2cppwrapper), Ptr{Jinja2CppTemplateEnv}, ())
end

function jinja2cpp_template_env_destroy(tmpl_env)
    ccall((:jinja2cpp_template_env_destroy, libjinja2cppwrapper), Cvoid, (Ptr{Jinja2CppTemplateEnv},), tmpl_env)
end

function jinja2cpp_template_env_add_filesystem_handler(tmpl_env, prefix, file_system)
    ccall((:jinja2cpp_template_env_add_filesystem_handler, libjinja2cppwrapper), Cvoid, (Ptr{Jinja2CppTemplateEnv}, Ptr{UInt8}, Ptr{Jinja2CppMemoryFileSystem}), tmpl_env, prefix, file_system)
end

function jinja2cpp_template_env_load_template(tmpl_env, file_name)
    ccall((:jinja2cpp_template_env_load_template, libjinja2cppwrapper), Ptr{Jinja2CppResult{Ptr{Jinja2CppTemplate}}}, (Ptr{Jinja2CppTemplateEnv}, Ptr{UInt8}), tmpl_env, file_name)
end

include("Jinja2Wrapper.jl")
using .Jinja2Wrapper

end
