# Jinja2Cpp.jl

[![Stable](https://img.shields.io/badge/docs-stable-blue.svg)](https://bhftbootcamp.github.io/Jinja2Cpp.jl/stable/)
[![Dev](https://img.shields.io/badge/docs-dev-blue.svg)](https://bhftbootcamp.github.io/Jinja2Cpp.jl/dev/)
[![Build Status](https://github.com/bhftbootcamp/Jinja2Cpp.jl/actions/workflows/Coverage.yml/badge.svg?branch=master)](https://github.com/bhftbootcamp/Jinja2Cpp.jl/actions/workflows/Coverage.yml?query=branch%3Amaster)
[![Coverage](https://codecov.io/gh/bhftbootcamp/Jinja2Cpp.jl/branch/master/graph/badge.svg)](https://codecov.io/gh/bhftbootcamp/Jinja2Cpp.jl)
[![Registry](https://img.shields.io/badge/registry-Green-green)](https://github.com/bhftbootcamp/Green)

Julia wrapper for the Jinja2Cpp template rendering library.

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

## Contributing

Contributions to Jinja2Cpp are welcome! If you encounter a bug, have a feature request, or would like to contribute code, please open an issue or a pull request on GitHub.
