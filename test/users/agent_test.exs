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

  describe "get_all/0" do
    setup do
      UserAgent.start_link()

      :ok
    end

    test "should return all saved user" do
      ["1234567", "42424242224", "24242424242424"]
      |> Stream.map(fn cpf -> build(:user, cpf: cpf) end)
      |> Enum.each(fn user -> UserAgent.save(user) end)

      expected = %{
        "1234567" => %Dexlivery.Users.User{
          address: "14 Aspen Drive, North Caldwell",
          age: 34,
          cpf: "1234567",
          email: "tony@jerseyoutfit.org",
          name: "Tony Soprano"
        },
        "24242424242424" => %Dexlivery.Users.User{
          address: "14 Aspen Drive, North Caldwell",
          age: 34,
          cpf: "24242424242424",
          email: "tony@jerseyoutfit.org",
          name: "Tony Soprano"
        },
        "42424242224" => %Dexlivery.Users.User{
          address: "14 Aspen Drive, North Caldwell",
          age: 34,
          cpf: "42424242224",
          email: "tony@jerseyoutfit.org",
          name: "Tony Soprano"
        }
      }

      assert UserAgent.get_all() == expected
    end
  end

  defp random_cpf, do: :rand.uniform(100_000) |> Integer.to_string()
end
