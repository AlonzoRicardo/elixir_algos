defmodule AlgosAdvanced.ShortestPath.BellmanFord.Data do
  @normal_vertices ["S", "A", "B", "C", "D", "E"]

  @normal_memo %{
    "S" => 0,
    "A" => :infinity,
    "B" => :infinity,
    "C" => :infinity,
    "D" => :infinity,
    "E" => :infinity
  }

  @normal_graph [
    %{from: "S", to: "A", cost: 4},
    %{from: "S", to: "E", cost: -5},
    %{from: "A", to: "C", cost: 6},
    %{from: "B", to: "A", cost: 3},
    %{from: "C", to: "B", cost: -2},
    %{from: "D", to: "C", cost: 3},
    %{from: "D", to: "A", cost: 10},
    %{from: "E", to: "D", cost: 8}
  ]

  @negative_cycle_vertices ["S", "A", "B"]

  @negative_cycle_memo %{
    "S" => 0,
    "A" => :infinity,
    "B" => :infinity
  }

  @negative_cycle_graph [
    %{from: "S", to: "A", cost: 2},
    %{from: "A", to: "B", cost: -2},
    %{from: "B", to: "S", cost: -2}
  ]

  def normal_vertices() do
    @normal_vertices
  end

  def normal_memo() do
    @normal_memo
  end

  def normal_graph() do
    @normal_graph
  end

  def negative_cycle_vertices() do
    @negative_cycle_vertices
  end

  def negative_cycle_memo() do
    @negative_cycle_memo
  end

  def negative_cycle_graph() do
    @negative_cycle_graph
  end
end
