defmodule Dexlivery.Factory do
  alias Dexlivery.Users.User

  use ExMachina

  def user_factory do
    %User{
      name: "Tony Soprano",
      email: "tony@jerseyoutfit.org",
      address: "14 Aspen Drive, North Caldwell",
      cpf: "123-45-6789",
      age: 34
    }
  end
end
