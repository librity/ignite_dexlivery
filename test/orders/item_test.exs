defmodule Dexlivery.Orders.ItemTest do
  use ExUnit.Case

  alias Dexlivery.Orders.Item

  import Dexlivery.Factory

  describe "build/4" do
    test "should return an item when all params are valid" do
      return =
        Item.build(
          40.42,
          1,
          "Penne Arrabiata",
          :italian,
          "Spicy, good cold."
        )

      expected = {:ok, build(:item)}

      assert return == expected
    end

    test "should return an error when quantity is less than one" do
      return =
        Item.build(
          40.42,
          0,
          "Penne Arrabiata",
          :italian,
          "Spicy, good cold."
        )

      expected = {:error, "Invalid parameters."}

      assert return == expected
    end

    test "should return an error when quantity isn't an integer" do
      return =
        Item.build(
          40.42,
          "1",
          "Penne Arrabiata",
          :italian,
          "Spicy, good cold."
        )

      expected = {:error, "Invalid parameters."}

      assert return == expected
    end

    test "should return an error when category doesn't exist" do
      return =
        Item.build(
          40.42,
          1,
          "Penne Arrabiata",
          :thay,
          "Spicy, good cold."
        )

      expected = {:error, "Invalid parameters."}

      assert return == expected
    end

    test "should return an error when unit_price isn't a float" do
      return =
        Item.build(
          40,
          1,
          "Penne Arrabiata",
          :italian,
          "Spicy, good cold."
        )

      expected = {:error, "Invalid parameters."}

      assert return == expected
    end

    test "should return an error when unit_price is less than or equal to zero" do
      return =
        Item.build(
          0.0,
          1,
          "Penne Arrabiata",
          :italian,
          "Spicy, good cold."
        )

      expected = {:error, "Invalid parameters."}

      assert return == expected
    end

    test "should return an error when name isn't a bitstring" do
      return =
        Item.build(
          40.42,
          1,
          42,
          :italian,
          "Spicy, good cold."
        )

      expected = {:error, "Invalid parameters."}

      assert return == expected
    end

    test "should return an error when description isn't a bitstring" do
      return =
        Item.build(
          40.42,
          1,
          "Penne Arrabiata",
          :italian,
          42
        )

      expected = {:error, "Invalid parameters."}

      assert return == expected
    end
  end
end
