defmodule Dexlivery do
  alias Dexlivery.Users.Agent, as: UserAgent
  alias Dexlivery.Orders.Agent, as: OrderAgent

  alias Dexlivery.Users.CreateOrUpdate, as: CreateOrUpdateUser
  alias Dexlivery.Orders.CreateOrUpdate, as: CreateOrUpdateOrder

  def start_agents do
    UserAgent.start_link()
    OrderAgent.start_link()
  end

  defdelegate create_or_update_user(params), to: CreateOrUpdateUser, as: :call
  defdelegate get_users, to: UserAgent, as: :get_all

  defdelegate create_or_update_order(params), to: CreateOrUpdateOrder, as: :call
  defdelegate get_orders, to: OrderAgent, as: :get_all
end
