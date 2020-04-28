defmodule Scrabble do
  @one ["A", "E", "I", "O", "U", "L", "N", "R", "S", "T"]
  @three ["B", "C", "M", "P"]
  @four ["F", "H", "V", "W", "Y"]
  @five ["K"]
  @eight ["J", "X"]
  @ten ["Q", "Z"]

  @doc """
  Calculate the scrabble score for the word.
  """
  @spec score(String.t()) :: non_neg_integer
  def score(word) do
    for char <- String.upcase(word) |> String.graphemes() do
      cond do
        char in @one -> 1
        char in @three -> 3
        char in @four -> 4
        char in @five -> 5
        char in @eight -> 8
        char in @ten -> 10
        true -> 0
      end
    end
    |> Enum.sum()
  end
end
