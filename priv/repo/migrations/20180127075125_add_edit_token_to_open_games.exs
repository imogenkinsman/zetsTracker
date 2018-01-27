defmodule ZetsTracker.Repo.Migrations.AddEditTokenToOpenGames do
  use Ecto.Migration

  def change do
    alter table(:open_games) do
      add :edit_token, :string
    end
  end
end
