defmodule Dexlivery.Orders.Item do
  @categories [:pizza, :hamburger, :meats, :japanese, :italian, :desert]
  @keys [:name, :category, :unit_price, :quantity, :description]
  @enforce_keys List.delete(@keys, :description)

  defstruct @keys

  def build(name, category, unit_price, quantity, description \\ nil)

  def build(name, category, unit_price, quantity, description)
      when quantity > 0 and category in @categories and unit_price > 0.0 and is_bitstring(name) do
    {:ok,
     %__MODULE__{
       name: name,
       category: category,
       unit_price: unit_price,
       quantity: quantity,
       description: description
     }}
  end

  def build(_name, _category, _unit_price, _quantity, _description),
    do: {:error, "Invalid parameters."}
end
