# Manual

Here are the main tools and syntax of Jinja2Cpp:

## Literals

Jinja2 supports various constant values that can be directly used inside templates for logic and data representation.

These include:
- String literals: Enclosed in single or double quotes (`"hello"`, `'world'`).
- Integer numbers: Whole numbers without decimals (`42`, `1000`).
- Floating-point numbers: Numbers with decimals (`3.14`, `2.718`).
- Lists: Ordered collections of values (`[1, 3, 4]`).
- Tuples: Immutable sequences (`(1, "one", 3.14)`).
- Dictionaries: Key-value mappings (`{'key': 'value', 'another': 42}`).

For more information see the [source](https://jinja.palletsprojects.com/en/stable/templates/#literals).

#### Examples

```@example
using Jinja2Cpp # hide
tmpl = Jinja2Template("Hello, {{ 'Julia' }}!");

result = jinja2_render(tmpl);

println(result)
```

---

```@example
using Jinja2Cpp # hide
tmpl = Jinja2Template("Integer: {{ 42 }}, Float: {{ 3.14 }}");

result = jinja2_render(tmpl);

println(result)
```

---

```@example
using Jinja2Cpp # hide
tmpl = Jinja2Template("""
{% for item in [10, 20, 30] -%}
{{ 10 * item }}
{% endfor -%}
""");

result = jinja2_render(tmpl);

println(result)
```

---

```@example
using Jinja2Cpp # hide
tmpl = Jinja2Template("""
{% for id, name in [(1, "apple"), (2, "banana"), (3, "cherry")] -%}
{{ name }} ({{ id }}) 
{% endfor -%}
""");

result = jinja2_render(tmpl);

println(result)
```

---

```@example
using Jinja2Cpp # hide
tmpl = Jinja2Template("""
{% set user = {'name'='Alice', 'age'=30, 'city'='Paris'} -%}
{% for key in user -%}
{{ key }}: {{ user[key] }}
{% endfor -%}
""");

result = jinja2_render(tmpl);

println(result)
```

## Operators

Jinja2 supports a variety of operators for performing mathematical, logical, and structural operations within templates.
These operators help manipulate data, control flow, and structure expressions dynamically.

### Mathematical Operators
- `+`, `-`, `*`, `/`: Basic arithmetic operations.
- `//`: Floor division (integer division).
- `%`: Modulo (remainder of division).
- `**`: Exponentiation (power).

### Comparison Operators
- `==`, `!=`: Equality and inequality.
- `<`, `>`, `<=`, `>=`: Less than, greater than, and their inclusive variants.

### Logical Operators
- `and`, `or`, `not`: Boolean logic for conditional expressions.

### Membership and Identity Operators
- `in`: Checks if a value exists in a sequence (`'Olivia' in users`).
- `is`: Performs identity comparison (`value is none`).

### String and Structural Operators
- `~`: String concatenation (`'Hello' ~ 'World'`).
- `()`: Controls order of operations and function calls.
- `[]`: Access list elements and dictionary keys (note that here the indexing of elements starts from `0`.).
- `.`: Access object attributes (`user.name`).

For more information see the [source](https://jinja.palletsprojects.com/en/stable/templates/#math).

## Variables

The `{{ ... }}` syntax is used for outputting variables inside templates.
It allows dynamic content rendering by inserting values from the provided context.

For more information see the [source](https://jinja.palletsprojects.com/en/stable/templates/#variables).

#### Examples

```@example
using Jinja2Cpp # hide
tmpl = Jinja2Template("Hello, {{ name }}!");

result = jinja2_render(tmpl, Dict("name" => "Julia"));

println(result)
```

---

```@example
using Jinja2Cpp # hide
tmpl = Jinja2Template("First item: {{ items[0] }}");

result = jinja2_render(tmpl, Dict("items" => ["Apple", "Banana", "Cherry"]));

println(result)
```

---

```@example
using Jinja2Cpp # hide
tmpl = Jinja2Template("""
User: {{ user[0]['name'] }}, Age: {{ user[0]['age'] }}
User: {{ user[1].name }}, Age: {{ user[1].age }}
""");

users = Dict(
    "user" => [
        Dict("name" => "Bob", "age" => 25),
        Dict("name" => "Charlie", "age" => 30),
    ],
);

result = jinja2_render(tmpl, users)

println(result)
```

## Assignments

The `{% set %}` statement allows you to define and assign values to variables within a template.
This can be useful for intermediate calculations or storing values for later use.

For more information see the [source](https://jinja.palletsprojects.com/en/stable/templates/#assignments).

#### Examples

```@example
using Jinja2Cpp # hide
tmpl = Jinja2Template("""
{% set total = price * quantity -%}
Total cost: {{ total }}
""");

result = jinja2_render(tmpl, Dict("price" => 10, "quantity" => 3));

println(result)
```

---

The `{% set %}` block allows assigning multi-line content to a variable.
This is useful for storing complex HTML structures or formatted text within a template.

```@example
using Jinja2Cpp # hide
tmpl = Jinja2Template("""
{% set message -%}
  <p>Hello, {{ name }}!</p>
  <p>Welcome to our website.</p>
{%- endset -%}
<div class="greeting">
{{ message }}
</div>
""");

result = jinja2_render(tmpl, Dict("name" => "Alexander"));

println(result)
```

## Whitespace control

Jinja2 provides whitespace control to manage extra spaces and newlines in rendered templates.
Useful for keeping clean template output, avoiding extra newlines in generated text, and improving readability in formatted templates.

#### How to Control Whitespace:
- Use `-` inside `{% ... %}` or `{{ ... }}` to trim surrounding spaces and newlines.
- For example: `{%- statement -%}` removes spaces before and after the statement.

For more information see the [source](https://jinja.palletsprojects.com/en/stable/templates/#whitespace-control).

#### Examples

```@example
using Jinja2Cpp # hide
tmpl = Jinja2Template("""
Task: 
  {{ task }}

Priority: 
  {{ priority }}
""");

result = jinja2_render(tmpl, Dict("task" => "Complete report", "priority" => "High"));

println(result)
```

---

```@example
using Jinja2Cpp # hide
tmpl = Jinja2Template("""
Task: 
  {{- task }}
Priority: 
  {{- priority }}
""");

result = jinja2_render(tmpl, Dict("task" => "Check mail", "priority" => "Low"));

println(result)
```

---

```@example
using Jinja2Cpp # hide
tmpl = Jinja2Template("""
Task: 
  {{- task -}}
Priority: 
  {{- priority -}}
""");

result = jinja2_render(tmpl, Dict("task" => "Visit meeting", "priority" => "Medium"));

println(result)
```

---

```@example
using Jinja2Cpp # hide
tmpl = Jinja2Template("""
<!-- No whitespace control -->
<ul>
{% for item in items %}
  <li>{{ item }}</li>
{% endfor %}
</ul>

<!-- With whitespace control -->
<ul>
{% for item in items -%}
  <li>{{ item }}</li>
{% endfor -%}
</ul>
""");

result = jinja2_render(tmpl, Dict("items" => ["apple", "banana", "cherry"]));

println(result)
```


## Filters

Filters allow modifying variable output inside `{{ ... }}` expressions.
They are applied using the pipe (`|`) symbol and can be chained for multiple transformations.

For more information see the [source](https://jinja.palletsprojects.com/en/stable/templates/#filters).

#### Examples

```@example
using Jinja2Cpp # hide
tmpl = Jinja2Template("{{ 'hello world' | upper }}");

result = jinja2_render(tmpl);

println(result)
```

---

```@example
using Jinja2Cpp # hide
tmpl = Jinja2Template("Price: {{ price | round(2) }}");

result = jinja2_render(tmpl, Dict("price" => 19.987));

println(result)
```

---

```@example
using Jinja2Cpp # hide
tmpl = Jinja2Template("Total items: {{ items | length }}");

result = jinja2_render(tmpl, Dict("items" => 1:5));

println(result)
```

---

```@example
using Jinja2Cpp # hide
tmpl = Jinja2Template("{{ message | replace('World', 'Jinja2') }}");

result = jinja2_render(tmpl, Dict("message" => "Hello, World!"));

println(result)
```

---

```@example
using Jinja2Cpp # hide
tmpl = Jinja2Template("Shopping list: {{ items | join(', ') }}");

result = jinja2_render(tmpl, Dict("items" => ["Milk", "Eggs", "Bread"]));

println(result)
```

Look for more filters at the [source](https://jinja.palletsprojects.com/en/stable/templates/#list-of-builtin-filters).

## Comments

Jinja2 allows adding comments in templates using `{# ... #}`.
These comments are completely removed during rendering and do not appear in the output file.
This is useful for documenting templates without affecting the final result.

For more information see the [source](https://jinja.palletsprojects.com/en/stable/templates/#comments).

#### Examples

```@example
using Jinja2Cpp # hide
tmpl = Jinja2Template("""
<!DOCTYPE html>
<html>
  <head>
    <title>Example Page</title>
  </head>
  <body>
{# This is a comment and will not be visible in the rendered output -#}
    <h1>Welcome, {{ user }}</h1>
{#
    Multi-line comments are also supported.
    They can be useful for documenting complex templates.
-#}
    <p>Your role: {{ role }}</p>
  </body>
</html>
""");

result = jinja2_render(tmpl, Dict("user" => "Emma", "role" => "Admin"));

println(result)
```

## Escaping

The `{% raw %}` block is used to prevent template expressions from being evaluated.
Any content inside `{% raw %} ... {% endraw %}` is treated as plain text, 
and Jinja2 does not process template syntax such as `{{ ... }}` or `{% ... %}` within this block.

For more information see the [source](https://jinja.palletsprojects.com/en/stable/templates/#escaping).

#### Examples

```@example
using Jinja2Cpp # hide
tmpl = Jinja2Template("""
{% raw -%}
Hello, {{ name }}!
{% endraw -%}
""");

result = jinja2_render(tmpl, Dict("name" => "Benjamin"));

println(result)
```

## If

Jinja2 allows you to use conditional statements to control the flow of your template.
The `{% if %}` statement is used to check conditions, `{% elif %}` provides alternative conditions, and `{% else %}` defines a fallback case when no previous conditions are met.

For more information see the [source](https://jinja.palletsprojects.com/en/stable/templates/#if).

#### Examples

```@example
using Jinja2Cpp # hide
tmpl = Jinja2Template("""
{% if is_admin -%}
You are an administrator.
{%- else -%}
You are a regular user.
{% endif -%}
""");

result = jinja2_render(tmpl, Dict("is_admin" => true));

println(result)
```

---

```@example
using Jinja2Cpp # hide
tmpl = Jinja2Template("""
{% if score >= 90 -%}
Grade: A
{% elif score >= 75 -%}
Grade: B
{% elif score >= 60 -%}
Grade: C
{% else -%}
Grade: F
{% endif %}
""");

result = jinja2_render(tmpl, Dict("score" => 85));

println(result)
```

## Tests

Jinja2 provides a way to perform tests within templates to check conditions or manipulate data before rendering.
These tests are useful for making decisions, applying logic, or validating the input data within the template.
Tests are typically used inside `{% if %}` statements to check for conditions like equality, existence, type, or other attributes of variables.

For more information see the [source](https://jinja.palletsprojects.com/en/stable/templates/#tests).

#### Examples

```@example
using Jinja2Cpp # hide
tmpl = Jinja2Template("""
<body>
{% if user is defined -%}
  <p>Welcome, {{ user }}!</p>
{% else %}
  <p>Please log in.</p>
{% endif -%}
{% if age > 18 -%}
  <p>You are an adult.</p>
{% else %}
  <p>You are a minor.</p>
{% endif -%}
{% if 'admin' in roles -%}
  <p>You have administrator privileges.</p>
{% else %}
  <p>You do not have administrator privileges.</p>
{% endif -%}
</body>
""");

result = jinja2_render(tmpl, Dict("user" => "John", "age" => 25, "roles" => ["user", "admin"]));

println(result)
```

See more tests [here](https://jinja.palletsprojects.com/en/stable/templates/#builtin-tests)


## For

The for loop allows iterating over sequences such as lists, tuples, dictionaries, and ranges.
It dynamically generates content for each item in the collection.

For more information see the [source](https://jinja.palletsprojects.com/en/stable/templates/#for).

#### Examples

```@example
using Jinja2Cpp # hide
tmpl = Jinja2Template("""
<ul>
{% for item in items -%}
  <li>{{ item }}</li>
{% endfor -%}
</ul>
""");

result = jinja2_render(tmpl, Dict("items" => ["apple", "banana", "cherry"]));

println(result)
```

---

Jinja2 allows adding conditions directly inside a `{% for %}` loop using an if clause.
This is useful when filtering elements during iteration without modifying the original data structure.

```@example
using Jinja2Cpp # hide
tmpl = Jinja2Template("""
<ul>
{% for product in products if product.in_stock -%}
  <li>{{ product.name }}: {{ product.price }}\$</li>
{% endfor -%}
</ul>
""");

products = [
    Dict("name" => "Laptop", "price" => 1200, "in_stock" => true),
    Dict("name" => "Smartphone", "price" => 800, "in_stock" => false),
    Dict("name" => "Headphones", "price" => 150, "in_stock" => true)
];

result = jinja2_render(tmpl, Dict("products" => products));

println(result)
```

---

!!! warning
    Please note that the current implementation does not support iteration over dictionary elements in the key-value form `{% for key, value in dict %}`.
    At the moment, iteration over a dictionary is only possible by its `keys`.
    The values ​​corresponding to these keys must be additionally extracted in the loop body.
    The issue can be found [here](https://github.com/jinja2cpp/Jinja2Cpp/issues/178).

```@example
using Jinja2Cpp # hide
tmpl = Jinja2Template("""
<ul>
{% for product in products -%}
  <li>{{ product }}: {{ products[product] }}\$</li>
{% endfor -%}
</ul>
""");

products = Dict(
    "Laptop" => 1200,
    "Smartphone" => 800,
    "Tablet" => 500,
    "Smartwatch" => 250,
    "Headphones" => 150,
    "Wireless Mouse" => 50
);

result = jinja2_render(tmpl, Dict("products" => products))

println(result)
```

## Macros

The macro statement allows you to define reusable code blocks that can be called multiple times within a template.
You can define a macro using `{% macro name(args...) %}` and call it within the template using `{{ name(args...) }}` or `{% call name(args...) %}`.
This is useful for creating reusable components like headers, footers, or custom elements, which can be easily updated and maintained.

For more information see the [source](https://jinja.palletsprojects.com/en/stable/templates/#macros).

#### Examples

```@example
using Jinja2Cpp # hide
tmpl = Jinja2Template("""
{% macro greet_user(username) -%}
Hello, {{ username }}!
{%- endmacro -%}
{{ greet_user('Charlotte') }}
{{ greet_user('Henry') }}
""");

result = jinja2_render(tmpl);

println(result)
```

---

```@example
using Jinja2Cpp # hide
tmpl = Jinja2Template("""
{% macro user(username, pass) -%}
<user name="{{ username }}" pass="{{ pass }}"/>
{%- endmacro -%}
<users>
  {{ user('Amelia', 'Qwerty123') }}
  {{ user('Ethan', 'VeryStrongPass') }}
</users>
""");

result = jinja2_render(tmpl);

println(result)
```

## Call

The `{% call %}` statement allows calling a macro that generates reusable content blocks.
Inside the macro, the special function `caller()` can be used to render the block of content passed from the `{% call %}` statement.
This is useful when you need to pass dynamic content or wrap elements within a reusable function-like structure.

#### Key Features:
- Calls a macro with or without arguments.
- Allows passing a block of content to the macro.
- Uses `caller()` inside the macro to render the passed content.

For more information see the [Child Template](@ref) or [source](https://jinja.palletsprojects.com/en/stable/templates/#call).

#### Examples

```@example
using Jinja2Cpp # hide
tmpl = Jinja2Template("""
{% macro wrap_content(title) -%}
<div class="box">
  <h2>{{ title }}</h2>
  <div class="content">
    {% block content %}{{ caller() }}{% endblock -%}
  </div>
</div>
{% endmacro -%}

{%- call wrap_content("Welcome") -%}
<p>Hello, {{ user }}! Enjoy your stay.</p>
{% endcall -%}
""");

result = jinja2_render(tmpl, Dict("user" => "Michael"));

println(result)
```

## Include

The `{% include %}` statement allows you to insert the contents of another template file into the current template.
This is useful for breaking large templates into reusable components, such as headers, footers, and navigation bars, which can be shared across multiple pages.

#### Key Features:
- Includes another template at the location of the `{% include %}` statement.
- Supports dynamic data passing, enabling flexibility in content rendering.
- If the included template is missing, it can be handled gracefully using the ignore missing option (`{% include 'file.html' ignore missing %}`).

For more information see the [source](https://jinja.palletsprojects.com/en/stable/templates/#include).

#### Examples

`header.html`:
```html
<!-- header.html -->
<header>
  <h1>Welcome to My Website</h1>
  <nav>
    <ul>
      <li><a href="/">Home</a></li>
      <li><a href="/about">About</a></li>
      <li><a href="/contact">Contact</a></li>
    </ul>
  </nav>
</header>
```

`footer.html`:
```html
<!-- footer.html -->
<footer>
  <p>&copy; 2025 My Website. All rights reserved.</p>
</footer>
```

!!! note
    When using `include` (or similar constructs that use files from your file system),  
    be sure to specify the template directory using [`Jinja2Environment`](@ref).

```@example
using Jinja2Cpp # hide
tmpl_env = Jinja2Environment("./templates")

tmpl = Jinja2Template(
  tmpl_env,
  """
  {% include "header.html" %}
  <!-- content -->
  <p>Main page content</p>
  {% include "footer.html" %}
  """,
);

result = jinja2_render(tmpl);

println(result)
```

## Import

The `{% import %}` statement allows you to load an external template as a module, making its macros and variables accessible within the current template.
This is useful for organizing reusable functions, such as macros for formatting, rendering UI components, or handling common template logic.

#### Key Features:
- Loads another template as a module.
- Allows calling macros and accessing variables from the imported template.
- Provides better namespace management compared to `{% include %}`, as it does not directly render content but imports functions for later use.

For more information see the [source](https://jinja.palletsprojects.com/en/stable/templates/#import).

#### Examples

`web_components.html`:
```html
{% macro header(title) -%}
<header>
  <h1>{{ title }}</h1>
</header>
{%- endmacro %}

{% macro nav_menu(items) -%}
<nav>
  <ul>
{% for item in items -%}
    <li><a href="/{{ item | lower }}">{{ item }}</a></li>
{% endfor -%}
  </ul>
</nav>
{%- endmacro %}

{% macro footer(year) -%}
<footer>
  <p>&copy; {{ year }}. All rights reserved.</p>
</footer>
{%- endmacro %}
```

```@example
using Jinja2Cpp # hide
tmpl_env = Jinja2Environment("./templates")

tmpl = Jinja2Template(
    tmpl_env,
    """
    {% import 'web_components.html' as web -%}
    {{ web.header(name) }}
    {{ web.nav_menu(components) }}
    {{ web.footer(year) }}
    """,
);

web = Dict(
    "name" => "My Awesome Website",
    "components" => ["Home", "About", "Services", "Contact"],
    "year" => 2025,
)

result = jinja2_render(tmpl, web);

println(result)
```

## Child Template

The `{% extends %}` and `{% block %}` statements are used together to create a template inheritance system.
This allows you to define a basic structure in a parent template, and then override specific sections in child templates.
It's perfect for maintaining a consistent layout (like headers, footers, and navigation) across multiple pages while allowing each page to define its own unique content.

#### How it works:
- `{% extends %}`: This statement is used in the child template to indicate that it is inheriting from a parent template.
- `{% block %}`: This defines a block of content that can be overridden in the child template.
    In the parent template, the block defines a placeholder for content that can be dynamically changed in the child template.

For more information see the [source](https://jinja.palletsprojects.com/en/stable/templates/#child-template).

#### Examples

`website.html`:
```html
<!DOCTYPE html>
<html>
  <head>
    <title>{% block title %}Default Title{% endblock %}</title>
  </head>
  <body>
    <header>
      <h1>My Website</h1>
    </header>
    <main>
      {% block content %}Default Content{% endblock -%}
    </main>
    <footer>
      {% block footer %}<p>&copy; 2025 My Website</p>{% endblock %}
    </footer>
  </body>
</html>
```

```@example
using Jinja2Cpp # hide
tmpl_env = Jinja2Environment("./templates")

child_template = Jinja2Template(tmpl_env, """
{% extends 'website.html' %}

{% block title %}Home Page{% endblock %}
{% block content -%}
<h2>Welcome to the Home Page!</h2>
{% endblock -%}
""");

result = jinja2_render(child_template)

println(result)
```
