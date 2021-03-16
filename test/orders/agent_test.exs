defmodule Dexlivery.Orders.AgentTest do
  use ExUnit.Case

  import Dexlivery.Factory

  alias Dexlivery.Orders.Agent, as: OrderAgent

  describe "save/1" do
    setup do
      OrderAgent.start_link()

      :ok
    end

    test "shoudl save the order" do
      order = build(:order)

      assert {:ok, _uuid} = OrderAgent.save(order)
    end
  end

  describe "get/1" do
    setup do
      OrderAgent.start_link()

      :ok
    end

    test "should return an order if it exists" do
      order = build(:order)

      {:ok, uuid} =
        order
        |> OrderAgent.save()

      expected = {:ok, order}

      assert OrderAgent.get(uuid) == expected
    end

    test "should return an error if order doesn't exist" do
      expected = {:error, "Order not found."}

      assert OrderAgent.get("615e9909-c56a-44b0-ad58-e1c5e6d741de") == expected
    end
  end

  describe "get_all/0" do
    setup do
      OrderAgent.start_link()

      :ok
    end

    test "should return all saved orders" do
      expected =
        build_list(3, :order)
        |> Stream.map(fn order -> OrderAgent.save(order) end)
        |> Stream.map(fn {:ok, uuid} -> uuid end)
        |> Enum.reduce(%{}, fn uuid, previous -> Map.put(previous, uuid, build(:order)) end)

      assert OrderAgent.get_all() == expected
    end
  end
end
