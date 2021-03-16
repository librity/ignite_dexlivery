defmodule Dexlivery.Users.User do
  @keys [:name, :email, :address, :cpf, :age]
  @enforce_keys @keys

  defstruct @keys

  def build(name, email, address, cpf, age)
      when age >= 18 and is_bitstring(name) and is_bitstring(email) and is_bitstring(address) and
             is_bitstring(cpf) do
    {:ok, %__MODULE__{name: name, email: email, address: address, cpf: cpf, age: age}}
  end

  def build(name, _email, _address, _cpf, _age)
      when not is_bitstring(name),
      do: {:error, "Name must be a bitstring."}

  def build(_name, email, _address, _cpf, _age)
      when not is_bitstring(email),
      do: {:error, "Email must be a bitstring."}

  def build(_name, _email, address, _cpf, _age)
      when not is_bitstring(address),
      do: {:error, "Address must be a bitstring."}

  def build(_name, _email, _address, cpf, _age)
      when not is_bitstring(cpf),
      do: {:error, "CPF must be a bitstring."}

  def build(_name, _email, _address, _cpf, age) when age < 18,
    do: {:error, "User must be at least 18 years old."}

  def build(_name, _email, _address, _cpf, _age), do: {:error, "Invalid parameters."}
end
