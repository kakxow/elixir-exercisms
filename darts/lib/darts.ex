defmodule Darts do
  @type position :: {number, number}

  @doc """
  Calculate the score of a single dart hitting a target
  """
  @spec score(position) :: integer
  def score({x, y}) do
    distance_from_center = :math.sqrt(x ** 2 + y ** 2)

    cond do
      distance_from_center <= 1 ->
        10

      distance_from_center <= 5 ->
        5

      distance_from_center <= 10 ->
        1

      distance_from_center > 10 ->
        0
    end
  end
end
