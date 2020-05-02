defmodule Bob do
  @punct_and_digits [
    "!",
    "@",
    "#",
    "$",
    "%",
    "^",
    "&",
    "*",
    "(",
    ")",
    "-",
    "_",
    "+",
    "=",
    "[",
    "]",
    "{",
    "}",
    ":",
    ";",
    "\"",
    "'",
    "\\",
    "|",
    "/",
    ".",
    ",",
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "0"
  ]
  @spec hey(input :: String.t()) :: String.t()
  def hey(input) do
    # Get rid of all non-letter characters.
    input = String.trim(input) |> String.replace(@punct_and_digits, "")

    cond do
      # Only whitespaces - all trimmed.
      input == "" ->
        "Fine. Be that way!"

      # Uppercase question.
      question?(input) && upper?(input) ->
        "Calm down, I know what I'm doing!"

      # Any question.
      question?(input) ->
        "Sure."

      # Uppercase phrase.
      upper?(input) ->
        "Whoa, chill out!"

      # Whatever.
      true ->
        "Whatever."
    end
  end

  @doc """
  Checks if there are any letters in `input` and if there are any lowercase
  letters.
  """
  @spec upper?(input :: String.t()) :: boolean()
  def upper?(input) do
    # Trim "?" as it may cause `String.upcase/1` to misbehave for my cause.
    input = String.trim(input, "?")
    # Separate check for whitespaces, since whitespace == String.upcase(whitespace)
    input == String.upcase(input) and String.trim(input) != ""
  end

  @spec question?(input :: String.t()) :: boolean()
  def question?(input) do
    String.ends_with?(input, "?")
  end
end
