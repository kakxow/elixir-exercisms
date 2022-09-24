# Use the Plot struct as it is provided
defmodule Plot do
  @enforce_keys [:plot_id, :registered_to]
  defstruct [:plot_id, :registered_to]
end

defmodule CommunityGarden do
  def start(opts \\ []) do
    Agent.start(fn -> {opts, 0} end)
  end

  def list_registrations(pid) do
    {list, _} = Agent.get(pid, & &1)
    list
  end

  def register(pid, register_to) do
    Agent.get_and_update(
      pid,
      fn {list, last_id} ->
        {%Plot{plot_id: last_id + 1, registered_to: register_to},
         {[%Plot{plot_id: last_id + 1, registered_to: register_to} | list], last_id + 1}}
      end
    )
  end

  def release(pid, plot_id) do
    Agent.update(pid, fn {list, id} -> {for(el <- list, el.plot_id != plot_id, do: el), id} end)
  end

  def get_registration(pid, plot_id) do
    list = list_registrations(pid)

    for(el <- list, el.plot_id == plot_id, do: el)
    |> List.first({:not_found, "plot is unregistered"})
  end
end
