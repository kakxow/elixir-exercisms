defmodule Strain do
  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns true.

  Do not use `Enum.filter`.
  """

  def keep(list, _fun, acc \\ {}) when list == [] do
    acc
  end

  def keep([head | tail], fun, acc \\ {}) do
    if fun.(head) do
      keep(tail, fun, Tuple.append(acc, head))
    else
      keep(tail, fun, acc)
    end
  end

  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns false.

  Do not use `Enum.reject`.
  """
  @spec discard(list :: list(any), fun :: (any -> boolean)) :: list(any)
  def discard(list, fun) do
    for el <- list, not fun.(el), do: el
  end
end
