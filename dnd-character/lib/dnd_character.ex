defmodule DndCharacter do
  @type t :: %__MODULE__{
          strength: pos_integer(),
          dexterity: pos_integer(),
          constitution: pos_integer(),
          intelligence: pos_integer(),
          wisdom: pos_integer(),
          charisma: pos_integer(),
          hitpoints: pos_integer()
        }

  defstruct ~w[strength dexterity constitution intelligence wisdom charisma hitpoints]a

  @spec modifier(pos_integer()) :: integer()
  def modifier(score) do
    Integer.floor_div(score - 10, 2)
  end

  @spec ability :: pos_integer()
  def ability do
    rolls =
      for _ <- 1..4,
          do: Enum.random([1, 2, 3, 4, 5, 6])

    List.delete(rolls, Enum.min(rolls))
    |> Enum.sum()
  end

  @spec character :: t()
  def character do
    const = ability()

    %__MODULE__{
      strength: ability(),
      dexterity: ability(),
      constitution: const,
      intelligence: ability(),
      wisdom: ability(),
      charisma: ability(),
      hitpoints: 10 + modifier(const)
    }
  end
end
