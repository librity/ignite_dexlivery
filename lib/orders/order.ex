defmodule Dexlivery.Orders.Order do
  alias Dexlivery.Users.User
  alias Dexlivery.Orders.Item

  @keys [:user_cpf, :delivery_address, :items, :total_price]
  @enforce_keys @keys

  defstruct @keys

  def build(%User{cpf: cpf, address: address}, [%Item{} | _items] = items) do
    {:ok,
     %__MODULE__{
       user_cpf: cpf,
       delivery_address: address,
       items: items,
       total_price: calculate_total_price(items)
     }}
  end

  def build(_user, _items), do: {:error, "Invalid parameters."}

  defp calculate_total_price([%Item{} | _items] = items) do
    items
    |> Enum.reduce(Decimal.new("0.0"), &accumulate_prices/2)
  end

  defp accumulate_prices(%Item{unit_price: price, quantity: quantity}, previous_total) do
    price
    |> Decimal.mult(quantity)
    |> Decimal.add(previous_total)
  end
end
