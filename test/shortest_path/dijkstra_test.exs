defmodule AlgosAdvanced.ShortestPath.DijkstraTest do
  use ExUnit.Case
  alias AlgosAdvanced.ShortestPath.Dijkstra.Data

  @valid_shortest_path %{
    "A" => %{cost: 4, visited: true},
    "B" => %{cost: 7, visited: true},
    "C" => %{cost: 6, visited: true},
    "D" => %{cost: 3, visited: true},
    "E" => %{cost: 2, visited: true},
    "S" => %{cost: 0, visited: true}
  }

  test "valid shortest path" do
    result =
      AlgosAdvanced.ShortestPath.Dijkstra.calculate(
        Data.vertices(),
        Data.graph(),
        Data.memo()
      )

    assert @valid_shortest_path == result
  end
end
