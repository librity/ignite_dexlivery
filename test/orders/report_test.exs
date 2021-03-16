defmodule Dexlivery.Orders.ReportTest do
  use ExUnit.Case

  import Dexlivery.Factory

  alias Dexlivery.Orders.Agent, as: OrderAgent
  alias Dexlivery.Orders.Report

  describe "generate/1" do
    setup do
      OrderAgent.start_link()

      build_list(5, :order)
      |> Enum.map(fn order -> OrderAgent.save(order) end)

      :ok
    end

    test "should save the order" do
      Report.generate("report_test.csv")

      return = File.read!("report_test.csv")

      expected =
        "123-45-6789,italian,1,40.42pizza,2,22.3,85.02\n" <>
          "123-45-6789,italian,1,40.42pizza,2,22.3,85.02\n" <>
          "123-45-6789,italian,1,40.42pizza,2,22.3,85.02\n" <>
          "123-45-6789,italian,1,40.42pizza,2,22.3,85.02\n" <>
          "123-45-6789,italian,1,40.42pizza,2,22.3,85.02\n"

      assert return == expected
    end
  end
end
