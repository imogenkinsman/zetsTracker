defmodule ZetsTracker.Trackers.OpenGame do
  use Ecto.Schema
  import Ecto.Changeset
  alias ZetsTracker.Trackers.OpenGame


  schema "open_games" do

    timestamps()
  end

  @doc false
  def changeset(%OpenGame{} = open_game, attrs) do
    open_game
    |> cast(attrs, [])
    |> validate_required([])
  end
end
