defmodule FlattenArray do
  @doc """
    Accept a list and return the list flattened without nil values.

    ## Examples

      iex> FlattenArray.flatten([1, [2], 3, nil])
      [1,2,3]

      iex> FlattenArray.flatten([nil, nil])
      []

  """

  @spec flatten(list) :: list
  # The obvious way.
  # def flatten(list) do
  #   List.flatten(list)
  #   |> Enum.filter(&(&1 != nil))
  # end

  # My implementation (is it called tail recursion?).
  def flatten(list) when is_list(list), do: flatten(list, [])
  def flatten([], acc), do: acc
  def flatten([nil | tail], acc), do: flatten(tail, acc)
  def flatten([head | tail], acc) when is_list(head), do: flatten(tail, acc ++ flatten(head, []))
  def flatten([head | tail], acc), do: flatten(tail, acc ++ [head])

  # List.flatten implementation from Erlang/OTP source code.
  # def flatten(list) when is_list(list), do: flatten(list, [])
  # def flatten([], acc), do: acc
  # def flatten([nil | tail], acc), do: flatten(tail, acc)
  # def flatten([head | tail], acc) when is_list(head), do: flatten(head, flatten(tail, acc))
  # def flatten([head | tail], acc), do: [head | flatten(tail, acc)]
end
