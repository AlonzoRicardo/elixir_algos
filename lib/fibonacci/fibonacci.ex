defmodule AlgosAdvanced.Fibonacci.Recursive do
  @moduledoc """
  Exponential time O(2ˆn)
  """
  def calculateFibAt(n) when n < 2, do: n

  def calculateFibAt(n) do
    calculateFibAt(n - 2) + calculateFibAt(n - 1)
  end
end

defmodule AlgosAdvanced.Fibonacci.Memoized do
  @moduledoc """
  Linear time O(n)
  """
  def calculateFibAt(n), do: calculateFibAt(n, [1, 0], 2)

  def calculateFibAt(n, [fib | seq], c) when c > n, do: fib

  def calculateFibAt(n, [fib1 | [fib2 | seq]], c) do
    calculateFibAt(n, [fib1 + fib2, fib1, fib2 | seq], c + 1)
  end
end

defmodule AlgosAdvanced.Fibonacci.ConstantSpace do
  @moduledoc """
  Constant Space O(1)
  """
  def calculateFibAt(n), do: calculateFibAt(n, 2, 0, 1)

  def calculateFibAt(n, c, fib1, fib2) when c == n, do: fib1 + fib2

  def calculateFibAt(n, c, fib1, fib2) do
    calculateFibAt(n, c + 1, fib2, fib2 + fib1)
  end
end

defmodule AlgosAdvanced.Fibonacci.Iterative do
  def calculateFibAt(n) do
    {_, fib} =
      Enum.reduce(2..n, {0, 1}, fn _x, acc ->
        {fib1, fib2} = acc
        {fib2, fib1 + fib2}
      end)

    fib
  end
end
