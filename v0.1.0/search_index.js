var documenterSearchIndex = {"docs":
[{"location":"pages/manual/#Manual","page":"Manual","title":"Manual","text":"","category":"section"},{"location":"pages/manual/","page":"Manual","title":"Manual","text":"Here are the main tools and syntax of Jinja2Cpp:","category":"page"},{"location":"pages/manual/#Literals","page":"Manual","title":"Literals","text":"","category":"section"},{"location":"pages/manual/","page":"Manual","title":"Manual","text":"Jinja2 supports various constant values that can be directly used inside templates for logic and data representation.","category":"page"},{"location":"pages/manual/","page":"Manual","title":"Manual","text":"These include:","category":"page"},{"location":"pages/manual/","page":"Manual","title":"Manual","text":"String literals: Enclosed in single or double quotes (\"hello\", 'world').\nInteger numbers: Whole numbers without decimals (42, 1000).\nFloating-point numbers: Numbers with decimals (3.14, 2.718).\nLists: Ordered collections of values ([1, 3, 4]).\nTuples: Immutable sequences ((1, \"one\", 3.14)).\nDictionaries: Key-value mappings ({'key': 'value', 'another': 42}).","category":"page"},{"location":"pages/manual/","page":"Manual","title":"Manual","text":"For more information see the source.","category":"page"},{"location":"pages/manual/#Examples","page":"Manual","title":"Examples","text":"","category":"section"},{"location":"pages/manual/","page":"Manual","title":"Manual","text":"using Jinja2Cpp # hide\ntmpl = Jinja2Template(\"Hello, {{ 'Julia' }}!\");\n\nresult = jinja2_render(tmpl);\n\nprintln(result)","category":"page"},{"location":"pages/manual/","page":"Manual","title":"Manual","text":"","category":"page"},{"location":"pages/manual/","page":"Manual","title":"Manual","text":"using Jinja2Cpp # hide\ntmpl = Jinja2Template(\"Integer: {{ 42 }}, Float: {{ 3.14 }}\");\n\nresult = jinja2_render(tmpl);\n\nprintln(result)","category":"page"},{"location":"pages/manual/","page":"Manual","title":"Manual","text":"","category":"page"},{"location":"pages/manual/","page":"Manual","title":"Manual","text":"using Jinja2Cpp # hide\ntmpl = Jinja2Template(\"\"\"\n{% for item in [10, 20, 30] -%}\n{{ 10 * item }}\n{% endfor -%}\n\"\"\");\n\nresult = jinja2_render(tmpl);\n\nprintln(result)","category":"page"},{"location":"pages/manual/","page":"Manual","title":"Manual","text":"","category":"page"},{"location":"pages/manual/","page":"Manual","title":"Manual","text":"using Jinja2Cpp # hide\ntmpl = Jinja2Template(\"\"\"\n{% for id, name in [(1, \"apple\"), (2, \"banana\"), (3, \"cherry\")] -%}\n{{ name }} ({{ id }}) \n{% endfor -%}\n\"\"\");\n\nresult = jinja2_render(tmpl);\n\nprintln(result)","category":"page"},{"location":"pages/manual/","page":"Manual","title":"Manual","text":"","category":"page"},{"location":"pages/manual/","page":"Manual","title":"Manual","text":"using Jinja2Cpp # hide\ntmpl = Jinja2Template(\"\"\"\n{% set user = {'name'='Alice', 'age'=30, 'city'='Paris'} -%}\n{% for key in user -%}\n{{ key }}: {{ user[key] }}\n{% endfor -%}\n\"\"\");\n\nresult = jinja2_render(tmpl);\n\nprintln(result)","category":"page"},{"location":"pages/manual/#Operators","page":"Manual","title":"Operators","text":"","category":"section"},{"location":"pages/manual/","page":"Manual","title":"Manual","text":"Jinja2 supports a variety of operators for performing mathematical, logical, and structural operations within templates. These operators help manipulate data, control flow, and structure expressions dynamically.","category":"page"},{"location":"pages/manual/#Mathematical-Operators","page":"Manual","title":"Mathematical Operators","text":"","category":"section"},{"location":"pages/manual/","page":"Manual","title":"Manual","text":"+, -, *, /: Basic arithmetic operations.\n//: Floor division (integer division).\n%: Modulo (remainder of division).\n**: Exponentiation (power).","category":"page"},{"location":"pages/manual/#Comparison-Operators","page":"Manual","title":"Comparison Operators","text":"","category":"section"},{"location":"pages/manual/","page":"Manual","title":"Manual","text":"==, !=: Equality and inequality.\n<, >, <=, >=: Less than, greater than, and their inclusive variants.","category":"page"},{"location":"pages/manual/#Logical-Operators","page":"Manual","title":"Logical Operators","text":"","category":"section"},{"location":"pages/manual/","page":"Manual","title":"Manual","text":"and, or, not: Boolean logic for conditional expressions.","category":"page"},{"location":"pages/manual/#Membership-and-Identity-Operators","page":"Manual","title":"Membership and Identity Operators","text":"","category":"section"},{"location":"pages/manual/","page":"Manual","title":"Manual","text":"in: Checks if a value exists in a sequence ('Olivia' in users).\nis: Performs identity comparison (value is none).","category":"page"},{"location":"pages/manual/#String-and-Structural-Operators","page":"Manual","title":"String and Structural Operators","text":"","category":"section"},{"location":"pages/manual/","page":"Manual","title":"Manual","text":"~: String concatenation ('Hello' ~ 'World').\n(): Controls order of operations and function calls.\n[]: Access list elements and dictionary keys.\n.: Access object attributes (user.name).","category":"page"},{"location":"pages/manual/","page":"Manual","title":"Manual","text":"note: Note\nNote that in Jinja2 syntax, element indexing starts from 0.","category":"page"},{"location":"pages/manual/","page":"Manual","title":"Manual","text":"For more information see the source.","category":"page"},{"location":"pages/manual/#Whitespace-control","page":"Manual","title":"Whitespace control","text":"","category":"section"},{"location":"pages/manual/","page":"Manual","title":"Manual","text":"Jinja2 provides whitespace control to manage extra spaces and newlines in rendered templates. Useful for keeping clean template output, avoiding extra newlines in generated text, and improving readability in formatted templates.","category":"page"},{"location":"pages/manual/#How-to-Control-Whitespace:","page":"Manual","title":"How to Control Whitespace:","text":"","category":"section"},{"location":"pages/manual/","page":"Manual","title":"Manual","text":"Use - inside {% ... %} or {{ ... }} to trim surrounding spaces and newlines.\nFor example: {%- statement -%} removes spaces before and after the statement.","category":"page"},{"location":"pages/manual/","page":"Manual","title":"Manual","text":"For more information see the source.","category":"page"},{"location":"pages/manual/#Examples-2","page":"Manual","title":"Examples","text":"","category":"section"},{"location":"pages/manual/","page":"Manual","title":"Manual","text":"using Jinja2Cpp # hide\ntmpl = Jinja2Template(\"\"\"\nTask: \n  {{ 'Complete report' }}\nPriority: \n  {{ 'High' }}\n\"\"\");\n\nresult = jinja2_render(tmpl);\n\nprintln(result)","category":"page"},{"location":"pages/manual/","page":"Manual","title":"Manual","text":"","category":"page"},{"location":"pages/manual/","page":"Manual","title":"Manual","text":"using Jinja2Cpp # hide\ntmpl = Jinja2Template(\"\"\"\nTask: \n  {{- 'Check mail' }}\nPriority: \n  {{- 'Low' }}\n\"\"\");\n\nresult = jinja2_render(tmpl);\n\nprintln(result)","category":"page"},{"location":"pages/manual/","page":"Manual","title":"Manual","text":"","category":"page"},{"location":"pages/manual/","page":"Manual","title":"Manual","text":"using Jinja2Cpp # hide\ntmpl = Jinja2Template(\"\"\"\nTask: \n  {{- 'Visit meeting' -}}\nPriority: \n  {{- 'Medium' -}}\n\"\"\");\n\nresult = jinja2_render(tmpl);\n\nprintln(result)","category":"page"},{"location":"pages/manual/","page":"Manual","title":"Manual","text":"","category":"page"},{"location":"pages/manual/","page":"Manual","title":"Manual","text":"using Jinja2Cpp # hide\ntmpl = Jinja2Template(\"\"\"\n<!-- No whitespace control -->\n<ul>\n{% for item in ['apple', 'banana', 'cherry'] %}\n  <li>{{ item }}</li>\n{% endfor %}\n</ul>\n\n<!-- With whitespace control -->\n<ul>\n{% for item in ['apple', 'banana', 'cherry'] -%}\n  <li>{{ item }}</li>\n{% endfor -%}\n</ul>\n\"\"\");\n\nresult = jinja2_render(tmpl);\n\nprintln(result)","category":"page"},{"location":"pages/manual/#Variables","page":"Manual","title":"Variables","text":"","category":"section"},{"location":"pages/manual/","page":"Manual","title":"Manual","text":"The {{ ... }} syntax is used for outputting variables inside templates. It allows dynamic content rendering by inserting values from the provided context.","category":"page"},{"location":"pages/manual/","page":"Manual","title":"Manual","text":"For more information see the source.","category":"page"},{"location":"pages/manual/#Examples-3","page":"Manual","title":"Examples","text":"","category":"section"},{"location":"pages/manual/","page":"Manual","title":"Manual","text":"using Jinja2Cpp # hide\ntmpl = Jinja2Template(\"Hello, {{ name }}!\");\n\nresult = jinja2_render(tmpl, Dict(\"name\" => \"Julia\"));\n\nprintln(result)","category":"page"},{"location":"pages/manual/","page":"Manual","title":"Manual","text":"","category":"page"},{"location":"pages/manual/","page":"Manual","title":"Manual","text":"using Jinja2Cpp # hide\ntmpl = Jinja2Template(\"First item: {{ items[0] }}\");\n\nresult = jinja2_render(tmpl, Dict(\"items\" => [\"Apple\", \"Banana\", \"Cherry\"]));\n\nprintln(result)","category":"page"},{"location":"pages/manual/","page":"Manual","title":"Manual","text":"","category":"page"},{"location":"pages/manual/","page":"Manual","title":"Manual","text":"using Jinja2Cpp # hide\ntmpl = Jinja2Template(\"\"\"\nUser: {{ user[0]['name'] }}, Age: {{ user[0]['age'] }}\nUser: {{ user[1].name }}, Age: {{ user[1].age }}\n\"\"\");\n\nusers = Dict(\n    \"user\" => [\n        Dict(\"name\" => \"Bob\", \"age\" => 25),\n        Dict(\"name\" => \"Charlie\", \"age\" => 30),\n    ],\n);\n\nresult = jinja2_render(tmpl, users)\n\nprintln(result)","category":"page"},{"location":"pages/manual/#Assignments","page":"Manual","title":"Assignments","text":"","category":"section"},{"location":"pages/manual/","page":"Manual","title":"Manual","text":"The {% set %} statement allows you to define and assign values to variables within a template. This can be useful for intermediate calculations or storing values for later use.","category":"page"},{"location":"pages/manual/","page":"Manual","title":"Manual","text":"For more information see the source.","category":"page"},{"location":"pages/manual/#Examples-4","page":"Manual","title":"Examples","text":"","category":"section"},{"location":"pages/manual/","page":"Manual","title":"Manual","text":"using Jinja2Cpp # hide\ntmpl = Jinja2Template(\"\"\"\n{% set total = price * quantity -%}\nTotal cost: {{ total }}\n\"\"\");\n\nresult = jinja2_render(tmpl, Dict(\"price\" => 10, \"quantity\" => 3));\n\nprintln(result)","category":"page"},{"location":"pages/manual/","page":"Manual","title":"Manual","text":"","category":"page"},{"location":"pages/manual/","page":"Manual","title":"Manual","text":"The {% set %} block allows assigning multi-line content to a variable. This is useful for storing complex HTML structures or formatted text within a template.","category":"page"},{"location":"pages/manual/","page":"Manual","title":"Manual","text":"using Jinja2Cpp # hide\ntmpl = Jinja2Template(\"\"\"\n{% set message -%}\n  <p>Hello, {{ name }}!</p>\n  <p>Welcome to our website.</p>\n{%- endset -%}\n<div class=\"greeting\">\n{{ message }}\n</div>\n\"\"\");\n\nresult = jinja2_render(tmpl, Dict(\"name\" => \"Alexander\"));\n\nprintln(result)","category":"page"},{"location":"pages/manual/#Filters","page":"Manual","title":"Filters","text":"","category":"section"},{"location":"pages/manual/","page":"Manual","title":"Manual","text":"Filters allow modifying variable output inside {{ ... }} expressions. They are applied using the pipe (|) symbol and can be chained for multiple transformations.","category":"page"},{"location":"pages/manual/","page":"Manual","title":"Manual","text":"For more information see the source.","category":"page"},{"location":"pages/manual/#Examples-5","page":"Manual","title":"Examples","text":"","category":"section"},{"location":"pages/manual/","page":"Manual","title":"Manual","text":"using Jinja2Cpp # hide\ntmpl = Jinja2Template(\"{{ 'hello world' | upper }}\");\n\nresult = jinja2_render(tmpl);\n\nprintln(result)","category":"page"},{"location":"pages/manual/","page":"Manual","title":"Manual","text":"","category":"page"},{"location":"pages/manual/","page":"Manual","title":"Manual","text":"using Jinja2Cpp # hide\ntmpl = Jinja2Template(\"Price: {{ price | round(2) }}\");\n\nresult = jinja2_render(tmpl, Dict(\"price\" => 19.987));\n\nprintln(result)","category":"page"},{"location":"pages/manual/","page":"Manual","title":"Manual","text":"","category":"page"},{"location":"pages/manual/","page":"Manual","title":"Manual","text":"using Jinja2Cpp # hide\ntmpl = Jinja2Template(\"Total items: {{ items | length }}\");\n\nresult = jinja2_render(tmpl, Dict(\"items\" => 1:5));\n\nprintln(result)","category":"page"},{"location":"pages/manual/","page":"Manual","title":"Manual","text":"","category":"page"},{"location":"pages/manual/","page":"Manual","title":"Manual","text":"using Jinja2Cpp # hide\ntmpl = Jinja2Template(\"{{ message | replace('World', 'Jinja2') }}\");\n\nresult = jinja2_render(tmpl, Dict(\"message\" => \"Hello, World!\"));\n\nprintln(result)","category":"page"},{"location":"pages/manual/","page":"Manual","title":"Manual","text":"","category":"page"},{"location":"pages/manual/","page":"Manual","title":"Manual","text":"using Jinja2Cpp # hide\ntmpl = Jinja2Template(\"Shopping list: {{ items | join(', ') }}\");\n\nresult = jinja2_render(tmpl, Dict(\"items\" => [\"Milk\", \"Eggs\", \"Bread\"]));\n\nprintln(result)","category":"page"},{"location":"pages/manual/","page":"Manual","title":"Manual","text":"Look for more filters at the source.","category":"page"},{"location":"pages/manual/#Comments","page":"Manual","title":"Comments","text":"","category":"section"},{"location":"pages/manual/","page":"Manual","title":"Manual","text":"Jinja2 allows adding comments in templates using {# ... #}. These comments are completely removed during rendering and do not appear in the output file. This is useful for documenting templates without affecting the final result.","category":"page"},{"location":"pages/manual/","page":"Manual","title":"Manual","text":"For more information see the source.","category":"page"},{"location":"pages/manual/#Examples-6","page":"Manual","title":"Examples","text":"","category":"section"},{"location":"pages/manual/","page":"Manual","title":"Manual","text":"using Jinja2Cpp # hide\ntmpl = Jinja2Template(\"\"\"\n<!DOCTYPE html>\n<html>\n  <head>\n    <title>Example Page</title>\n  </head>\n  <body>\n{# This is a comment and will not be visible in the rendered output -#}\n    <h1>Welcome, {{ user }}</h1>\n{#\n    Multi-line comments are also supported.\n    They can be useful for documenting complex templates.\n-#}\n    <p>Your role: {{ role }}</p>\n  </body>\n</html>\n\"\"\");\n\nresult = jinja2_render(tmpl, Dict(\"user\" => \"Emma\", \"role\" => \"Admin\"));\n\nprintln(result)","category":"page"},{"location":"pages/manual/#Escaping","page":"Manual","title":"Escaping","text":"","category":"section"},{"location":"pages/manual/","page":"Manual","title":"Manual","text":"The {% raw %} block is used to prevent template expressions from being evaluated. Any content inside {% raw %} ... {% endraw %} is treated as plain text,  and Jinja2 does not process template syntax such as {{ ... }} or {% ... %} within this block.","category":"page"},{"location":"pages/manual/","page":"Manual","title":"Manual","text":"For more information see the source.","category":"page"},{"location":"pages/manual/#Examples-7","page":"Manual","title":"Examples","text":"","category":"section"},{"location":"pages/manual/","page":"Manual","title":"Manual","text":"using Jinja2Cpp # hide\ntmpl = Jinja2Template(\"\"\"\n{% raw -%}\nHello, {{ name }}!\n{% endraw -%}\n\"\"\");\n\nresult = jinja2_render(tmpl, Dict(\"name\" => \"Benjamin\"));\n\nprintln(result)","category":"page"},{"location":"pages/manual/#If","page":"Manual","title":"If","text":"","category":"section"},{"location":"pages/manual/","page":"Manual","title":"Manual","text":"Jinja2 allows you to use conditional statements to control the flow of your template. The {% if %} statement is used to check conditions, {% elif %} provides alternative conditions, and {% else %} defines a fallback case when no previous conditions are met.","category":"page"},{"location":"pages/manual/","page":"Manual","title":"Manual","text":"For more information see the source.","category":"page"},{"location":"pages/manual/#Examples-8","page":"Manual","title":"Examples","text":"","category":"section"},{"location":"pages/manual/","page":"Manual","title":"Manual","text":"using Jinja2Cpp # hide\ntmpl = Jinja2Template(\"\"\"\n{% if is_admin -%}\nYou are an administrator.\n{%- else -%}\nYou are a regular user.\n{% endif -%}\n\"\"\");\n\nresult = jinja2_render(tmpl, Dict(\"is_admin\" => true));\n\nprintln(result)","category":"page"},{"location":"pages/manual/","page":"Manual","title":"Manual","text":"","category":"page"},{"location":"pages/manual/","page":"Manual","title":"Manual","text":"using Jinja2Cpp # hide\ntmpl = Jinja2Template(\"\"\"\n{% if score >= 90 -%}\nGrade: A\n{% elif score >= 75 -%}\nGrade: B\n{% elif score >= 60 -%}\nGrade: C\n{% else -%}\nGrade: F\n{% endif %}\n\"\"\");\n\nresult = jinja2_render(tmpl, Dict(\"score\" => 85));\n\nprintln(result)","category":"page"},{"location":"pages/manual/#Tests","page":"Manual","title":"Tests","text":"","category":"section"},{"location":"pages/manual/","page":"Manual","title":"Manual","text":"Jinja2 provides a way to perform tests within templates to check conditions or manipulate data before rendering. These tests are useful for making decisions, applying logic, or validating the input data within the template. Tests are typically used inside {% if %} statements to check for conditions like equality, existence, type, or other attributes of variables.","category":"page"},{"location":"pages/manual/","page":"Manual","title":"Manual","text":"For more information see the source.","category":"page"},{"location":"pages/manual/#Examples-9","page":"Manual","title":"Examples","text":"","category":"section"},{"location":"pages/manual/","page":"Manual","title":"Manual","text":"using Jinja2Cpp # hide\ntmpl = Jinja2Template(\"\"\"\n<body>\n{% if user is defined -%}\n  <p>Welcome, {{ user }}!</p>\n{% else %}\n  <p>Please log in.</p>\n{% endif -%}\n{% if age > 18 -%}\n  <p>You are an adult.</p>\n{% else %}\n  <p>You are a minor.</p>\n{% endif -%}\n{% if 'admin' in roles -%}\n  <p>You have administrator privileges.</p>\n{% else %}\n  <p>You do not have administrator privileges.</p>\n{% endif -%}\n</body>\n\"\"\");\n\nresult = jinja2_render(tmpl, Dict(\"user\" => \"John\", \"age\" => 25, \"roles\" => [\"user\", \"admin\"]));\n\nprintln(result)","category":"page"},{"location":"pages/manual/","page":"Manual","title":"Manual","text":"See more tests here","category":"page"},{"location":"pages/manual/#For","page":"Manual","title":"For","text":"","category":"section"},{"location":"pages/manual/","page":"Manual","title":"Manual","text":"The for loop allows iterating over sequences such as lists, tuples, dictionaries, and ranges. It dynamically generates content for each item in the collection.","category":"page"},{"location":"pages/manual/","page":"Manual","title":"Manual","text":"For more information see the source.","category":"page"},{"location":"pages/manual/#Examples-10","page":"Manual","title":"Examples","text":"","category":"section"},{"location":"pages/manual/","page":"Manual","title":"Manual","text":"using Jinja2Cpp # hide\ntmpl = Jinja2Template(\"\"\"\n<ul>\n{% for item in items -%}\n  <li>{{ item }}</li>\n{% endfor -%}\n</ul>\n\"\"\");\n\nresult = jinja2_render(tmpl, Dict(\"items\" => [\"apple\", \"banana\", \"cherry\"]));\n\nprintln(result)","category":"page"},{"location":"pages/manual/","page":"Manual","title":"Manual","text":"","category":"page"},{"location":"pages/manual/","page":"Manual","title":"Manual","text":"Jinja2 allows adding conditions directly inside a {% for %} loop using an if clause. This is useful when filtering elements during iteration without modifying the original data structure.","category":"page"},{"location":"pages/manual/","page":"Manual","title":"Manual","text":"using Jinja2Cpp # hide\ntmpl = Jinja2Template(\"\"\"\n<ul>\n{% for product in products if product.in_stock -%}\n  <li>{{ product.name }}: {{ product.price }}\\$</li>\n{% endfor -%}\n</ul>\n\"\"\");\n\nproducts = [\n    Dict(\"name\" => \"Laptop\", \"price\" => 1200, \"in_stock\" => true),\n    Dict(\"name\" => \"Smartphone\", \"price\" => 800, \"in_stock\" => false),\n    Dict(\"name\" => \"Headphones\", \"price\" => 150, \"in_stock\" => true)\n];\n\nresult = jinja2_render(tmpl, Dict(\"products\" => products));\n\nprintln(result)","category":"page"},{"location":"pages/manual/","page":"Manual","title":"Manual","text":"","category":"page"},{"location":"pages/manual/","page":"Manual","title":"Manual","text":"warning: Warning\nPlease note that the current implementation does not support iteration over dictionary elements in the key-value form {% for key, value in dict %}. At the moment, iteration over a dictionary is only possible by its keys. The values ​​corresponding to these keys must be additionally extracted in the loop body. The issue can be found here.","category":"page"},{"location":"pages/manual/","page":"Manual","title":"Manual","text":"using Jinja2Cpp # hide\ntmpl = Jinja2Template(\"\"\"\n<ul>\n{% for product in products -%}\n  <li>{{ product }}: {{ products[product] }}\\$</li>\n{% endfor -%}\n</ul>\n\"\"\");\n\nproducts = Dict(\n    \"Laptop\" => 1200,\n    \"Smartphone\" => 800,\n    \"Tablet\" => 500,\n    \"Smartwatch\" => 250,\n    \"Headphones\" => 150,\n    \"Wireless Mouse\" => 50\n);\n\nresult = jinja2_render(tmpl, Dict(\"products\" => products))\n\nprintln(result)","category":"page"},{"location":"pages/manual/#Macros","page":"Manual","title":"Macros","text":"","category":"section"},{"location":"pages/manual/","page":"Manual","title":"Manual","text":"The macro statement allows you to define reusable code blocks that can be called multiple times within a template. You can define a macro using {% macro name(args...) %} and call it within the template using {{ name(args...) }} or {% call name(args...) %}. This is useful for creating reusable components like headers, footers, or custom elements, which can be easily updated and maintained.","category":"page"},{"location":"pages/manual/","page":"Manual","title":"Manual","text":"For more information see the source.","category":"page"},{"location":"pages/manual/#Examples-11","page":"Manual","title":"Examples","text":"","category":"section"},{"location":"pages/manual/","page":"Manual","title":"Manual","text":"using Jinja2Cpp # hide\ntmpl = Jinja2Template(\"\"\"\n{% macro greet_user(username) -%}\nHello, {{ username }}!\n{%- endmacro -%}\n{{ greet_user('Charlotte') }}\n{{ greet_user(name) }}\n\"\"\");\n\nresult = jinja2_render(tmpl, Dict(\"name\" => \"Henry\"));\n\nprintln(result)","category":"page"},{"location":"pages/manual/","page":"Manual","title":"Manual","text":"","category":"page"},{"location":"pages/manual/","page":"Manual","title":"Manual","text":"using Jinja2Cpp # hide\ntmpl = Jinja2Template(\"\"\"\n{% macro user(username, password) -%}\n<user name=\"{{ username }}\" pass=\"{{ password }}\"/>\n{%- endmacro -%}\n<users>\n  {{ user('Amelia', 'Qwerty123') }}\n  {{ user(name, pass) }}\n</users>\n\"\"\");\n\nresult = jinja2_render(tmpl, Dict(\"name\" => \"Ethan\", \"pass\" => \"VeryStrongPass\"));\n\nprintln(result)","category":"page"},{"location":"pages/manual/#Call","page":"Manual","title":"Call","text":"","category":"section"},{"location":"pages/manual/","page":"Manual","title":"Manual","text":"The {% call %} statement allows calling a macro that generates reusable content blocks. Inside the macro, the special function caller() can be used to render the block of content passed from the {% call %} statement. This is useful when you need to pass dynamic content or wrap elements within a reusable function-like structure.","category":"page"},{"location":"pages/manual/#Key-Features:","page":"Manual","title":"Key Features:","text":"","category":"section"},{"location":"pages/manual/","page":"Manual","title":"Manual","text":"Calls a macro with or without arguments.\nAllows passing a block of content to the macro.\nUses caller() inside the macro to render the passed content.","category":"page"},{"location":"pages/manual/","page":"Manual","title":"Manual","text":"For more information see the Child Template or source.","category":"page"},{"location":"pages/manual/#Examples-12","page":"Manual","title":"Examples","text":"","category":"section"},{"location":"pages/manual/","page":"Manual","title":"Manual","text":"using Jinja2Cpp # hide\ntmpl = Jinja2Template(\"\"\"\n{% macro wrap_content(title) -%}\n<div class=\"box\">\n  <h2>{{ title }}</h2>\n  <div class=\"content\">\n    {% block content %}{{ caller() }}{% endblock -%}\n  </div>\n</div>\n{% endmacro -%}\n\n{%- call wrap_content(\"Welcome\") -%}\n<p>Hello, {{ user }}! Enjoy your stay.</p>\n{% endcall -%}\n\"\"\");\n\nresult = jinja2_render(tmpl, Dict(\"user\" => \"Michael\"));\n\nprintln(result)","category":"page"},{"location":"pages/manual/#Include","page":"Manual","title":"Include","text":"","category":"section"},{"location":"pages/manual/","page":"Manual","title":"Manual","text":"The {% include %} statement allows you to insert the contents of another template file into the current template. This is useful for breaking large templates into reusable components, such as headers, footers, and navigation bars, which can be shared across multiple pages.","category":"page"},{"location":"pages/manual/#Key-Features:-2","page":"Manual","title":"Key Features:","text":"","category":"section"},{"location":"pages/manual/","page":"Manual","title":"Manual","text":"Includes another template at the location of the {% include %} statement.\nSupports dynamic data passing, enabling flexibility in content rendering.\nIf the included template is missing, it can be handled gracefully using the ignore missing option ({% include 'file.html' ignore missing %}).","category":"page"},{"location":"pages/manual/","page":"Manual","title":"Manual","text":"For more information see the source.","category":"page"},{"location":"pages/manual/#Examples-13","page":"Manual","title":"Examples","text":"","category":"section"},{"location":"pages/manual/","page":"Manual","title":"Manual","text":"header.html:","category":"page"},{"location":"pages/manual/","page":"Manual","title":"Manual","text":"<!-- header.html -->\n<header>\n  <h1>Welcome to My Website</h1>\n  <nav>\n    <ul>\n      <li><a href=\"/\">Home</a></li>\n      <li><a href=\"/about\">About</a></li>\n      <li><a href=\"/contact\">Contact</a></li>\n    </ul>\n  </nav>\n</header>","category":"page"},{"location":"pages/manual/","page":"Manual","title":"Manual","text":"footer.html:","category":"page"},{"location":"pages/manual/","page":"Manual","title":"Manual","text":"<!-- footer.html -->\n<footer>\n  <p>&copy; 2025 My Website. All rights reserved.</p>\n</footer>","category":"page"},{"location":"pages/manual/","page":"Manual","title":"Manual","text":"note: Note\nWhen using include (or similar constructs that use files from your file system),   be sure to specify the template directory using Jinja2Environment.","category":"page"},{"location":"pages/manual/","page":"Manual","title":"Manual","text":"using Jinja2Cpp # hide\ntmpl_env = Jinja2Environment(\"./templates\")\n\ntmpl = Jinja2Template(\n  tmpl_env,\n  \"\"\"\n  {% include \"header.html\" %}\n  <!-- content -->\n  <p>Main page content</p>\n  {% include \"footer.html\" %}\n  \"\"\",\n);\n\nresult = jinja2_render(tmpl);\n\nprintln(result)","category":"page"},{"location":"pages/manual/#Import","page":"Manual","title":"Import","text":"","category":"section"},{"location":"pages/manual/","page":"Manual","title":"Manual","text":"The {% import %} statement allows you to load an external template as a module, making its macros and variables accessible within the current template. This is useful for organizing reusable functions, such as macros for formatting, rendering UI components, or handling common template logic.","category":"page"},{"location":"pages/manual/#Key-Features:-3","page":"Manual","title":"Key Features:","text":"","category":"section"},{"location":"pages/manual/","page":"Manual","title":"Manual","text":"Loads another template as a module.\nAllows calling macros and accessing variables from the imported template.\nProvides better namespace management compared to {% include %}, as it does not directly render content but imports functions for later use.","category":"page"},{"location":"pages/manual/","page":"Manual","title":"Manual","text":"For more information see the source.","category":"page"},{"location":"pages/manual/#Examples-14","page":"Manual","title":"Examples","text":"","category":"section"},{"location":"pages/manual/","page":"Manual","title":"Manual","text":"web_components.html:","category":"page"},{"location":"pages/manual/","page":"Manual","title":"Manual","text":"{% macro header(title) -%}\n<header>\n  <h1>{{ title }}</h1>\n</header>\n{%- endmacro %}\n\n{% macro nav_menu(items) -%}\n<nav>\n  <ul>\n{% for item in items -%}\n    <li><a href=\"/{{ item | lower }}\">{{ item }}</a></li>\n{% endfor -%}\n  </ul>\n</nav>\n{%- endmacro %}\n\n{% macro footer(year) -%}\n<footer>\n  <p>&copy; {{ year }}. All rights reserved.</p>\n</footer>\n{%- endmacro %}","category":"page"},{"location":"pages/manual/","page":"Manual","title":"Manual","text":"using Jinja2Cpp # hide\ntmpl_env = Jinja2Environment(\"./templates\")\n\ntmpl = Jinja2Template(\n    tmpl_env,\n    \"\"\"\n    {% import 'web_components.html' as web -%}\n    {{ web.header(name) }}\n    {{ web.nav_menu(components) }}\n    {{ web.footer(year) }}\n    \"\"\",\n);\n\nweb = Dict(\n    \"name\" => \"My Awesome Website\",\n    \"components\" => [\"Home\", \"About\", \"Services\", \"Contact\"],\n    \"year\" => 2025,\n)\n\nresult = jinja2_render(tmpl, web);\n\nprintln(result)","category":"page"},{"location":"pages/manual/#Child-Template","page":"Manual","title":"Child Template","text":"","category":"section"},{"location":"pages/manual/","page":"Manual","title":"Manual","text":"The {% extends %} and {% block %} statements are used together to create a template inheritance system. This allows you to define a basic structure in a parent template, and then override specific sections in child templates. It's perfect for maintaining a consistent layout (like headers, footers, and navigation) across multiple pages while allowing each page to define its own unique content.","category":"page"},{"location":"pages/manual/#How-it-works:","page":"Manual","title":"How it works:","text":"","category":"section"},{"location":"pages/manual/","page":"Manual","title":"Manual","text":"{% extends %}: This statement is used in the child template to indicate that it is inheriting from a parent template.\n{% block %}: This defines a block of content that can be overridden in the child template.   In the parent template, the block defines a placeholder for content that can be dynamically changed in the child template.","category":"page"},{"location":"pages/manual/","page":"Manual","title":"Manual","text":"For more information see the source.","category":"page"},{"location":"pages/manual/#Examples-15","page":"Manual","title":"Examples","text":"","category":"section"},{"location":"pages/manual/","page":"Manual","title":"Manual","text":"website.html:","category":"page"},{"location":"pages/manual/","page":"Manual","title":"Manual","text":"<!DOCTYPE html>\n<html>\n  <head>\n    <title>{% block title %}Default Title{% endblock %}</title>\n  </head>\n  <body>\n    <header>\n      <h1>My Website</h1>\n    </header>\n    <main>\n      {% block content %}Default Content{% endblock -%}\n    </main>\n    <footer>\n      {% block footer %}<p>&copy; 2025 My Website</p>{% endblock %}\n    </footer>\n  </body>\n</html>","category":"page"},{"location":"pages/manual/","page":"Manual","title":"Manual","text":"using Jinja2Cpp # hide\ntmpl_env = Jinja2Environment(\"./templates\")\n\nchild_template = Jinja2Template(tmpl_env, \"\"\"\n{% extends 'website.html' %}\n\n{% block title %}Home Page{% endblock %}\n{% block content -%}\n<h2>Welcome to the Home Page!</h2>\n{% endblock -%}\n\"\"\");\n\nresult = jinja2_render(child_template)\n\nprintln(result)","category":"page"},{"location":"#Jinja2Cpp.jl","page":"Home","title":"Jinja2Cpp.jl","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"Julia wrapper for Jinja2Cpp for Jinja2 template rendering.","category":"page"},{"location":"#Installation","page":"Home","title":"Installation","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"If you haven't installed our local registry yet, do that first:","category":"page"},{"location":"","page":"Home","title":"Home","text":"] registry add https://github.com/bhftbootcamp/Green.git","category":"page"},{"location":"","page":"Home","title":"Home","text":"To install Jinja2Cpp, simply use the Julia package manager:","category":"page"},{"location":"","page":"Home","title":"Home","text":"] add Jinja2Cpp","category":"page"},{"location":"#Usage","page":"Home","title":"Usage","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"This example shows the basic tools for rendering a Jinja2 template depending on the passed values.","category":"page"},{"location":"","page":"Home","title":"Home","text":"using Jinja2Cpp\n\nsource = \"\"\"\n{% set greetings = {\n    \"en\" = {\"text\"=\"Hello\",   \"flag\"=\"🇬🇧\"},\n    \"es\" = {\"text\"=\"¡Hola\",   \"flag\"=\"🇪🇸\"},\n    \"fr\" = {\"text\"=\"Bonjour\", \"flag\"=\"🇫🇷\"},\n    \"de\" = {\"text\"=\"Hallo\",   \"flag\"=\"🇩🇪\"},\n    \"ru\" = {\"text\"=\"Привет\",  \"flag\"=\"🇷🇺\"},\n    \"zh\" = {\"text\"=\"你好\",     \"flag\"=\"🇨🇳\"}\n} %}\n\n{%- if user_lang in greetings | list -%}\n{{- greetings[user_lang].flag }} {{ greetings[user_lang].text -}}\n{% else -%}\n🌍 Hello, world!\n{%- endif -%}\n\"\"\"\n\ntmpl = Jinja2Template(source)\n\njulia> jinja2_render(tmpl, Dict(\"user_lang\" => \"es\"))\n\"🇪🇸 ¡Hola\"\n\njulia> jinja2_render(tmpl, Dict(\"user_lang\" => \"zh\"))\n\"🇨🇳 你好\"\n\njulia> jinja2_render(tmpl)\n\"🌍 Hello, world!\"","category":"page"},{"location":"#Useful-Links","page":"Home","title":"Useful Links","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"Jinja2Cpp – Official library repository.  \nJinja2Cpp_jll.jl – Julia C++ wrapper.\nJinja2CppWrapper_jll.jl – Julia C wrapper.","category":"page"},{"location":"pages/api_reference/#API-Reference","page":"API Reference","title":"API Reference","text":"","category":"section"},{"location":"pages/api_reference/","page":"API Reference","title":"API Reference","text":"Jinja2Environment\nJinja2Environment(::AbstractString)\nJinja2Template\nJinja2Template(::AbstractString)\njinja2_render","category":"page"},{"location":"pages/api_reference/#Jinja2Cpp.Jinja2Wrapper.Jinja2Environment","page":"API Reference","title":"Jinja2Cpp.Jinja2Wrapper.Jinja2Environment","text":"Jinja2Environment\n\nType describing the context and settings of the Jinja2Template.\n\nFor more information see the source.\n\n\n\n\n\n","category":"type"},{"location":"pages/api_reference/#Jinja2Cpp.Jinja2Wrapper.Jinja2Environment-Tuple{AbstractString}","page":"API Reference","title":"Jinja2Cpp.Jinja2Wrapper.Jinja2Environment","text":"Jinja2Environment(tmpl_dir::String)\n\nCreates a new environment object used for more flexible template customization. The tmpl_dir parameter specifies the directory path relative to which templates will be searched (when using constructions such as {% include %}, {% import %} or {% extend %}).\n\n\n\n\n\n","category":"method"},{"location":"pages/api_reference/#Jinja2Cpp.Jinja2Wrapper.Jinja2Template","page":"API Reference","title":"Jinja2Cpp.Jinja2Wrapper.Jinja2Template","text":"Jinja2Template\n\nA type containing information about the Jinja2 template used.\n\n\n\n\n\n","category":"type"},{"location":"pages/api_reference/#Jinja2Cpp.Jinja2Wrapper.Jinja2Template-Tuple{AbstractString}","page":"API Reference","title":"Jinja2Cpp.Jinja2Wrapper.Jinja2Template","text":"Jinja2Template([tmpl_env::Jinja2Environment, ] source::String; name::String = \"\")\n\nCreates a template object using a source Jinja2 string. In addition, the environment context tmpl_env can be passed. The optional name is used for debugging errors.\n\n\n\n\n\n","category":"method"},{"location":"pages/api_reference/#Jinja2Cpp.Jinja2Wrapper.jinja2_render","page":"API Reference","title":"Jinja2Cpp.Jinja2Wrapper.jinja2_render","text":"jinja2_render(template::Jinja2Template, [, values]) -> String\n\nRenders the provided Jinja2 template, replacing the template's placeholders with the corresponding values from vals.\n\nExample\n\njulia> tmpl = Jinja2Template(\"<p>Hello, {{ name }}!</p>\");\n\njulia> result = jinja2_render(tmpl, Dict(\"name\" => \"Julia\"))\n\"<p>Hello, Julia!</p>\"\n\nYou can find more examples in Manual section.\n\n\n\n\n\n","category":"function"},{"location":"pages/api_reference/","page":"API Reference","title":"API Reference","text":"Jinja2Error","category":"page"},{"location":"pages/api_reference/#Jinja2Cpp.Jinja2Wrapper.Jinja2Error","page":"API Reference","title":"Jinja2Cpp.Jinja2Wrapper.Jinja2Error","text":"Jinja2Error <: Exception\n\nError thrown when Jinja2 syntax is invalid.\n\nFields\n\ncode::Int: Error code.\nmessage::String: Error message.\n\n\n\n\n\n","category":"type"}]
}
