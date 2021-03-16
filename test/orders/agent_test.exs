defmodule Dexlivery.Orders.AgentTest do
  use ExUnit.Case

  import Dexlivery.Factory

  alias Dexlivery.Orders.Agent, as: OrdersAgent
  alias Dexlivery.Orders.Orders

  # describe "save/1" do
  #   setup do
  #     OrdersAgent.start_link()

  #     :ok
  #   end

  #   test "shoudl save the order" do
  #     order = build(:order)

  #     assert OrdersAgent.save(order) == :ok
  #   end
  # end

  # describe "get/1" do
  #   setup do
  #     OrdersAgent.start_link()

  #     {:ok, cpf: "1234567"}
  #   end

  #   test "should return a order if it exists", %{cpf: cpf} do
  #     :order
  #     |> build(cpf: cpf)
  #     |> OrdersAgent.save()

  #     expected =
  #       {:ok,
  #        %Orders{
  #          address: "14 Aspen Drive, North Caldwell",
  #          age: 34,
  #          cpf: cpf,
  #          email: "tony@jerseyoutfit.org",
  #          name: "Tony Soprano"
  #        }}

  #     assert OrdersAgent.get(cpf) == expected
  #   end

  #   test "should return an error if order doesn't exist", %{cpf: cpf} do
  #     expected = {:error, "Orders not found."}

  #     assert OrdersAgent.get(cpf) == expected
  #   end
  # end

  # describe "get_all/0" do
  #   setup do
  #     OrderAgent.start_link()

  #     {:ok, cpf: "1234567"}
  #   end

  #   test "should return all saved order", %{cpf: cpf} do
  #     build_list(3, :order)
  #     |> Enum.each(fn order -> OrderAgent.save(order) end)

  #     expected = %{
  #       "1234567" => %Dexlivery.Orders.Order{
  #         address: "14 Aspen Drive, North Caldwell",
  #         age: 34,
  #         cpf: "1234567",
  #         email: "tony@jerseyoutfit.org",
  #         name: "Tony Soprano"
  #       },
  #       "24242424242424" => %Dexlivery.Orders.Order{
  #         address: "14 Aspen Drive, North Caldwell",
  #         age: 34,
  #         cpf: "24242424242424",
  #         email: "tony@jerseyoutfit.org",
  #         name: "Tony Soprano"
  #       },
  #       "42424242224" => %Dexlivery.Orders.Order{
  #         address: "14 Aspen Drive, North Caldwell",
  #         age: 34,
  #         cpf: "42424242224",
  #         email: "tony@jerseyoutfit.org",
  #         name: "Tony Soprano"
  #       }
  #     }

  #     assert OrderAgent.get_all() == expected
  #   end
  # end

end
