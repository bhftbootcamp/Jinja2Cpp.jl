#__ Jinja2Value

abstract type Jinja2ValueType end

struct Jinja2StringType  <: Jinja2ValueType end
struct Jinja2IntegerType <: Jinja2ValueType end
struct Jinja2BoolType    <: Jinja2ValueType end
struct Jinja2DoubleType  <: Jinja2ValueType end
struct Jinja2ListType    <: Jinja2ValueType end
struct Jinja2MapType     <: Jinja2ValueType end
struct Jinja2EmptyType   <: Jinja2ValueType end
struct Jinja2CustomType  <: Jinja2ValueType end

@inline Jinja2ValueType(::T) where {T} = Jinja2ValueType(T)
@inline Jinja2ValueType(::Type{<:AbstractString}) = Jinja2StringType()
@inline Jinja2ValueType(::Type{<:Symbol})        = Jinja2StringType()
@inline Jinja2ValueType(::Type{<:Integer})       = Jinja2IntegerType()
@inline Jinja2ValueType(::Type{<:Bool})          = Jinja2IntegerType()
@inline Jinja2ValueType(::Type{<:AbstractFloat}) = Jinja2DoubleType()
@inline Jinja2ValueType(::Type{<:Nothing})       = Jinja2EmptyType()
@inline Jinja2ValueType(::Type{<:Missing})       = Jinja2EmptyType()
@inline Jinja2ValueType(::Type{<:AbstractVector})= Jinja2ListType()
@inline Jinja2ValueType(::Type{<:AbstractSet})   = Jinja2ListType()
@inline Jinja2ValueType(::Type{<:Tuple})         = Jinja2ListType()
@inline Jinja2ValueType(::Type{<:AbstractDict})  = Jinja2MapType()
@inline Jinja2ValueType(::Type{<:NamedTuple})    = Jinja2MapType()
@inline Jinja2ValueType(::Type{<:Any})           = Jinja2CustomType()

@inline function check_value_null(handle)
    if handle === VALUE_NULL
        throw(Jinja2Error("Failed to create Jinja2Cpp value"))
    end
    return handle
end

@inline function check_list_null(handle)
    if handle === VALUES_LIST_NULL
        throw(Jinja2Error("Failed to create Jinja2Cpp values list"))
    end
    return handle
end

@inline function check_map_null(handle)
    if handle === VALUES_MAP_NULL
        throw(Jinja2Error("Failed to create Jinja2Cpp values map"))
    end
    return handle
end

@inline function jinja_value(::Jinja2StringType, value::AbstractString)
    handle = jinja2cpp_value_create_string(value)
    return check_value_null(handle)
end

@inline function jinja_value(::Jinja2StringType, value::Symbol)
    return jinja_value(Jinja2StringType(), string(value))
end

@inline function jinja_value(::Jinja2IntegerType, value::Integer)
    handle = jinja2cpp_value_create_int(value)
    return check_value_null(handle)
end

@inline function jinja_value(::Jinja2BoolType, value::Bool)
    handle = jinja2cpp_value_create_int(value)
    return check_value_null(handle)
end

@inline function jinja_value(::Jinja2DoubleType, value::AbstractFloat)
    handle = jinja2cpp_value_create_double(value)
    return check_value_null(handle)
end

@inline function jinja_value(::Jinja2EmptyType, ::Any)
    handle = jinja2cpp_value_create_empty()
    return check_value_null(handle)
end

#__ helpers__

@inline _fieldpairs(x) = ((String(n), getfield(x, n)) for n in fieldnames(typeof(x)))

function _jinja_map(entries)
    handle = jinja2cpp_values_map_create()
    check_map_null(handle)
    for (key, value) in entries
        jinja2cpp_values_map_set(handle, String(key), jinja_value(value))
    end
    return handle
end

#__ map & list values__

@inline function jinja_value(::Jinja2MapType, entries::AbstractDict)
    handle = _jinja_map(entries)
    map_handle = jinja2cpp_value_create_map(handle)
    return check_value_null(map_handle)
end

@inline function jinja_value(::Jinja2MapType, entries::NamedTuple)
    handle = _jinja_map(pairs(entries))
    map_handle = jinja2cpp_value_create_map(handle)
    return check_value_null(map_handle)
end

@inline function jinja_value(::Jinja2CustomType, value)
    handle = _jinja_map(_fieldpairs(value))
    map_handle = jinja2cpp_value_create_map(handle)
    return check_value_null(map_handle)
end

@inline function jinja_value(::Jinja2ListType, values)
    handle = jinja2cpp_values_list_create()
    check_list_null(handle)
    for value in values
        jinja2cpp_values_list_push(handle, jinja_value(value))
    end
    list_handle = jinja2cpp_value_create_list(handle)
    return check_value_null(list_handle)
end

@inline jinja_value(value) = jinja_value(Jinja2ValueType(value), value)

convert_to_jinja_map(entries::AbstractDict) = _jinja_map(entries)
convert_to_jinja_map(entries::NamedTuple)   = _jinja_map(pairs(entries))
function convert_to_jinja_map(value)
    return _jinja_map(_fieldpairs(value))
end
