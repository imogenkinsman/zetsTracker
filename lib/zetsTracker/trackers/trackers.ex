defmodule ZetsTracker.Trackers do
  @moduledoc """
  The Trackers context.
  """

  import Ecto.Query, warn: false
  alias ZetsTracker.Repo

  alias ZetsTracker.Trackers.OpenGame

  @doc """
  Returns the list of open_games.

  ## Examples

      iex> list_open_games()
      [%OpenGame{}, ...]

  """
  def list_open_games do
    Repo.all(OpenGame)
  end

  @doc """
  Gets a single open_game.

  Raises `Ecto.NoResultsError` if the Open game does not exist.

  ## Examples

      iex> get_open_game!(123)
      %OpenGame{}

      iex> get_open_game!(456)
      ** (Ecto.NoResultsError)

  """
  def get_open_game!(id), do: Repo.get!(OpenGame, id)

  @doc """
  Creates a open_game.

  ## Examples

      iex> create_open_game(%{field: value})
      {:ok, %OpenGame{}}

      iex> create_open_game(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_open_game(attrs \\ %{}) do
    %OpenGame{}
    |> OpenGame.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a open_game.

  ## Examples

      iex> update_open_game(open_game, %{field: new_value})
      {:ok, %OpenGame{}}

      iex> update_open_game(open_game, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_open_game(%OpenGame{} = open_game, attrs) do
    open_game
    |> OpenGame.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a OpenGame.

  ## Examples

      iex> delete_open_game(open_game)
      {:ok, %OpenGame{}}

      iex> delete_open_game(open_game)
      {:error, %Ecto.Changeset{}}

  """
  def delete_open_game(%OpenGame{} = open_game) do
    Repo.delete(open_game)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking open_game changes.

  ## Examples

      iex> change_open_game(open_game)
      %Ecto.Changeset{source: %OpenGame{}}

  """
  def change_open_game(%OpenGame{} = open_game) do
    OpenGame.changeset(open_game, %{})
  end
end
