Benchee.run(
  %{
    "Recursive" => fn fib -> AlgosAdvanced.Fibonacci.Recursive.calculateFibAt(fib) end,
    "Memoized" => fn fib -> AlgosAdvanced.Fibonacci.Memoized.calculateFibAt(fib) end,
    "ConstantSpace" => fn fib ->
      AlgosAdvanced.Fibonacci.ConstantSpace.calculateFibAt(fib)
    end
  },
  inputs: [{:fib_8, 8}, {:fib_12, 12}, {:fib_16, 16}]
)
