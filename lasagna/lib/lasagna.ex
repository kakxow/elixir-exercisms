defmodule Lasagna do
  @baking_time 40
  @time_per_layer 2

  def expected_minutes_in_oven() do
    @baking_time
  end

  @spec remaining_minutes_in_oven(number) :: number
  def remaining_minutes_in_oven(time_in_oven) do
    expected_minutes_in_oven() - time_in_oven
  end

  @spec preparation_time_in_minutes(number) :: number
  def preparation_time_in_minutes(number_of_layers) do
    number_of_layers * @time_per_layer
  end

  @spec total_time_in_minutes(number, number) :: number
  def total_time_in_minutes(number_of_layer, minutes_in_oven) do
    preparation_time_in_minutes(number_of_layer) + minutes_in_oven
  end

  def alarm() do
    "Ding!"
  end
end
