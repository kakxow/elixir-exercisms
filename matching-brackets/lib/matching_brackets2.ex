defmodule MatchingBracketsold do
  @doc """
  Checks that all the brackets and braces in the string are matched correctly, and nested correctly
  """
  @spec check_brackets(String.t()) :: boolean
  def check_brackets(str) do
    String.graphemes(str)
    |> Enum.reduce_while([], &checker(&1, &2))
    |> length() == 0
  end

  @spec checker(el :: String.t(), acc :: list()) :: tuple()
  defp checker(el, acc) when el in ["[", "(", "{"], do: {:cont, [el | acc]}
  defp checker(el, ["[" | new_acc]) when el == "]", do: {:cont, new_acc}
  defp checker(el, ["(" | new_acc]) when el == ")", do: {:cont, new_acc}
  defp checker(el, ["{" | new_acc]) when el == "}", do: {:cont, new_acc}
  defp checker(el, _) when el in ["]", ")", "}"], do: {:halt, [false]}
  defp checker(_, acc), do: {:cont, acc}
end
