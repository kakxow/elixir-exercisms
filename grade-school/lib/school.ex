defmodule School do
  @moduledoc """
  Simulate students in a school.

  Each student is in a grade.
  """

  @doc """
  Add a student to a particular grade in school.
  """
  @spec add(map, String.t(), integer) :: map
  def add(db, name, grade) do
    Map.update(db, grade, [name], fn ls -> ls ++ [name] end)
  end

  @doc """
  Return the names of the students in a particular grade.
  """
  @spec grade(map, integer) :: [String.t()]
  def grade(db, grade) do
    Map.get(db, grade, [])
  end

  @doc """
  Sorts the school by grade and name.
  """
  @spec sort(map) :: [{integer, [String.t()]}]
  def sort(db) do
    Map.keys(db)
    |> Enum.sort()
    |> Enum.map(&{&1, Enum.sort(db[&1])})

    # for key <- Map.keys(db) |> Enum.sort() do
    #  {key, Enum.sort(db[key])}
    # end
  end
end
