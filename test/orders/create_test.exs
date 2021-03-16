defmodule Dexlivery.Orders.CreateTest do
  use ExUnit.Case

  import Dexlivery.Factory

  alias Dexlivery.Users
  alias Users.Agent, as: UserAgent

  alias Dexlivery.Orders.Agent, as: OrderAgent
  alias Dexlivery.Orders.Create

  describe "call/1" do
    setup do
      UserAgent.start_link()
      OrderAgent.start_link()

      user_cpf = "1234567"

      :user
      |> build(cpf: user_cpf)
      |> UserAgent.save()

      {:ok, user_cpf: user_cpf}
    end

    test "should save the order and return a success message when params are valid", %{
      user_cpf: user_cpf
    } do
      items = [build(:italian_item_params), build(:pizza_item_params)]

      return =
        %{user_cpf: user_cpf, items: items}
        |> Create.call()

      assert {:ok, _uuid} = return
    end

    test "should return an error when items aren't valid", %{user_cpf: user_cpf} do
      items = [build(:invalid_item_params)]

      return =
        %{user_cpf: user_cpf, items: items}
        |> Create.call()

      expected = {:error, "Invalid items."}

      assert return == expected
    end

    test "should return an error when user doesn't exist" do
      items = [build(:italian_item_params), build(:pizza_item_params)]

      return =
        %{user_cpf: random_cpf(), items: items}
        |> Create.call()

      expected = {:error, "User not found."}

      assert return == expected
    end
  end

  defp random_cpf, do: :rand.uniform(99_999_999_999) |> Integer.to_string()
end
