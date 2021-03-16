defmodule Dexlivery.Orders.CreateOrUpdate do
  alias Dexlivery.Orders
  alias Orders.Agent, as: OrderAgent
  alias Users.Agent, as: UserAgent
  alias Orders.Order

  def call(%{user_cpf: user_cpf, items: items_params}) do
    with {:ok, user} <- UserAgent.get(user_cpf),
         {:ok, items} <- build_items(items_params),
         {:ok, order} <- Order.build(user, items) do
      OrderAgent.save(order)
    else
      error -> error
    end
  end

  defp build_items([] = items) do
  end
end
