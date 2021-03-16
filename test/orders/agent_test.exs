defmodule Dexlivery.Orders.AgentTest do
  use ExUnit.Case

  import Dexlivery.Factory

  alias Dexlivery.Orders.Agent, as: OrdersAgent
  alias Dexlivery.Orders.Order

  describe "save/1" do
    setup do
      OrdersAgent.start_link()

      :ok
    end

    test "shoudl save the order" do
      order = build(:order)

      assert {:ok, _uuid} = OrdersAgent.save(order)
    end
  end

  describe "get/1" do
    setup do
      OrdersAgent.start_link()

      :ok
    end

    test "should return an order if it exists" do
      {:ok, uuid} =
        :order
        |> build()
        |> OrdersAgent.save()

      expected = {:ok, build(:order)}

      assert OrdersAgent.get(uuid) == expected
    end

    test "should return an error if order doesn't exist" do
      expected = {:error, "Order not found."}

      assert OrdersAgent.get("615e9909-c56a-44b0-ad58-e1c5e6d741de") == expected
    end
  end

  describe "get_all/0" do
    setup do
      OrdersAgent.start_link()

      :ok
    end

    test "should return all saved orders" do
      expected =
        build_list(3, :order)
        |> Stream.map(fn order -> OrdersAgent.save(order) end)
        |> Stream.map(fn {:ok, uuid} -> uuid end)
        |> Enum.reduce(%{}, fn uuid, previous -> Map.put(previous, uuid, build(:order)) end)

      assert OrdersAgent.get_all() == expected
    end
  end
end
