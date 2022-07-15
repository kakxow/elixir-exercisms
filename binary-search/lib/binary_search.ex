defmodule BinarySearch do
  @doc """
    Searches for a key in the tuple using the binary search algorithm.
    It returns :not_found if the key is not in the tuple.
    Otherwise returns {:ok, index}.

    ## Examples

      iex> BinarySearch.search({}, 2)
      :not_found

      iex> BinarySearch.search({1, 3, 5}, 2)
      :not_found

      iex> BinarySearch.search({1, 3, 5}, 5)
      {:ok, 2}

  """
  @spec search(tuple, integer) :: {:ok, integer} | :not_found
  def search(numbers, key) do
    search(numbers, key, 0, tuple_size(numbers) - 1)
  end

  defp search(_numbers, _key, start, finish) when finish < start, do: :not_found

  defp search(numbers, key, start, finish) do
    IO.puts("from #{start} to #{finish}")
    center = div(start + finish, 2)
    central_element = elem(numbers, center)

    cond do
      central_element == key -> {:ok, center}
      central_element < key -> search(numbers, key, center + 1, finish)
      central_element > key -> search(numbers, key, start, center - 1)
    end
  end
end
