defmodule CollatzConjecture do
  @doc """
  calc/1 takes an integer and returns the number of steps required to get the
  number to 1 when following the rules:
    - if number is odd, multiply with 3 and add 1
    - if number is even, divide by 2
  """
  @spec calc(input :: pos_integer()) :: non_neg_integer()
  def calc(input) when is_number(input) and input > 0, do: calc(input, 0)
  def calc(1, counter), do: counter
  def calc(input, counter) when rem(input, 2) == 0, do: calc(round(input / 2), counter + 1)
  def calc(input, counter), do: calc(input * 3 + 1, counter + 1)
end
