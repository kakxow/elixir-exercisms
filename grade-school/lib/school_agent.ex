defmodule SchoolAgent do
  use Agent

  @moduledoc """
  Simulate students in a school.

  Each student is in a grade.
  """
  def start_link(initial_value) do
    Agent.start_link(fn -> initial_value end, name: __MODULE__)
  end

  @doc """
  Add a student to a particular grade in school.
  """
  @spec add(String.t(), integer) :: map
  def add(name, grade) do
    Agent.get_and_update(
      __MODULE__,
      fn state ->
        new_state = Map.update(state, grade, [name], fn ls -> ls ++ [name] end)
        {new_state, new_state}
      end
    )
  end

  @doc """
  Return the names of the students in a particular grade.
  """
  @spec grade(integer) :: [String.t()]
  def grade(grade) do
    Agent.get(__MODULE__, &Map.get(&1, grade, []))
  end

  @doc """
  Sorts the school by grade and name.
  """
  @spec sort() :: [{integer, [String.t()]}]
  def sort() do
    Agent.get(__MODULE__, fn db ->
      Map.keys(db)
      |> Enum.sort()
      |> Enum.map(&{&1, Enum.sort(db[&1])})
    end)

    # for key <- Map.keys(db) |> Enum.sort() do
    #  {key, Enum.sort(db[key])}
    # end
  end
end
