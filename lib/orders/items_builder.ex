defmodule Dexlivery.Orders.ItemsBuilder do
  alias Dexlivery.Orders.Item

  def call(items_params) do
    items_params
    |> Enum.map(&build_item/1)
    |> handle_build()
  end

  defp build_item(%{
         unit_price: unit_price,
         quantity: quantity,
         name: name,
         category: category,
         description: description
       }) do
    case Item.build(unit_price, quantity, name, category, description) do
      {:ok, built_item} -> built_item
      {:error, _reason} = error -> error
    end
  end

  defp handle_build(built_items) do
    if Enum.all?(built_items, &is_struct/1),
      do: {:ok, built_items},
      else: {:error, "Invalid items."}
  end
end
