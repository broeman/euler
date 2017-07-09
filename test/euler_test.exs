defmodule EulerTest do
  use ExUnit.Case
  doctest Euler

  test "the truth" do
    assert 1 + 1 == 2
  end

  test "multiples of 3 and 5" do
    assert Problem1.solution(10) == 23
  end

end
