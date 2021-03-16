defmodule Dexlivery do
  alias Dexlivery.Users.Agent, as: UserAgent
  alias Dexlivery.Orders.Agent, as: OrderAgent

  alias Dexlivery.Users.CreateOrUpdate, as: CreateOrUpdateUser
  alias Dexlivery.Orders.Create, as: CreateOrder
  alias Dexlivery.Orders.Update, as: UpdateOrder

  def start_agents do
    UserAgent.start_link()
    OrderAgent.start_link()
  end

  defdelegate create_or_update_user(params), to: CreateOrUpdateUser, as: :call
  defdelegate get_user(cpf), to: UserAgent, as: :get
  defdelegate get_users, to: UserAgent, as: :get_all

  defdelegate create_order(params), to: CreateOrder, as: :call
  defdelegate update_order(params, uuid), to: UpdateOrder, as: :call
  defdelegate get_order(uuid), to: OrderAgent, as: :get
  defdelegate get_orders, to: OrderAgent, as: :get_all
end
