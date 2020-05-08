defmodule BeerSong do
  @spec wall(integer) :: String.t()
  def wall(number), do: "#{bottles(number)} of beer on the wall"

  @spec num(integer) :: String.t()
  def num(0), do: "no more"
  def num(-1), do: "99"
  def num(number), do: "#{number}"

  @spec bottles(integer) :: String.t()
  def bottles(1), do: "1 bottle"
  def bottles(number), do: "#{num(number)} bottles"

  @start_of_line2 "Take one down and pass it around"
  @spec start_of_line2(integer) :: String.t()
  def start_of_line2(-1), do: "Go to the store and buy some more"
  def start_of_line2(0), do: @start_of_line2 |> String.replace("one", "it")
  def start_of_line2(_), do: @start_of_line2

  @doc """
  Get a single verse of the beer song
  """
  @spec verse(integer) :: String.t()
  def verse(number) do
    line1 =
      "#{wall(number)}, #{bottles(number)} of beer.\n"
      |> String.capitalize()

    line2 = "#{start_of_line2(number - 1)}, #{wall(number - 1)}.\n"

    line1 <> line2
  end

  @doc """
  Get the entire beer song for a given range of numbers of bottles.
  """
  @spec lyrics(Range.t()) :: String.t()
  def lyrics(), do: lyrics(99..0)

  def lyrics(range) do
    Enum.map(range, &verse(&1))
    |> Enum.join("\n")
  end
end
