defmodule LogLevel do
  @log_levels %{
    0 => {:trace, false},
    1 => {:debug, true},
    2 => {:info, true},
    3 => {:warning, true},
    4 => {:error, true},
    5 => {:fatal, false}
  }

  def to_label(level, legacy?) do
    {tag, legacy} = Map.get(@log_levels, level, {:unknown, true})

    cond do
      not legacy? -> tag
      legacy? == legacy -> tag
      true -> :unknown
    end
  end

  def alert_recipient(level, legacy?) do
    case {to_label(level, legacy?), legacy?} do
      {:error, _leg} -> :ops
      {:fatal, _leg} -> :ops
      {:unknown, true} -> :dev1
      {:unknown, false} -> :dev2
      _ -> nil
    end
  end
end
