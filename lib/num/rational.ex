defmodule Num.Rational do
  @enforce_keys [:numerator, :denominator]
  defstruct [:numerator, :denominator]

  defmacro __using__(_) do
    quote do
      import Kernel, except: [{:/, 2}, {:*, 2}]
      import Num.Rational
    end
  end

  defmacro x / y when is_integer(x) do
    quote do
      unquote(__MODULE__)./(unquote(__MODULE__).new(unquote(x)), unquote(y))
    end
  end
  defmacro x / y when is_integer(y) do
    quote do
      unquote(__MODULE__)./(unquote(x), unquote(__MODULE__).new(unquote(y)))
    end
  end
  defmacro x / y do
    quote do
      unquote(__MODULE__).divide(unquote(x), unquote(y))
    end
  end

  defmacro x * y when is_integer(x) do
    quote do
      unquote(__MODULE__).*(unquote(__MODULE__).new(unquote(x)), unquote(y))
    end
  end
  defmacro x * y when is_integer(y) do
    quote do
      unquote(__MODULE__).*(unquote(x), unquote(__MODULE__).new(unquote(y)))
    end
  end
  defmacro x * y do
    quote do
      unquote(__MODULE__).multiply(unquote(x), unquote(y))
    end
  end

  def new(numerator, denominator \\ 1)
  def new(numerator, denominator) when is_integer(numerator) and is_integer(denominator) and denominator != 0 do
    factor = gcd(numerator, denominator)
    %__MODULE__{numerator: Integer.floor_div(numerator, factor), denominator: Integer.floor_div(denominator, factor)}
  end

  def gcd(a,0), do: abs(a)
  def gcd(a,b), do: gcd(b, rem(a,b))

  def divide(x1, x2) when is_integer(x1) do
    divide(new(x1), x2)
  end
  def divide(x1, x2) when is_integer(x2) do
    divide(x1, new(x2))
  end
  def divide(%{numerator: n1, denominator: d1}, %{numerator: n2, denominator: d2}) do
    new(Kernel.*(n1, d2), Kernel.*(d1, n2))
  end

  def multiply(x1, x2) when is_integer(x1) do
    multiply(new(x1), x2)
  end
  def multiply(x1, x2) when is_integer(x2) do
    multiply(x1, new(x2))
  end
  def multiply(%{numerator: n1, denominator: d1}, %{numerator: n2, denominator: d2}) do
    new(Kernel.*(n1, n2), Kernel.*(d1, d2))
  end

  defimpl String.Chars, for: __MODULE__ do
    def to_string(%{numerator: numerator, denominator: denominator}) do
      "#{numerator}/#{denominator}"
    end
  end
end
