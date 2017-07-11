defmodule Problem3 do

  @doc """
  Elixir solution based on factorization
  """
  def solution(n) do
    factorize(n)
    #prime_numbers
    #|> Stream.take_while(fn x -> x < n / 2 end)
    #|> Stream.filter(fn x -> rem(n, x) == 0 end)
    |> Enum.max
  end

  @doc """
  Factorize FTW
  """
  def factorize(x), do: factorize x, 2
  defp factorize(1, _), do: []
  defp factorize(x, y) when rem(x, y) == 0 do
    [y] ++ factorize(div(x, y), y)
  end
  defp factorize(x, y), do: factorize x, y + 1


  @doc """
  Trying with prime numbers stream and filter,
  but was slow as hell, at least I have a stream of it :)
  """
  def prime_numbers do
    Stream.unfold([], fn primes ->
      next = next_prime(primes)
      {next, [next | primes]}
    end)
  end

  defp next_prime([]), do: 2
  defp next_prime(primes) when is_list primes do
    primes
    |> next_primes(1)
    |> List.first
  end

  defp next_primes(primes, quantity) when is_list primes and is_integer quantity do
    from = List.first(primes) + 1
    Stream.iterate(from, fn x -> x + 1 end)
    |> Stream.drop_while(fn num ->
      Enum.any?(primes, fn prime ->
        rem(num, prime) == 0
      end)
    end)
    |> Enum.take(quantity)
  end

end
