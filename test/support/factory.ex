defmodule Dexlivery.Factory do
  use ExMachina

  alias Dexlivery.Users.User
  alias Dexlivery.Orders.{Item, Order}

  def user_factory do
    %User{
      name: "Tony Soprano",
      email: "tony@jerseyoutfit.org",
      address: "14 Aspen Drive, North Caldwell",
      cpf: "123-45-6789",
      age: 34
    }
  end

  def user_params_factory do
    build(:user)
    |> Map.from_struct()
  end

  def invalid_user_params_factory do
    build(:user, age: 12)
    |> Map.from_struct()
  end

  def item_factory do
    %Item{
      category: :italian,
      description: "Spicy, good cold.",
      name: "Penne Arrabiata",
      quantity: 1,
      unit_price: Decimal.new("40.42")
    }
  end

  def italian_item_factory do
    build(:item)
  end

  def pizza_item_factory do
    %Item{
      category: :pizza,
      description: "Tasty",
      name: "Cheese Pizza",
      quantity: 2,
      unit_price: Decimal.new("22.3")
    }
  end

  def item_params_factory do
    build(:item)
    |> Map.from_struct()
    |> Map.put(:unit_price, 40.42)
  end

  def italian_item_params_factory do
    build(:italian_item)
    |> Map.from_struct()
    |> Map.put(:unit_price, 40.42)
  end

  def pizza_item_params_factory do
    build(:pizza_item)
    |> Map.from_struct()
    |> Map.put(:unit_price, 22.3)
  end

  def invalid_item_params_factory do
    build(:item, quantity: 0)
    |> Map.from_struct()
    |> Map.put(:unit_price, 22.3)
  end

  def order_factory do
    %User{cpf: cpf, address: address} = build(:user)

    %Order{
      delivery_address: address,
      items: [build(:italian_item), build(:pizza_item)],
      total_price: Decimal.new("85.02"),
      user_cpf: cpf
    }
  end

  def order_params_factory do
    build(:order)
    |> Map.from_struct()
  end

  def invalid_order_params_factory do
    build(:order, items: [build(:user)])
    |> Map.from_struct()
  end
end
