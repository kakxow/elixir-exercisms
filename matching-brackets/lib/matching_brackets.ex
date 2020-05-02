defmodule MatchingBrackets do
  @doc """
  Checks that all the brackets and braces in the string are matched correctly, and nested correctly
  """
  @spec check_brackets(String.t()) :: boolean
  def check_brackets(str), do: check_brackets(str, [])

  @spec check_brackets(String.t(), list()) :: boolean
  def check_brackets("", []), do: true
  def check_brackets("", _), do: false

  def check_brackets(<<first, rest::binary>>, acc) when first in '[({',
    do: check_brackets(rest, [first | acc])

  def check_brackets(<<?], rest::binary>>, [?[ | acc]),
    do: check_brackets(rest, acc)

  def check_brackets(<<?), rest::binary>>, [?( | acc]),
    do: check_brackets(rest, acc)

  def check_brackets(<<?}, rest::binary>>, [?{ | acc]),
    do: check_brackets(rest, acc)

  def check_brackets(<<first, _::binary>>, _) when first in '])}',
    do: false

  def check_brackets(<<_, rest::binary>>, acc),
    do: check_brackets(rest, acc)
end
