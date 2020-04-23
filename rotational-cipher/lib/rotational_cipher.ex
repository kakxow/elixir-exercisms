defmodule RotationalCipher do
  @doc """
  Given a plaintext and amount to shift by, return a rotated string.

  Example:
  iex> RotationalCipher.rotate("Attack at dawn", 13)
  "Nggnpx ng qnja"
  """
  @upper ?A..?Z
  @lower ?a..?z
  @spec rotate(text :: String.t(), shift :: integer) :: String.t()
  def rotate(text, shift) do
    for <<c <- text>> do
      rotate_char(c, shift)
    end
    |> to_string()
  end

  defp rotate_char(c, shift) do
    cond do
      c in @upper -> rem(c - ?A + shift, 26) + ?A
      c in @lower -> rem(c - ?a + shift, 26) + ?a
      true -> c
    end
  end
end
