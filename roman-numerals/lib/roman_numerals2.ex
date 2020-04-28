defmodule RomanNumerals do
  @romans [{"I", "V", "X"}, {"X", "L", "C"}, {"C", "D", "M"}, {"M", "", ""}]
  @doc """
  Convert the number to a roman number.
  """
  def numeral(number) do
    Integer.digits(number)
    |> to_roman
  end

  defp to_roman([]), do: ""

  defp to_roman([digit | digits]) do
    {small, middle, large} = Enum.at(@romans, length(digits))

    cond do
      digit < 4 -> String.duplicate(small, digit)
      digit > 8 -> String.duplicate(small, digit - 8) <> large
      digit > 4 -> middle <> String.duplicate(small, digit - 5)
      digit == 4 -> small <> middle
    end <> to_roman(digits)
  end
end
