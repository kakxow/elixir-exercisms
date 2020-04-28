defmodule Isogram do
  @doc """
  Determines if a word or sentence is an isogram
  """
  @spec isogram?(String.t()) :: boolean
  def isogram?(sentence) do
    sentence
    |> to_charlist()
    |> check
  end

  @spec check(list, list) :: boolean
  defp check(list, acc \\ [])
  defp check([], _acc), do: true

  defp check([head | tail], acc) do
    if head in acc and head not in [? , ?-] do
      false
    else
      check(tail, acc ++ [head])
    end
  end
end
