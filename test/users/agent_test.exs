defmodule Dexlivery.Users.AgentTest do
  use ExUnit.Case

  import Dexlivery.Factory

  alias Dexlivery.Users.Agent, as: UserAgent
  alias Dexlivery.Users.User

  describe "save/1" do
    setup do
      UserAgent.start_link()

      :ok
    end

    test "shoudl save the user" do
      user = build(:user)

      assert UserAgent.save(user) == :ok
    end
  end

  describe "get/1" do
    setup do
      UserAgent.start_link()

      {:ok, cpf: "1234567"}
    end

    test "should return a user if it exists", %{cpf: cpf} do
      :user
      |> build(cpf: cpf)
      |> UserAgent.save()

      expected =
        {:ok,
         %User{
           address: "14 Aspen Drive, North Caldwell",
           age: 34,
           cpf: cpf,
           email: "tony@jerseyoutfit.org",
           name: "Tony Soprano"
         }}

      assert UserAgent.get(cpf) == expected
    end

    test "should return an error if user doesn't exist", %{cpf: cpf} do
      expected = {:error, "User not found."}

      assert UserAgent.get(cpf) == expected
    end
  end
end
