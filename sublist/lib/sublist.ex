defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare(a, []) when a != [], do: :superlist
  def compare([], b) when b != [], do: :sublist

  def compare(a, b) do
    cond do
      a === b ->
        :equal

      length(a) < length(b) ->
        Enum.chunk_every(b, length(a), 1, :discard)
        |> compare_chunks(a, :sublist)

      length(a) > length(b) ->
        Enum.chunk_every(a, length(b), 1, :discard)
        |> compare_chunks(b, :superlist)

      true ->
        :unequal
    end
  end

  defp compare_chunks([], _, _), do: :unequal

  defp compare_chunks([chunk | rest], list, result) do
    cond do
      chunk === list -> result
      true -> compare_chunks(rest, list, result)
    end
  end
end
