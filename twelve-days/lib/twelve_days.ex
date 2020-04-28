defmodule TwelveDays do
  @presents [
    "twelve Drummers Drumming",
    "eleven Pipers Piping",
    "ten Lords-a-Leaping",
    "nine Ladies Dancing",
    "eight Maids-a-Milking",
    "seven Swans-a-Swimming",
    "six Geese-a-Laying",
    "five Gold Rings",
    "four Calling Birds",
    "three French Hens",
    "two Turtle Doves",
    "a Partridge in a Pear Tree"
  ]
  @verse "On the first day of Christmas my true love gave to me: "
  @number_to_numeral %{
    1 => "first",
    2 => "second",
    3 => "third",
    4 => "fourth",
    5 => "fifth",
    6 => "sixth",
    7 => "seventh",
    8 => "eighth",
    9 => "ninth",
    10 => "tenth",
    11 => "eleventh",
    12 => "twelfth"
  }
  @doc """
  Given a `number`, return the song's verse for that specific day, including
  all gifts for previous days in the same line.
  """
  @spec verse(number :: integer) :: String.t()
  def verse(number) do
    Enum.slice(@presents, -number..-2)
    |> Enum.join(", ")
    |> output(String.replace(@verse, "first", @number_to_numeral[number]))
  end

  @spec output(presents :: String.t(), start :: String.t()) :: String.t()
  defp output("", start) do
    start <> "#{List.last(@presents)}."
  end

  defp output(presents, start) do
    start <> presents <> ", and #{List.last(@presents)}."
  end

  @doc """
  Given a `starting_verse` and an `ending_verse`, return the verses for each
  included day, one per line.
  """
  @spec verses(starting_verse :: integer, ending_verse :: integer) :: String.t()
  def verses(starting_verse, ending_verse) do
    for number <- starting_verse..ending_verse do
      verse(number)
    end
    |> Enum.join("\n")
  end

  @doc """
  Sing all 12 verses, in order, one verse per line.
  """
  @spec sing() :: String.t()
  def sing do
    verses(1, 12)
  end
end
