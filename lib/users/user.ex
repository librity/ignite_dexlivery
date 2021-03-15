defmodule Dexlivery.Users.User do
  @keys [:name, :email, :cpf, :age]
  @enforce_keys @keys

  defstruct @keys

  def build(name, email, cpf, age) when age >= 18 and is_bitstring(cpf) do
    {:ok, %__MODULE__{name: name, email: email, cpf: cpf, age: age}}
  end

  def build(_name, _email, cpf, _age) when not is_bitstring(cpf),
    do: {:error, "CPF must be a bitstring."}

  def build(_name, _email, _cpf, age) when age < 18,
    do: {:error, "User must be at least 18 years old."}

  def build(_name, _email, _cpf, _age), do: {:error, "Invalid parameters."}
end
