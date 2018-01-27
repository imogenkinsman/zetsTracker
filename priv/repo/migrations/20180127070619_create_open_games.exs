defmodule ZetsTracker.Repo.Migrations.CreateOpenGames do
  use Ecto.Migration

  def change do
    create table(:open_games) do

      timestamps()
    end

  end
end
