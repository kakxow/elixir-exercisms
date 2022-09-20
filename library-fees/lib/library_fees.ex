defmodule LibraryFees do
  def datetime_from_string(string) do
    {:ok, datetime, 0} = DateTime.from_iso8601(string)
    DateTime.to_naive(datetime)
  end

  @spec before_noon?(NaiveDateTime) :: boolean()
  def before_noon?(datetime) do
    datetime.hour < 12
  end

  def return_date(checkout_datetime) do
    Date.add(checkout_datetime, if(before_noon?(checkout_datetime), do: 28, else: 29))
  end

  def days_late(planned_return_date, actual_return_datetime) do
    dt = Date.diff(actual_return_datetime, planned_return_date)

    cond do
      dt <= 0 -> 0
      true -> dt
    end
  end

  def monday?(datetime) do
    Date.day_of_week(datetime) == 1
  end

  def calculate_late_fee(checkout, return, rate) do
    date_of_return = datetime_from_string(return)

    datetime_from_string(checkout)
    |> return_date()
    |> days_late(date_of_return)
    |> Kernel.*(rate)
    |> then(fn sum ->
      if monday?(date_of_return) do
        floor(sum / 2)
      else
        sum
      end
    end)
  end
end
