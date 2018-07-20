defmodule NumTest do
  use ExUnit.Case
  doctest Num

  use Num.Rational

  test "common fractions are equal" do
    assert 2 / 4 == 1 / 2
    assert 3 / 1 == 6 / 2
  end

  test "divisions return Rational numbers" do
    Num.Rational.new(3) == 6 / 2
    Num.Rational.new(4, 3) == 4 / 3
  end

  test "multiplications return Rational numbers" do
    Num.Rational.new(3) == 1 * 3
  end

  test "the truth" do
    a = 1 / 2
    b = 3 / 4
    assert "2/3" == "#{a / b}" |> IO.inspect()
    Num.Rational.new(3)

    (2 / (2 * 5))
    |> IO.puts()

    a = 3 / 1

    (1 / a / 2)
    |> IO.puts()

    z = 2 / 5

    (a / z)
    |> IO.puts()
  end
end
