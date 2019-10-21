defmodule AlgosAdvanced.ShortestPath.Dijkstra do
  @moduledoc """
  """

  def calculate(v, g, m, src \\ nil)

  def calculate([], _g, m, _src), do: m

  def calculate([v | vt], g, m, src) do
    src = src || v

    edges = Enum.filter(g, fn node -> node.from == src end)

    {m, src} =
      edges
      |> relax(m)
      |> mark_as_visited(src)
      |> (&next_vertex(&1, src, filter_non_visited(&1, edges))).()

    calculate(vt, g, m, src)
  end

  defp relax([], m), do: m

  defp relax([e | et], m) do
    pc =
      case sum(m[e.from].cost, e.cost) do
        :infinity -> :infinity
        sum -> sum
      end

    case pc < m[e.to].cost do
      true ->
        {_, m} = update_cost(m, e, pc)
        relax(et, m)

      false ->
        relax(et, m)
    end
  end

  defp filter_non_visited(m, edges) do
    Enum.filter(edges, fn node -> m[node.to].visited == false end)
  end

  defp next_vertex(m, src, e, l \\ :infinity)
  defp next_vertex(m, src, [], _low), do: {m, src}

  defp next_vertex(m, src, [e | et], l) do
    {src, l} =
      case m[e.to].cost < l do
        true -> {e.to, m[e.to].cost}
        false -> {src, l}
      end

    next_vertex(m, src, et, l)
  end

  defp mark_as_visited(m, src) do
    {_, m} = Map.get_and_update!(m, src, fn x -> {x, %{cost: x.cost, visited: true}} end)
    m
  end

  defp update_cost(m, e, pc),
    do: Map.get_and_update!(m, e.to, fn x -> {x, %{cost: pc, visited: x.visited}} end)

  defp sum(:infinity, _), do: :infinity
  defp sum(_, :infinity), do: :infinity
  defp sum(a, b), do: a + b
end
