defmodule RationalNumbers do
  @type rational :: {integer, integer}

  @doc """
  Add two rational numbers
  """
  @spec add(a :: rational, b :: rational) :: rational
  def add({a1, b1}, {a2, b2}) do
    {a1 * b2 + a2 * b1, b1 * b2}
    |> reduce()
  end

  @doc """
  Subtract two rational numbers
  """
  @spec subtract(a :: rational, b :: rational) :: rational
  def subtract({a1, b1}, {a2, b2}) do
    {a1 * b2 - a2 * b1, b1 * b2}
    |> reduce()
  end

  @doc """
  Multiply two rational numbers
  """
  @spec multiply(a :: rational, b :: rational) :: rational
  def multiply({a1, b1}, {a2, b2}) do
    {a1 * a2, b1 * b2}
    |> reduce()
  end

  @doc """
  Divide two rational numbers
  """
  @spec divide_by(num :: rational, den :: rational) :: rational
  def divide_by({a1, b1}, {a2, b2}) do
    {a1 * b2, b1 * a2}
    |> reduce()
  end

  @doc """
  Absolute value of a rational number
  """
  @spec abs(a :: rational) :: rational
  def abs({a1, b1}) do
    {Kernel.abs(a1), Kernel.abs(b1)}
    |> reduce()
  end

  @doc """
  Exponentiation of a rational number by an integer
  """
  @spec pow_rational(a :: rational, n :: integer) :: rational
  def pow_rational({a1, b1}, n) when n >= 0 do
    {a1 ** n, b1 ** n}
    |> reduce()
  end

  def pow_rational({a1, b1}, n) when n < 0 do
    m = Kernel.abs(n)

    {b1 ** m, a1 ** m}
    |> reduce()
  end

  @doc """
  Exponentiation of a real number by a rational number
  """
  @spec pow_real(x :: integer, n :: rational) :: float
  def pow_real(x, {a1, b1}) do
    x ** a1 ** (1 / b1)
  end

  @doc """
  Reduce a rational number to its lowest terms
  """
  @spec reduce(a :: rational) :: rational
  def reduce({a1, b1}) do
    gcd = Integer.gcd(a1, b1)

    {div(a1, gcd), div(b1, gcd)}
    |> standardise()
  end

  defp standardise({a1, b1}) when b1 < 0 do
    {-1 * a1, -1 * b1}
  end

  defp standardise(a), do: a
end
