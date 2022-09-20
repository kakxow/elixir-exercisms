defmodule BasketballWebsite do
  def extract_from_path(data, path) do
    extractor(data, String.split(path, "."))
  end

  defp extractor(data, []), do: data

  defp extractor(data, [h | t]) do
    extractor(data[h], t)
  end

  def get_in_path(data, path) do
    get_in(data, String.split(path, "."))
  end
end
