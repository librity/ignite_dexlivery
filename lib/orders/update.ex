defmodule Dexlivery.Orders.Update do
  alias Dexlivery.Users
  alias Users.Agent, as: UserAgent

  alias Dexlivery.Orders
  alias Orders.Agent, as: OrderAgent
  alias Orders.Order
  alias Orders.ItemsBuilder

  def call(%{user_cpf: user_cpf, items: items_params}, uuid) do
    with {:ok, user} <- UserAgent.get(user_cpf),
         {:ok, items} <- ItemsBuilder.call(items_params),
         {:ok, order} <- Order.build(user, items) do
      OrderAgent.save(order, uuid)
    else
      error -> error
    end
  end
end
