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
  def calculateFibAt(n), do: calculateFibAt(n, [0, 1], 2)

  def calculateFibAt(n, seq, c) when c > n, do: seq

  def calculateFibAt(n, seq, c) do
    fib1 = Enum.at(seq, c - 1)
    fib2 = Enum.at(seq, c - 2)
    calculateFibAt(n, seq ++ [fib1 + fib2], c + 1)
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
