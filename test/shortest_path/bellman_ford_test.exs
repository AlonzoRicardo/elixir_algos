defmodule AlgosAdvanced.ShortestPath.BellmanFordTest do
  use ExUnit.Case
  alias AlgosAdvanced.ShortestPath.BellmanFord.Data

  @valid_shortest_path %{"A" => 4, "B" => 4, "C" => 6, "D" => 3, "E" => -5, "S" => 0}
  @valid_negative_cycle {:negative_cycle, %{"A" => -2, "B" => -4, "S" => -6}}

  test "negative cycles" do
    result =
      AlgosAdvanced.ShortestPath.BellmanFord.calculate(
        Data.negative_cycle_vertices(),
        Data.negative_cycle_graph(),
        Data.negative_cycle_memo(),
        Data.negative_cycle_vertices()
      )

    assert @valid_negative_cycle == result
  end

  test "valid shortest path" do
    result =
      AlgosAdvanced.ShortestPath.BellmanFord.calculate(
        Data.normal_vertices(),
        Data.normal_graph(),
        Data.normal_memo(),
        Data.normal_vertices()
      )

    assert @valid_shortest_path == result
  end
end
