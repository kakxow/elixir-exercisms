defmodule Triangle do
  @type kind :: :equilateral | :isosceles | :scalene

  @doc """
  Return the kind of triangle of a triangle with 'a', 'b' and 'c' as lengths.
  """
  @spec kind(number, number, number) :: {:ok, kind} | {:error, String.t()}
  def kind(a, b, c) when a * b * c <= 0, do: {:error, "all side lengths must be positive"}

  def kind(a, b, c) when a + b <= c or a + c <= b or c + b <= a,
    do: {:error, "side lengths violate triangle inequality"}

  def kind(a, b, c) when a == b and a == c and b == c, do: {:ok, :equilateral}
  def kind(a, b, c) when a == b or a == c or b == c, do: {:ok, :isosceles}
  def kind(_, _, _), do: {:ok, :scalene}

  # Not my solution!
  # def kind(a, b, c) do
  #  case Enum.uniq([a, b, c]) do
  #    1 -> {:ok, :equilateral}
  #    2 -> {:ok, :isosceles}
  #    3 -> {:ok, :scalene}
  #  end
  # end
end
