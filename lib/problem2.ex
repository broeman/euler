defmodule Problem2 do

  @doc """
  Using the Fibonacci stream, take n elements and filter
  even numbers and sum them
  """
  def solution(n) when n > 0 do
    fibonacci_sequence
    |> Stream.take_while(fn x -> x < n end)
    |> Stream.filter(fn x -> rem(x, 2) == 0 end)
    |> Enum.sum
  end

  @doc """
  Creating the Fibonacci sequence tail recursion stream
  """
  defp fibonacci_sequence do
    Stream.unfold({1,1}, fn {a,b} -> {a, {b, a + b}} end)
  end

end
