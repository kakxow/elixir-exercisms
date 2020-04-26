defmodule RunLengthEncoder do
  @doc """
  Generates a string where consecutive elements are represented as a data value and count.
  "AABBBCCCC" => "2A3B4C"
  For this example, assume all input are strings, that are all uppercase letters.
  It should also be able to reconstruct the data into its original form.
  "2A3B4C" => "AABBBCCCC"
  """
  @spec encode(String.t()) :: String.t()
  def encode(string) do
    Regex.scan(~r/(.)\1*/u, string, capture: :first)
    |> List.flatten()
    |> Enum.map_join(fn el ->
      case String.length(el) do
        1 -> el
        _ -> to_string(String.length(el)) <> String.first(el)
      end
    end)
  end

  @spec decode(String.t()) :: String.t()
  def decode(string) do
    ~r/((\d+)(.))|(?<!\d)./u
    |> Regex.replace(string, fn
      _, _, count, char
      when char != "" ->
        :binary.copy(char, String.to_integer(count))

      char, _, _, _ ->
        char
    end)
  end
end
