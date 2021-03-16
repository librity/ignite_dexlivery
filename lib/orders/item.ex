defmodule Dexlivery.Orders.Item do
  @categories [:pizza, :hamburger, :meats, :japanese, :italian, :desert]
  @keys [:name, :category, :unit_price, :quantity, :description]
  @enforce_keys List.delete(@keys, :description)

  defstruct @keys

  def build(unit_price, quantity, name, category, description \\ "Yummy yummy.")

  def build(unit_price, quantity, name, category, description)
      when unit_price > 0.0 and
             is_float(unit_price) and
             quantity > 0 and
             is_integer(quantity) and
             is_bitstring(name) and
             category in @categories and
             is_bitstring(description) do
    unit_price
    |> Decimal.cast()
    |> build_item(quantity, name, category, description)
  end

  def build(_unit_price, _quantity, _name, _category, _description),
    do: {:error, "Invalid parameters."}

  defp build_item({:ok, unit_price}, quantity, name, category, description) do
    {:ok,
     %__MODULE__{
       name: name,
       category: category,
       unit_price: unit_price,
       quantity: quantity,
       description: description
     }}
  end

  defp build_item(_error, _quantity, _name, _category, _description),
    do: {:error, "Invalid price."}
end
