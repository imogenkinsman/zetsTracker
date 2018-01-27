defmodule ZetsTrackerWeb.OpenGameControllerTest do
  use ZetsTrackerWeb.ConnCase

  alias ZetsTracker.Trackers

  @create_attrs %{}
  @update_attrs %{}
  @invalid_attrs %{}

  def fixture(:open_game) do
    {:ok, open_game} = Trackers.create_open_game(@create_attrs)
    open_game
  end

  describe "index" do
    test "lists all open_games", %{conn: conn} do
      conn = get conn, open_game_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Open games"
    end
  end

  describe "new open_game" do
    test "renders form", %{conn: conn} do
      conn = get conn, open_game_path(conn, :new)
      assert html_response(conn, 200) =~ "New Open game"
    end
  end

  describe "create open_game" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, open_game_path(conn, :create), open_game: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == open_game_path(conn, :show, id)

      conn = get conn, open_game_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Open game"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, open_game_path(conn, :create), open_game: @invalid_attrs
      assert html_response(conn, 200) =~ "New Open game"
    end
  end

  describe "edit open_game" do
    setup [:create_open_game]

    test "renders form for editing chosen open_game", %{conn: conn, open_game: open_game} do
      conn = get conn, open_game_path(conn, :edit, open_game)
      assert html_response(conn, 200) =~ "Edit Open game"
    end
  end

  describe "update open_game" do
    setup [:create_open_game]

    test "redirects when data is valid", %{conn: conn, open_game: open_game} do
      conn = put conn, open_game_path(conn, :update, open_game), open_game: @update_attrs
      assert redirected_to(conn) == open_game_path(conn, :show, open_game)

      conn = get conn, open_game_path(conn, :show, open_game)
      assert html_response(conn, 200)
    end

    test "renders errors when data is invalid", %{conn: conn, open_game: open_game} do
      conn = put conn, open_game_path(conn, :update, open_game), open_game: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Open game"
    end
  end

  describe "delete open_game" do
    setup [:create_open_game]

    test "deletes chosen open_game", %{conn: conn, open_game: open_game} do
      conn = delete conn, open_game_path(conn, :delete, open_game)
      assert redirected_to(conn) == open_game_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, open_game_path(conn, :show, open_game)
      end
    end
  end

  defp create_open_game(_) do
    open_game = fixture(:open_game)
    {:ok, open_game: open_game}
  end
end
