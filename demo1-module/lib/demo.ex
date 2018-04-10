defmodule Demo do
  @moduledoc """
  Documentation for Demo.
  """

  @doc """
  Exemple simple de fonction et d’optimization avec le principe
  de **Tail Call Optimization**.

  - Demo.fib(40)     4s  vs <1s
  - Demo.fib(50)   413s  vs <1s
  - Demo.fib(10000)   x  vs  2s
  """
  def fib(n) do
    started_at = :os.system_time(:seconds)
    number = fibonnaci(n, 1, 0) # fibonnaci(n, 1, 0)
    ended_at = :os.system_time(:seconds)

    IO.puts("Processed in #{ended_at-started_at} seconds.")

    number
  end

  # "Basic" implementation
  # defp fibonnaci(0), do: 0
  # defp fibonnaci(1), do: 1
  # defp fibonnaci(n), do: fibonnaci(n-1) + fibonnaci(n-2)

  # Tail Call Optimization `fibonnaci(n, 1, 0)`
  defp fibonnaci(0, _, result), do: result
  defp fibonnaci(n, next, result) do
    fibonnaci(n-1, next+result, next)
  end
end
