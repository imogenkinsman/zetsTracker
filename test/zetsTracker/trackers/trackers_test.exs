defmodule ZetsTracker.TrackersTest do
  use ZetsTracker.DataCase

  alias ZetsTracker.Trackers

  describe "open_games" do
    alias ZetsTracker.Trackers.OpenGame

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def open_game_fixture(attrs \\ %{}) do
      {:ok, open_game} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Trackers.create_open_game()

      open_game
    end

    test "list_open_games/0 returns all open_games" do
      open_game = open_game_fixture()
      assert Trackers.list_open_games() == [open_game]
    end

    test "get_open_game!/1 returns the open_game with given id" do
      open_game = open_game_fixture()
      assert Trackers.get_open_game!(open_game.id) == open_game
    end

    test "create_open_game/1 with valid data creates a open_game" do
      assert {:ok, %OpenGame{} = open_game} = Trackers.create_open_game(@valid_attrs)
    end

    test "create_open_game/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Trackers.create_open_game(@invalid_attrs)
    end

    test "update_open_game/2 with valid data updates the open_game" do
      open_game = open_game_fixture()
      assert {:ok, open_game} = Trackers.update_open_game(open_game, @update_attrs)
      assert %OpenGame{} = open_game
    end

    test "update_open_game/2 with invalid data returns error changeset" do
      open_game = open_game_fixture()
      assert {:error, %Ecto.Changeset{}} = Trackers.update_open_game(open_game, @invalid_attrs)
      assert open_game == Trackers.get_open_game!(open_game.id)
    end

    test "delete_open_game/1 deletes the open_game" do
      open_game = open_game_fixture()
      assert {:ok, %OpenGame{}} = Trackers.delete_open_game(open_game)
      assert_raise Ecto.NoResultsError, fn -> Trackers.get_open_game!(open_game.id) end
    end

    test "change_open_game/1 returns a open_game changeset" do
      open_game = open_game_fixture()
      assert %Ecto.Changeset{} = Trackers.change_open_game(open_game)
    end
  end
end
