defmodule Dexlivery.Users.UserTest do
  alias Dexlivery.Users.User

  use ExUnit.Case

  describe "build/5" do
    test "should return a user when all params are valid" do
      return =
        User.build(
          "Tony Soprano",
          "tony@jerseyoutfit.org",
          "14 Aspen Drive, North Caldwell",
          "123-45-6789",
          34
        )

      expected =
        {:ok,
         %User{
           name: "Tony Soprano",
           email: "tony@jerseyoutfit.org",
           address: "14 Aspen Drive, North Caldwell",
           cpf: "123-45-6789",
           age: 34
         }}

      assert return == expected
    end

    test "should return an error when name isn't a bitstring" do
      return =
        User.build(
          123,
          "tony@jerseyoutfit.org",
          "14 Aspen Drive, North Caldwell",
          "123-45-6789",
          34
        )

      expected = {:error, "Name must be a bitstring."}

      assert return == expected
    end

    test "should return an error when email isn't a bitstring" do
      return =
        User.build(
          "Tony Soprano",
          123,
          "14 Aspen Drive, North Caldwell",
          "123-45-6789",
          34
        )

      expected = {:error, "Email must be a bitstring."}

      assert return == expected
    end

    test "should return an error when address isn't a bitstring" do
      return =
        User.build(
          "Tony Soprano",
          "tony@jerseyoutfit.org",
          123,
          "123-45-6789",
          34
        )

      expected = {:error, "Address must be a bitstring."}

      assert return == expected
    end

    test "should return an error when cpf isn't a bitstring" do
      return =
        User.build(
          "Tony Soprano",
          "tony@jerseyoutfit.org",
          "14 Aspen Drive, North Caldwell",
          123,
          34
        )

      expected = {:error, "CPF must be a bitstring."}

      assert return == expected
    end

    test "should return an error when user is younger than 18" do
      return =
        User.build(
          "Tony Soprano",
          "tony@jerseyoutfit.org",
          "14 Aspen Drive, North Caldwell",
          "123-45-6789",
          17
        )

      expected = {:error, "User must be at least 18 years old."}

      assert return == expected
    end
  end
end
