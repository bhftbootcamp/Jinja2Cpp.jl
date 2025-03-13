# Jinja2Cpp.jl

Julia wrapper for Jinja2Cpp for Jinja2 template rendering.

## Installation

If you haven't installed our [local registry](https://github.com/bhftbootcamp/Green) yet, do that first:

```
] registry add https://github.com/bhftbootcamp/Green.git
```

To install Jinja2Cpp, simply use the Julia package manager:

```julia
] add Jinja2Cpp
```

## Usage

This example shows the basic tools for rendering a Jinja2 template depending on the passed values.

```julia
using Jinja2Cpp

source = """
{% set greetings = {
    "en" = {"text"="Hello",   "flag"="🇬🇧"},
    "es" = {"text"="¡Hola",   "flag"="🇪🇸"},
    "fr" = {"text"="Bonjour", "flag"="🇫🇷"},
    "de" = {"text"="Hallo",   "flag"="🇩🇪"},
    "ru" = {"text"="Привет",  "flag"="🇷🇺"},
    "zh" = {"text"="你好",     "flag"="🇨🇳"}
} %}

{%- if user_lang in greetings | list -%}
{{- greetings[user_lang].flag }} {{ greetings[user_lang].text -}}
{% else -%}
🌍 Hello, world!
{%- endif -%}
"""

tmpl = Jinja2Template(source)

julia> jinja2_render(tmpl, Dict("user_lang" => "es"))
"🇪🇸 ¡Hola"

julia> jinja2_render(tmpl, Dict("user_lang" => "zh"))
"🇨🇳 你好"

julia> jinja2_render(tmpl)
"🌍 Hello, world!"
```

## Useful Links

- [Jinja2Cpp](https://github.com/jinja2cpp/Jinja2Cpp) – Official library repository.  
- [Jinja2Cpp_jll.jl](https://github.com/JuliaBinaryWrappers/Jinja2Cpp_jll.jl) – Julia wrapper for Jinja2Cpp (C++).  
- [Jinja2CppWrapper_jll.jl](https://github.com/JuliaBinaryWrappers/Jinja2CppWrapper_jll.jl) – Julia wrapper for Jinja2Cpp (C).
