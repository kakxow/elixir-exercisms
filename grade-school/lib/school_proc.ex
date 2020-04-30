defmodule PSchool do
  @moduledoc """
  Simulate students in a school.

  Each student is in a grade.
  """
  def start_link(initial_value) do
    {:ok, pid} = Task.start_link(fn -> loop(initial_value) end)
    Process.register(pid, __MODULE__)
    :ok
  end

  defp loop(map) do
    receive do
      {:add, name, grade, caller} ->
        map = Map.update(map, grade, [name], fn ls -> ls ++ [name] end)
        send(caller, {:ok, map})
        loop(map)

      {:grade, grade, caller} ->
        send(caller, {:ok, Map.get(map, grade, [])})
        loop(map)

      {:sort, caller} ->
        sorted =
          Map.keys(map)
          |> Enum.sort()
          |> Enum.map(&{&1, Enum.sort(map[&1])})

        send(caller, {:ok, sorted})
        loop(map)
    end
  end

  @doc """
  Add a student to a particular grade in school.
  """
  def add(name, grade) do
    send(__MODULE__, {:add, name, grade, self()})

    receive do
      {:ok, value} ->
        value
    end
  end

  @doc """
  Return the names of the students in a particular grade.
  """
  @spec grade(integer) :: [String.t()]
  def grade(grade) do
    send(__MODULE__, {:grade, grade, self()})

    receive do
      {:ok, value} ->
        value
    end
  end

  @doc """
  Sorts the school by grade and name.
  """
  @spec sort() :: [{integer, [String.t()]}]
  def sort() do
    send(__MODULE__, {:sort, self()})

    receive do
      {:ok, value} ->
        value
    end
  end
end
