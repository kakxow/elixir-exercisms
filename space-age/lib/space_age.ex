defmodule SpaceAge do
  @base 31_557_600
  @year_in_seconds %{
    mercury: @base * 0.2408467,
    venus: @base * 0.61519726,
    earth: @base,
    mars: @base * 1.8808158,
    jupiter: @base * 11.862615,
    saturn: @base * 29.447498,
    uranus: @base * 84.016846,
    neptune: @base * 164.79132
  }
  @type planet ::
          :mercury
          | :venus
          | :earth
          | :mars
          | :jupiter
          | :saturn
          | :uranus
          | :neptune

  @doc """
  Return the number of years a person that has lived for 'seconds' seconds is
  aged on 'planet'.
  """
  @spec age_on(planet, pos_integer) :: float
  def age_on(planet, seconds) do
    (seconds / @year_in_seconds[planet])
    |> Float.round(2)
  end
end
