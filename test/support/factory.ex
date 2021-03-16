defmodule Dexlivery.Factory do
  alias Dexlivery.Users.User
  alias Dexlivery.Orders.Item

  use ExMachina

  def user_factory do
    %User{
      name: "Tony Soprano",
      email: "tony@jerseyoutfit.org",
      address: "14 Aspen Drive, North Caldwell",
      cpf: "123-45-6789",
      age: 34
    }
  end

  def item_factory do
    {:ok, unit_price} = Decimal.cast(40.42)

    %Item{
      category: :italian,
      description: "Spicy, good cold.",
      name: "Penne Arrabiata",
      quantity: 1,
      unit_price: unit_price
    }
  end
end
