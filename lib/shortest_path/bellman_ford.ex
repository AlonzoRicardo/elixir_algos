defmodule AlgosAdvanced.ShortestPath.BellmanFord do
  @moduledoc """
  O(|V| * E), can approximate O(n^2) if every vertex has at least one outgoing edge.
  """

  def calculate(v, g, m, vv, s? \\ nil)

  def calculate([], _g, m, _vv, true), do: {:negative_cycle, m}
  def calculate(_v, _g, m, _vv, false), do: m

  def calculate([_v | vt], g, m, vv, s?) do
    {s?, m} = calc(vv, g, m, false)
    calculate(vt, g, m, vv, s?)
  end

  defp calc([], _g, m, s?), do: {s?, m}

  defp calc([v | vt], g, m, s?) do
    {c?, m} =
      g
      |> Enum.filter(fn node -> node.from == v end)
      |> relax(m, s?)

    calc(vt, g, m, c? || s?)
  end

  defp relax([], m, c?), do: {c?, m}

  defp relax([e | et], m, c?) do
    pc =
      case sum(m[e.from], e.cost) do
        :infinity -> :infinity
        sum -> sum
      end

    case pc < m[e.to] do
      true -> relax(et, Map.replace!(m, e.to, pc), true)
      false -> relax(et, m, c?)
    end
  end

  defp sum(:infinity, _), do: :infinity
  defp sum(_, :infinity), do: :infinity
  defp sum(a, b), do: a + b
end
