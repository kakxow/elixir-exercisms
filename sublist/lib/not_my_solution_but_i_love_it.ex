defmodule Sublist2 do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  @spec compare(list(), list()) :: atom()
  def compare(a, b) do
    cond do
      a === b -> :equal
      sublist?(a, b) -> :sublist
      sublist?(b, a) -> :superlist
      true -> :unequal
    end
  end

  @spec sublist?(list, list) :: boolean()
  defp sublist?([], _), do: true

  defp sublist?(a, b) do
    Stream.chunk_every(b, length(a), 1)
    |> Enum.any?(&(&1 === a))
  end
end
