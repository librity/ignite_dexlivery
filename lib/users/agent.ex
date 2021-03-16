defmodule Dexlivery.Users.Agent do
  use Agent

  alias Dexlivery.Users.User

  def start_link(_initial_state \\ %{}) do
    Agent.start_link(fn -> %{} end, name: __MODULE__)
  end

  def save(%User{} = user), do: Agent.update(__MODULE__, &update_state(&1, user))

  def get(cpf), do: Agent.get(__MODULE__, &get_user(&1, cpf))

  def get_all, do: Agent.get(__MODULE__, & &1)

  defp update_state(previous_state, %User{cpf: cpf} = user),
    do: Map.put(previous_state, cpf, user)

  defp get_user(previous_state, cpf) do
    case Map.get(previous_state, cpf) do
      nil -> {:error, "User not found."}
      user -> {:ok, user}
    end
  end
end
