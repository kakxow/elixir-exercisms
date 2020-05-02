defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t(), [String.t()]) :: [String.t()]
  def match(base, candidates) do
    base = String.downcase(base)
    base_map = String.graphemes(base) |> Enum.frequencies()

    Enum.filter(
      candidates,
      fn el ->
        el = String.downcase(el)
        String.graphemes(el) |> Enum.frequencies() == base_map && el != base
      end
    )
  end
end
