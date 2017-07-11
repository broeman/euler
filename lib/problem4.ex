defmodule Problem4 do

  @doc """
  My try on a solution. Basic idea on iterative:
  for x <- 99..10
    for y <- 99..10
      if palindrome?(x*y) return x*y
  But haven't found a solution in Elixir to return early
  """
  def solution(size) do
    palindrome_product size
  end

  @doc """
  Generalised design where the size of the two digits
  can be defined as a parameter (string -> int).
  """
  def palindrome_product(size) do
    upper = String.to_integer(String.duplicate("9", size))
    lower = String.to_integer("1" <> String.duplicate("0", size - 1))
    Enum.map(upper..lower, fn x -> Enum.map(upper..x, fn y -> x * y end) end)
    |> List.flatten |> Enum.sort |> Enum.reverse
    |> Enum.find(fn x -> palindrome?(x) end)
  end

  defp palindrome?(x) when is_integer x do
    palindrome? Integer.to_string x
  end

  defp palindrome?(string) when is_binary string do
     string == String.reverse string
  end

end
