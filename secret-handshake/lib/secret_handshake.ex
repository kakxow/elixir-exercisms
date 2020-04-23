defmodule SecretHandshake do
  @doc """
  Determine the actions of a secret handshake based on the binary
  representation of the given `code`.

  If the following bits are set, include the corresponding action in your list
  of commands, in order from lowest to highest.

  1 = wink
  10 = double blink
  100 = close your eyes
  1000 = jump

  10000 = Reverse the order of the operations in the secret handshake
  """
  @meh {"wink", "double blink", "close your eyes", "jump", "reverse"}
  @spec commands(code :: integer) :: list(String.t())
  def commands(code) do
    comm(code, 0, [])
  end

  defp comm(code, _counter, list) when code == 0 do
    case list do
      ["reverse" | tail] -> tail
      _ -> Enum.reverse(list)
    end
  end

  defp comm(code, counter, list) do
    new_list =
      if rem(code, 2) == 1 do
        try do
          [elem(@meh, counter) | list]
        rescue
          ArgumentError -> list
        end
      else
        list
      end

    comm(div(code, 2), counter + 1, new_list)
  end
end
