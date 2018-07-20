# Num

**Because floats were never really numbers**

```elixir
iex(1)> use Num.Rational
Num.Rational

iex(2)> 2 / 4 == 1 / 2
true

iex(3)> (4 / (2 / 6))
%Num.Rational{denominator: 1, numerator: 12}
```
