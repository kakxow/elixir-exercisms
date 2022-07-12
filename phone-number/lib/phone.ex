defmodule Phone do
  @doc """
  Remove formatting from a phone number.

  Returns "0000000000" if phone number is not valid
  (10 digits or "1" followed by 10 digits)

  ## Examples

  iex> Phone.number("212-555-0100")
  "2125550100"

  iex> Phone.number("+1 (212) 555-0100")
  "2125550100"

  iex> Phone.number("+1 (212) 055-0100")
  "0000000000"

  iex> Phone.number("(212) 555-0100")
  "2125550100"

  iex> Phone.number("867.5309")
  "0000000000"
  """
  @spec number(String.t()) :: String.t()
  def number(raw) do
    case parse(raw) do
      nil -> "0000000000"
      map -> Map.values(map) |> Enum.join()
    end
  end

  @doc """
  Checks if the string is not a valid number.
  """
  def check(raw) do
    digits = Regex.scan(~r"\d", raw)
    length(digits) == 11 && List.first(digits) != ["1"]
  end

  @doc """
  Extracts phone number from a valid string or returns nil.
  """
  def parse(raw) do
    case check(raw) do
      false ->
        ~r"(?<area_code>[2-9]\d{2})\D*(?<exchange_code>[2-9]\d{2})\D*(?<subsciber_number>\d{4})"
        |> Regex.named_captures(raw)

      true ->
        nil
    end
  end

  @doc """
  Extract the area code from a phone number

  Returns the first three digits from a phone number,
  ignoring long distance indicator

  ## Examples

  iex> Phone.area_code("212-555-0100")
  "212"

  iex> Phone.area_code("+1 (212) 555-0100")
  "212"

  iex> Phone.area_code("+1 (012) 555-0100")
  "000"

  iex> Phone.area_code("867.5309")
  "000"
  """
  @spec area_code(String.t()) :: String.t()
  def area_code(raw) do
    parse(raw)["area_code"] || "000"
  end

  @doc """
  Pretty print a phone number

  Wraps the area code in parentheses and separates
  exchange and subscriber number with a dash.

  ## Examples

  iex> Phone.pretty("212-555-0100")
  "(212) 555-0100"

  iex> Phone.pretty("212-155-0100")
  "(000) 000-0000"

  iex> Phone.pretty("+1 (303) 555-1212")
  "(303) 555-1212"

  iex> Phone.pretty("867.5309")
  "(000) 000-0000"
  """
  @spec pretty(String.t()) :: String.t()
  def pretty(raw) do
    case parse(raw) do
      nil -> "(000) 000-0000"
      map -> "(#{map["area_code"]}) #{map["exchange_code"]}-#{map["subsciber_number"]}"
    end
  end
end
