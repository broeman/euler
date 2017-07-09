defmodule Problem1 do
  @doc """
  My solution to problem 1
  """
  def solution(num) when num > 0 do
    multiple_35(num - 1, 0)
  end

  defp multiple_35(num, sum) do
    cond do
      num == 2                                    -> sum
      (rem(num, 3) == 0) or (rem(num, 5) == 0)    -> multiple_35(num-1, sum + num)
      true                                        -> multiple_35(num-1, sum)
    end
  end

  @doc """
  A much faster solution, given by Euler Project
  """
  def effective(num) when num > 0 do
    sum_divisible_by(num - 1, 3) + sum_divisible_by(num - 1, 5) - sum_divisible_by(num - 1, 15)
  end

  defp sum_divisible_by(target, n) do
     p = div(target, n)
     div(n * (p * (p + 1)), 2)
  end
end
