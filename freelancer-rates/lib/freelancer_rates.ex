defmodule FreelancerRates do
  @billable_hours_per_day 8.0
  @billable_days_per_month 22

  def daily_rate(hourly_rate) do
    @billable_hours_per_day * hourly_rate
  end

  def apply_discount(before_discount, discount) do
    before_discount * (1 - discount / 100)
  end

  def monthly_rate(hourly_rate, discount) do
    (daily_rate(hourly_rate) * @billable_days_per_month)
    |> apply_discount(discount)
    |> ceil
  end

  def days_in_budget(budget, hourly_rate, discount) do
    discounted_rate = hourly_rate |> daily_rate() |> apply_discount(discount)

    Float.floor(budget / discounted_rate, 1)
  end
end
