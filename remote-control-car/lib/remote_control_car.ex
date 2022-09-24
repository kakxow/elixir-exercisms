defmodule RemoteControlCar do
  @enforce_keys [:nickname]
  defstruct [
    :nickname,
    battery_percentage: 100,
    distance_driven_in_meters: 0
  ]

  def new(nickname \\ "none") do
    %RemoteControlCar{nickname: nickname}
  end

  def display_distance(%RemoteControlCar{distance_driven_in_meters: distance}) do
    "#{distance} meters"
  end

  def display_battery(%RemoteControlCar{battery_percentage: battery}) do
    if(battery != 0, do: "Battery at #{battery}%", else: "Battery empty")
  end

  def drive(%RemoteControlCar{} = car) when car.battery_percentage > 0 do
    Map.update!(car, :battery_percentage, &(&1 - 1))
    |> Map.update!(:distance_driven_in_meters, &(&1 + 20))
  end

  def drive(%RemoteControlCar{} = car), do: car
end
