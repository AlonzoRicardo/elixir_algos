defmodule AlgosAdvanced.ShortestPath.Dijkstra.Data do
  @vertices ["S", "A", "B", "C", "D", "E"]

  @graph [
    %{from: "S", to: "A", cost: 4},
    %{from: "S", to: "E", cost: 2},
    %{from: "A", to: "D", cost: 3},
    %{from: "A", to: "C", cost: 6},
    %{from: "A", to: "B", cost: 5},
    %{from: "B", to: "A", cost: 3},
    %{from: "C", to: "B", cost: 1},
    %{from: "D", to: "C", cost: 3},
    %{from: "D", to: "A", cost: 1},
    %{from: "E", to: "D", cost: 1}
  ]

  @memo %{
    "S" => %{cost: 0, visited: false},
    "A" => %{cost: :infinity, visited: false},
    "B" => %{cost: :infinity, visited: false},
    "C" => %{cost: :infinity, visited: false},
    "D" => %{cost: :infinity, visited: false},
    "E" => %{cost: :infinity, visited: false}
  }

  def vertices() do
    @vertices
  end

  def memo() do
    @memo
  end

  def graph() do
    @graph
  end
end
