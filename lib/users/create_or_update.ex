defmodule Dexlivery.Users.CreateOrUpdate do
  alias Dexlivery.Users
  alias Users.Agent, as: UserAgent
  alias Users.User

  def call(%{name: name, email: email, address: address, cpf: cpf, age: age}) do
    name
    |> User.build(email, address, cpf, age)
    |> save_user()
  end

  defp save_user({:ok, %User{} = user}), do: UserAgent.save(user)
  defp save_user({:error, _reason} = error), do: error
end
