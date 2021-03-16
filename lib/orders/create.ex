defmodule Dexlivery.Orders.Create do
  alias Dexlivery.Users
  alias Users.Agent, as: UserAgent

  alias Dexlivery.Orders
  alias Orders.Agent, as: OrderAgent
  alias Orders.Order
  alias Orders.ItemsBuilder

  def call(%{user_cpf: user_cpf, items: items_params}) do
    with {:ok, user} <- UserAgent.get(user_cpf),
         {:ok, items} <- ItemsBuilder.call(items_params),
         {:ok, order} <- Order.build(user, items) do
      OrderAgent.save(order)
    else
      error -> error
    end
  end
end
