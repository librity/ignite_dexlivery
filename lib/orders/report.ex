defmodule Dexlivery.Orders.Report do
  alias Dexlivery.Orders.Agent, as: OrderAgent
  alias Dexlivery.Orders.Order
  alias Dexlivery.Orders.Item

  def generate(filename \\ "report.csv") do
    orders_list = build_orders_list()

    filename
    |> File.write(orders_list)
  end

  defp build_orders_list do
    OrderAgent.get_all()
    |> Map.values()
    |> Enum.map(&build_order_line/1)
    |> IO.inspect()
  end

  defp build_order_line(%Order{user_cpf: cpf, items: items, total_price: total_price}) do
    item_string = Enum.map(items, &build_item_string/1)

    "#{cpf},#{item_string},#{total_price}\n"
  end

  defp build_item_string(%Item{category: category, quantity: quantity, unit_price: unit_price}) do
    "#{category},#{quantity},#{unit_price}"
  end
end
