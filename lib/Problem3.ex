defmodule Problem3 do

  def solution(n) do
    
  end

  def prime_numbers do
    Stream.interval(1)
    |> Stream.drop(2)
    |> Stream.filter(&is_prime/1)
  end

  defp is_prime(x) do
    2..x
    |> Enum.filter(fn a -> rem(x, a) == 0 |> length() end) == 1
  end

end
