defmodule Demo do
  @doc """
  Exemple simple de fonction et d’optimization avec le principe de **Tail Call Optimization**.

  - Demo.fib(40)     4s  vs <1s
  - Demo.fib(50)   413s  vs <1s
  - Demo.fib(10000)   x  vs  2s
  """
  def fib(n) do
    with {:ok, started_at} <- timestamp(),
         # number <- fibonnaci(n),
         number <- fibonnaci(n, 1, 0),
         {:ok, ended_at} <- timestamp() do
      IO.puts("Processed in #{ended_at - started_at}ms.")

      number
    end
  end

  defp timestamp() do
    {:ok, :os.system_time(:millisecond)}
  end

  #
  # "Basic" implementation
  #

  # defp fibonnaci(0), do: 0
  # 
  # defp fibonnaci(1), do: 1
  # 
  # defp fibonnaci(n), do: fibonnaci(n-1) + fibonnaci(n-2)

  #
  # Tail Call Optimization
  #

  defp fibonnaci(0, _, result), do: result
  
  defp fibonnaci(n, next, result) do
    fibonnaci(n - 1, next + result, next)
  end
end
