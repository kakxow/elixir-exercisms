defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(String.t()) :: String.t()
  def abbreviate(string) do
    string_no_punct = Regex.replace(~r/[[:punct:]]/, string, "")

    prepared_string = Regex.replace(~r/[[:upper:]](?=[[:lower:]])/, string_no_punct, " \\0")

    for <<first::binary-size(1), _::binary>> <- String.split(prepared_string),
        into: "",
        do:
          first
          |> String.upcase()
  end
end
