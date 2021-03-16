defmodule Dexlivery.Orders.OrderTest do
  use ExUnit.Case

  alias Dexlivery.Orders.Order

  import Dexlivery.Factory

  describe "build/2" do
    test "should return an order when all params are valid" do
      user = build(:user)
      items = [build(:italian_item), build(:pizza_item)]

      return = Order.build(user, items)

      expected = {:ok, build(:order)}

      assert return == expected
    end

    test "should return an error when user isn't a user struct" do
      user = %{cpf: "cpf", address: "address"}
      items = [build(:italian_item), build(:pizza_item)]

      return = Order.build(user, items)

      expected = {:error, "Invalid parameters."}

      assert return == expected
    end

    test "should return an error when items is empty" do
      user = build(:user)
      items = []

      return = Order.build(user, items)

      expected = {:error, "Invalid parameters."}

      assert return == expected
    end

    test "should return an error when items doesn't contain an item" do
      user = build(:user)
      items = [build(:user)]

      return = Order.build(user, items)

      expected = {:error, "Invalid parameters."}

      assert return == expected
    end
  end
end
