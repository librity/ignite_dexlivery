defmodule Dexlivery.Users.CreateOrUpdateTest do
  use ExUnit.Case

  import Dexlivery.Factory

  alias Dexlivery.Users.CreateOrUpdate
  alias Dexlivery.Users.Agent, as: UserAgent

  describe "call/1" do
    setup do
      UserAgent.start_link()

      :ok
    end

    test "should save the user and return a success message when params are valid" do
      return =
        build(:user_params)
        |> CreateOrUpdate.call()

      expected = {:ok, "User successfully created."}

      assert return == expected
    end

    test "should return an error when when params aren't valid" do
      return =
        build(:invalid_user_params)
        |> CreateOrUpdate.call()

      expected = {:error, "User must be at least 18 years old."}

      assert return == expected
    end
  end
end
