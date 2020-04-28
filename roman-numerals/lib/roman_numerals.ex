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

  defp to_roman([digit | digits]) when digit == 4 do
    {small, middle, _} = Enum.at(@romans, length(digits))
    small <> middle <> to_roman(digits)
  end

  defp to_roman([digit | digits]) when digit == 9 do
    {small, _, large} = Enum.at(@romans, length(digits))
    small <> large <> to_roman(digits)
  end

  defp to_roman([digit | digits]) when digit < 4 do
    {small, _, _} = Enum.at(@romans, length(digits))
    String.duplicate(small, digit) <> to_roman(digits)
  end

  defp to_roman([digit | digits]) when digit > 4 do
    {small, middle, _} = Enum.at(@romans, length(digits))
    middle <> String.duplicate(small, digit - 5) <> to_roman(digits)
  end
end
