defmodule ZetsTrackerWeb.OpenGameController do
  use ZetsTrackerWeb, :controller

  alias ZetsTracker.Trackers
  alias ZetsTracker.Trackers.OpenGame

  def index(conn, _params) do
    open_games = Trackers.list_open_games()
    render(conn, "index.html", open_games: open_games)
  end

  def new(conn, _params) do
    changeset = Trackers.change_open_game(%OpenGame{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, _params) do
    case Trackers.create_open_game(%{}) do
      {:ok, open_game} ->
        conn
        |> redirect(to: open_game_path(conn, :show, open_game))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    open_game = Trackers.get_open_game!(id)
    render(conn, "show.html", open_game: open_game)
  end

  def edit(conn, %{"id" => id}) do
    open_game = Trackers.get_open_game!(id)
    changeset = Trackers.change_open_game(open_game)
    render(conn, "edit.html", open_game: open_game, changeset: changeset)
  end

  def update(conn, %{"id" => id, "open_game" => open_game_params}) do
    open_game = Trackers.get_open_game!(id)

    case Trackers.update_open_game(open_game, open_game_params) do
      {:ok, open_game} ->
        conn
        |> put_flash(:info, "Open game updated successfully.")
        |> redirect(to: open_game_path(conn, :show, open_game))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", open_game: open_game, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    open_game = Trackers.get_open_game!(id)
    {:ok, _open_game} = Trackers.delete_open_game(open_game)

    conn
    |> put_flash(:info, "Open game deleted successfully.")
    |> redirect(to: open_game_path(conn, :index))
  end
end
