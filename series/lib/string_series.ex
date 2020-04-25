defmodule StringSeries do
  @doc """
  Given a string `s` and a positive integer `size`, return all substrings
  of that size. If `size` is greater than the length of `s`, or less than 1,
  return an empty list.
  """
  @spec slices(s :: String.t(), size :: integer) :: list(String.t())
  def slices(s, size) when size > byte_size(s) or size < 1 or s == "", do: []

  def slices(s, size) do
    cond do
      String.length(s) < size ->
        []

      true ->
        [
          List.first(Regex.run(~r/^.{#{size}}/u, s))
          | slices(Regex.replace(~r/^.(.*)/u, s, "\\1"), size)
        ]
    end
  end
end
