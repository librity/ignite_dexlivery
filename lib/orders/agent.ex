defmodule Dexlivery.Orders.Agent do
  use Agent

  alias Dexlivery.Orders.Order

  def start_link(_initial_state \\ %{}) do
    Agent.start_link(fn -> %{} end, name: __MODULE__)
  end

  def save(order, uuid \\ UUID.uuid4())

  def save(%Order{} = order, uuid) do
    Agent.update(__MODULE__, &update_state(&1, order, uuid))

    {:ok, uuid}
  end

  def get(uuid), do: Agent.get(__MODULE__, &get_order(&1, uuid))

  def get_all, do: Agent.get(__MODULE__, & &1)

  defp update_state(previous_state, %Order{} = order, uuid) do
    Map.put(previous_state, uuid, order)
  end

  defp get_order(previous_state, uuid) do
    case Map.get(previous_state, uuid) do
      nil -> {:error, "Order not found."}
      order -> {:ok, order}
    end
  end
end
