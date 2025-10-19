using Test
using Jinja2Cpp

import Jinja2Cpp.Jinja2Wrapper:
    Jinja2Error,
    TEMPLATE_NULL,
    TEMPLATE_ENV_NULL,
    MEMORY_FS_NULL

@testset "Template Tests" begin
    template_source = "Hello, {{ name }}!"

    @testset "Case №1: Template creation from string" begin
        tmpl = Jinja2Template(template_source)
        @test tmpl isa Jinja2Template
        @test tmpl.handle_ptr !== TEMPLATE_NULL
        close(tmpl)
        @test tmpl.handle_ptr === TEMPLATE_NULL
    end

    @testset "Case №2: Template creation from environment and string" begin
        env = Jinja2Environment("")
        tmpl = Jinja2Template(env, template_source)
        @test tmpl isa Jinja2Template
        @test tmpl.handle_ptr !== TEMPLATE_NULL
        close(tmpl)
        @test tmpl.handle_ptr === TEMPLATE_NULL
        close(env)
        @test env.tmpl_env_ptr === TEMPLATE_ENV_NULL
    end

    @testset "Case №3: Template finalization" begin
        tmpl = Jinja2Template(template_source)
        finalize(tmpl)
        @test tmpl.handle_ptr === TEMPLATE_NULL
    end

    @testset "Case №4: Invalid source string" begin
        invalid_source = "Hello, {{ name %}}"
        @test_throws Jinja2Error Jinja2Template(invalid_source)
    end
end

@testset "Environment Tests" begin
    @testset "Case №1: Basic environment creation" begin
        env = Jinja2Environment("templates/")
        @test env isa Jinja2Environment
        @test env.tmpl_env_ptr !== TEMPLATE_ENV_NULL
        @test env.mem_fs_ptr   !== MEMORY_FS_NULL
        close(env)
        @test env.tmpl_env_ptr === TEMPLATE_ENV_NULL
        @test env.mem_fs_ptr   === MEMORY_FS_NULL
    end

    @testset "Case №2: Environment finalization" begin
        env = Jinja2Environment("templates/")
        finalize(env)
        @test env.tmpl_env_ptr === TEMPLATE_ENV_NULL
        @test env.mem_fs_ptr   === MEMORY_FS_NULL
    end
end

@testset "Render Tests" begin
    template_source = "Hello, {{ name | default('World') }}!"
    struct Hello
        name::String
    end

    @testset "Case №1: Rendering from string" begin
        tmpl = Jinja2Template(template_source)
        rendered_output = jinja2_render(tmpl, Dict("name" => "Dale Cooper"))
        @test rendered_output == "Hello, Dale Cooper!"
    end

    @testset "Case №2: Rendering without template variables" begin
        tmpl = Jinja2Template(template_source)
        rendered_output = jinja2_render(tmpl)
        @test rendered_output == "Hello, World!"
    end

    @testset "Case №3: Rendering with environment and string" begin
        env = Jinja2Environment("")
        tmpl = Jinja2Template(env, template_source)
        rendered_output = jinja2_render(tmpl, Dict("name" => "Dale Cooper"))
        @test rendered_output == "Hello, Dale Cooper!"
    end

    @testset "Case №4: Rendering with environment and file name" begin
        env = Jinja2Environment("templates/")
        tmpl = Jinja2Template(env, """ {% include "main.j2" %} """; name = "main.j2")
        rendered_output = jinja2_render(tmpl, Dict("name" => "David Lynch"))
        @test occursin("<h1>Hello, David Lynch!</h1>", rendered_output)
        @test occursin("<p>Thanks for:</p>", rendered_output)
        @test occursin("<li>Damn fine cup of coffee.</li>", rendered_output)
        @test occursin("<p>Farewell.</p>", rendered_output)
    end

    @testset "Case №5: Rendering with different template variable types" begin
        complex_template = """
            string : {{ string }}
            symbol : {{ symbol }}
            int : {{ int }}
            float : {{ float }}
            bool : {{ "True" if bool else "False" }}
            array : [{% for item in array %}{{ item }}{% if not loop.last %}, {% endif %}{% endfor %}]
            tuple : ({% for item in tuple %}{{ item }}{% if not loop.last %}, {% endif %}{% endfor %})
            dict : { 'fire': '{{ dict["fire"] }}' }
            named_tuple : { black {{ named_tuple["black"]}}, white {{ named_tuple["white"] }} }
            struct : { 'name': '{{ struct["name"] }}' }
            nothing : {{ nothing }}
            missing : {{ missing }}
        """
        context = Dict(
            "string" => "Hello, Laura Palmer!",
            "symbol" => :coffee,
            "int" => 42,
            "float" => 3.14,
            "bool" => true,
            "array" => [1, 2.2, "3"],
            "tuple" => (1, "one", 3.14),
            "dict" => Dict("fire" => "walk with me"),
            "named_tuple" => (black="lodge", white="lodge"),
            "struct" => Hello("Bob"),
            "nothing" => nothing,
            "missing" => missing,
        )
        tmpl = Jinja2Template(complex_template)
        rendered_output = jinja2_render(tmpl, context)
        @test occursin("string : Hello, Laura Palmer!", rendered_output)
        @test occursin("symbol : coffee", rendered_output)
        @test occursin("int : 42", rendered_output)
        @test occursin("float : 3.14", rendered_output)
        @test occursin("bool : True", rendered_output)
        @test occursin("array : [1, 2.2, 3]", rendered_output)
        @test occursin("tuple : (1, one, 3.14)", rendered_output)
        @test occursin("dict : { 'fire': 'walk with me' }", rendered_output)
        @test occursin("named_tuple : { black lodge, white lodge }", rendered_output)
        @test occursin("struct : { 'name': 'Bob' }", rendered_output)
        @test occursin("nothing : ", rendered_output)
        @test occursin("missing : ", rendered_output)
    end

    @testset "Case №6: Rendering with nested template variables" begin
        nested_template = "<div class='category'>{{ data.category }}</div><ul>{% for item in data.items %}<li>{{ item.name }}</li>{% endfor %}</ul>"
        tmpl = Jinja2Template(nested_template)
        nested_context = Dict(
            "data" => Dict(
                "category" => "Topics",
                "items" => [Dict("name" => "Item 1"), Dict("name" => "Item 2"), Dict("name" => "Item 3")]
            )
        )
        rendered_output = jinja2_render(tmpl, nested_context)
        @test rendered_output == "<div class='category'>Topics</div><ul><li>Item 1</li><li>Item 2</li><li>Item 3</li></ul>"
    end

    @testset "Case №7: Invalid file name" begin
        env = Jinja2Environment("templates/")
        tmpl = Jinja2Template(env, """ {% include "unknown.j2" %} """)
        @test_throws Jinja2Error jinja2_render(tmpl)
    end

    @testset "Case №8: Rendering with template variables as Struct" begin
        tmpl = Jinja2Template(template_source)
        rendered_output = jinja2_render(tmpl, Hello("Bob"))
        @test rendered_output == "Hello, Bob!"

        @kwdef struct EpisodeDirectors
            pilot::String = "David Lynch"
            episode_1::String = "Duwayne Dunham"
            episode_2::String = "David Lynch"
            episode_3::String = "Tina Rathborne"
            episode_4::String = "Tim Hunter"
            episode_5::String = "Lesli Linka Glatter"
            episode_6::String = "Caleb Deschanel"
            episode_7::String = "Mark Frost"
            episode_8::String = "David Lynch"
            episode_9::String = "David Lynch"
            episode_10::String = "Lesli Linka Glatter"
            episode_11::String = "Todd Holland"
            episode_12::String = "Graeme Clifford"
            episode_13::String = "Lesli Linka Glatter"
            episode_14::String = "David Lynch"
            episode_15::String = "Caleb Deschanel"
            episode_16::String = "Tim Hunter"
            episode_17::String = "Tina Rathborne"
            episode_18::String = "Duwayne Dunham"
            episode_19::String = "Caleb Deschanel"
            episode_20::String = "Todd Holland"
            episode_21::String = "Uli Edel"
            episode_22::String = "Diane Keaton"
            episode_23::String = "Lesli Linka Glatter"
            episode_24::String = "James Foley"
            episode_25::String = "Duwayne Dunham"
            episode_26::String = "Jonathan Sanger"
            episode_27::String = "Stephen Gyllenhaal"
            episode_28::String = "Tim Hunter"
            episode_29::String = "David Lynch"
        end
        tmpl = Jinja2Template(join([ string(n, ": ", "{{",n,"}}") for n in fieldnames(EpisodeDirectors)], "\n"))
        rendered_output = jinja2_render(tmpl, EpisodeDirectors())
        @test count("David Lynch", rendered_output) == 6
        @test count("Lesli Linka Glatter", rendered_output) == 4
        @test count("Caleb Deschanel", rendered_output) == 3
        @test count("Duwayne Dunham", rendered_output) == 3
        @test count("Tim Hunter", rendered_output) == 3
        @test count("Todd Holland", rendered_output) == 2
        @test count("Tina Rathborne", rendered_output) == 2
        @test count("Graeme Clifford", rendered_output) == 1
        @test count("Mark Frost", rendered_output) == 1
        @test count("Uli Edel", rendered_output) == 1
        @test count("James Foley", rendered_output) == 1
        @test count("Stephen Gyllenhaal", rendered_output) == 1
        @test count("Diane Keaton", rendered_output) == 1
        @test count("Jonathan Sanger", rendered_output) == 1
    end

    @testset "Case №9: Rendering with template variables as NamedTuple" begin
        tmpl = Jinja2Template(template_source)
        rendered_output = jinja2_render(tmpl, (name = "Diane",))
        @test rendered_output == "Hello, Diane!"
    end
end
