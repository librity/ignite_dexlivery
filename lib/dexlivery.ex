defmodule Dexlivery do
  alias Dexlivery.Users.Agent, as: UserAgent
  alias Dexlivery.Users.CreateOrUpdate

  def start_agents do
    UserAgent.start_link()
  end

  defdelegate create_or_update_user(params), to: CreateOrUpdate, as: :call
  defdelegate get_users, to: UserAgent, as: :get_all
end
