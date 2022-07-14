defmodule Username do
  @spec sanitize(charlist()) :: charlist
  def sanitize([]), do: ''

  def sanitize([head | tail]) do
    sanitized =
      case head do
        ?ä -> 'ae'
        ?ö -> 'oe'
        ?ü -> 'ue'
        ?ß -> 'ss'
        head when head >= ?a and head <= ?z -> [head]
        ?_ -> '_'
        _ -> ''
      end

    sanitized ++ sanitize(tail)
  end
end
