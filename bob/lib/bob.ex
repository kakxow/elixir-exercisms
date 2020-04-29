defmodule Bob do
  @spec hey(input :: String.t()) :: String.t()
  def hey(input) do
    input = String.trim(input)

    cond do
      # Only whitespaces.
      Regex.match?(~r"^\s*$", input) ->
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
    Regex.match?(~r"[[:alpha:]]"u, input) && !Regex.match?(~r"[[:lower:]]"u, input)
  end

  @spec question?(input :: String.t()) :: boolean()
  def question?(input) do
    Regex.match?(~r"^.*\?$", input)
  end
end
