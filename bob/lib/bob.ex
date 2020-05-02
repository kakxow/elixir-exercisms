defmodule Bob do
  @spec hey(input :: String.t()) :: String.t()
  def hey(input) do
    input = String.trim(input)

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

  @spec upper?(input :: String.t()) :: boolean()
  def upper?(input) do
    input == String.upcase(input) and String.downcase(input) != String.upcase(input)
  end

  @spec question?(input :: String.t()) :: boolean()
  def question?(input) do
    String.ends_with?(input, "?")
  end
end
