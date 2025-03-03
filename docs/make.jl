using Jinja2Cpp
using Documenter

DocMeta.setdocmeta!(Jinja2Cpp, :DocTestSetup, :(using Jinja2Cpp); recursive = true)

makedocs(;
    modules = [Jinja2Cpp],
    sitename = "Jinja2Cpp.jl",
    format = Documenter.HTML(;
        repolink = "https://github.com/bhftbootcamp/Jinja2Cpp.jl",
        canonical = "https://bhftbootcamp.github.io/Jinja2Cpp.jl",
        edit_link = "master",
        assets = ["assets/favicon.ico"],
        sidebar_sitename = true,  # Set to 'false' if the package logo already contain its name
    ),
    pages = [
        "Home"    => "index.md",
        "pages/manual.md",
        "pages/api_reference.md",
    ],
    warnonly = [:doctest, :missing_docs],
)

deploydocs(;
    repo = "github.com/bhftbootcamp/Jinja2Cpp.jl",
    devbranch = "master",
    push_preview = true,
)
