# Dexlivery

## Table of Contents

- [About](#about)
- [Bash Commands](#bash_commands)
- [Elixir Commands](#elixir_commands)
- [Docs](#docs)
- [Resources](#resources)

## About <a name = "about"></a>

A demo Elixir program that
It uses `Structs` as `Data Transfer Objects`, and `Agents` to persist
state between precesses.

## Bash Commands <a name = "bash_commands"></a>

```bash
# Create new Elixir project
$ mix new project_name
# Intall dependencies
$ mix deps.get
# Generate linter config
$ mix credo gen.config
# Run linter
$ mix credo --strict
# Start your project as an Interactive Elixir session
$ iex -S mix
# Run tests
$ mix test
```

## Elixir Commands <a name = "elixir_commands"></a>

Structs (named maps that belong to a module):

```elixir
> %Dexlivery.Users.User{}
%Dexlivery.Users.User{email: nil, name: nil, cpf: nil, age: nil}
> alias Dexlivery.Users.User
> %User{}
%Dexlivery.Users.User{email: nil, name: nil, cpf: nil, age: nil}
> huey = %User{email: "hueylewis@andthenews.com", name: "Huey Lewis"}
%Dexlivery.Users.User{
  age: nil,
  cpf: nil,
  email: "hueylewis@andthenews.com",
  name: "Huey Lewis"
}
> Map.put(huey, :age, 70)
%Dexlivery.Users.User{
  age: 70,
  cpf: nil,
  email: "hueylewis@andthenews.com",
  name: "Huey Lewis"
}
> %{huey | cpf: "1234567"}
%Dexlivery.Users.User{
  age: nil,
  cpf: "1234567",
  email: "hueylewis@andthenews.com",
  name: "Huey Lewis"
}
> %{huey | ssn: "1234567"}
** (KeyError) key :ssn not found in: %Dexlivery.Users.User{age: nil, cpf: nil, email: "hueylewis@andthenews.com", name: "Huey Lewis"}
> %User{name: username} = huey
> username
"Huey Lewis"
```

## Docs <a name = "docs"></a>

- https://elixir-lang.org/crash-course.html
- https://elixir-lang.org/getting-started/mix-otp/agent.html
- https://github.com/rrrene/credo

## Resources <a name = "resources"></a>

- https://marketplace.visualstudio.com/items?itemName=pantajoe.vscode-elixir-credo
- https://www.tutorialspoint.com/elixir/elixir_structs.htm
