defmodule PigLatin do
  @vowels1 ["a", "e", "i", "o", "u"]
  @doc """
  Given a `phrase`, translate it a word at a time to Pig Latin.

  Words beginning with consonants should have the consonant moved to the end of
  the word, followed by "ay".

  Words beginning with vowels (aeiou) should have "ay" added to the end of the
  word.

  Some groups of letters are treated like consonants, including "ch", "qu",
  "squ", "th", "thr", and "sch".

  Some groups are treated like vowels, including "yt" and "xr".
  """
  @spec translate(phrase :: String.t()) :: String.t()
  def translate(phrase) do
    for word <- String.split(phrase) do
      pigify(word)
    end
    |> Enum.join(" ")
  end

  defp pigify(word, acc \\ "")

  defp pigify(<<first::binary-size(1), rest::binary>>, acc)
       when first in @vowels1 do
    cond do
      acc == "" ->
        treat_vowel(first <> rest)

      String.ends_with?(acc <> first, "qu") ->
        treat_consonant(acc <> first, rest)

      true ->
        treat_consonant(acc, first <> rest)
    end
  end

  defp pigify(<<first::binary-size(1), rest::binary>>, acc) do
    case acc <> first do
      <<"x", _::binary-size(1)>> -> treat_vowel(acc <> first <> rest)
      <<"y", _::binary-size(1)>> -> treat_vowel(acc <> first <> rest)
      _ -> pigify(rest, acc <> first)
    end
  end

  defp treat_vowel(word), do: word <> "ay"
  defp treat_consonant(prefix, rest), do: treat_vowel(rest <> prefix)
end
