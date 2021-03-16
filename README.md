# Dexlivery

## Table of Contents

- [About](#about)
- [Bash Commands](#bash_commands)
- [Elixir Commands](#elixir_commands)
- [Libs](#libs)
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
# Run console on test environment
$ MIX_ENV=test iex -S mix
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

Decimal lib (to accurately deal with money):

```elixir
> Decimal.cast("42.42")
{:ok, #Decimal<42.42>}
> Decimal.cast(42.42)
{:ok, #Decimal<42.42>}
> Decimal.new("42.42")
#Decimal<42.42>
> Decimal.new(42.42)
** (FunctionClauseError) no function clause matching in Decimal.new/1
```

Creating an Order:

```elixir
> {:ok, item1} = Dexlivery.Orders.Item.build(40.42, 1, "Penne Arrabiata", :italian, "Spicy, good cold.")
> {:ok, item2} = Dexlivery.Orders.Item.build(22.3, 2, "Cheese Pizza", :pizza, "Tasty")
> {:ok, user} = Dexlivery.Users.User.build("Tony Soprano", "tony@jerseyoutfit.org", "14 Aspen Drive, North Caldwell", "123-45-6789", 34)
> Dexlivery.Orders.Order.build(user, [item1, item2])
{:ok,
 %Dexlivery.Orders.Order{
   delivery_address: "14 Aspen Drive, North Caldwell",
   items: [
     %Dexlivery.Orders.Item{
       category: :italian,
       description: "Spicy, good cold.",
       name: "Penne Arrabiata",
       quantity: 1,
       unit_price: #Decimal<40.42>
     },
     %Dexlivery.Orders.Item{
       category: :pizza,
       description: "Tasty",
       name: "Cheese Pizza",
       quantity: 2,
       unit_price: #Decimal<22.3>
     }
   ],
   total_price: #Decimal<85.02>,
   user_cpf: "123-45-6789"
 }}
> Dexlivery.Orders.Order.build("bad", [item1, item2])
{:error, "Invalid parameters."}
> Dexlivery.Orders.Order.build(user, "bad")
{:error, "Invalid parameters."}
```

ExMachina Lib (like Factory Bot):

```elixir
> ExMachina.sequence(:email, &"email-#{&1}@example.com")
"email-0@example.com"
> ExMachina.sequence(:role, ["admin", "user", "other"])
"admin"
```

## Libs <a name = "libs"></a>

- https://github.com/rrrene/credo
- https://github.com/ericmj/decimal
- https://github.com/thoughtbot/ex_machina

## Docs <a name = "docs"></a>

- https://elixir-lang.org/crash-course.html
- https://elixir-lang.org/getting-started/mix-otp/agent.html
- https://github.com/christopheradams/elixir_style_guide#modules

- https://hexdocs.pm/decimal/readme.html
- https://hexdocs.pm/ex_machina/readme.html

## Resources <a name = "resources"></a>

- https://marketplace.visualstudio.com/items?itemName=pantajoe.vscode-elixir-credo
- https://www.tutorialspoint.com/elixir/elixir_structs.htm
- https://www.tutorialspoint.com/elixir/elixir_lists_and_tuples.htm
- https://inquisitivedeveloper.com/lwm-elixir-25/
