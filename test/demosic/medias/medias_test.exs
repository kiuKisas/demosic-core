defmodule Demosic.MediasTest do
  use Demosic.DataCase

  alias Demosic.Medias

  describe "musics" do
    alias Demosic.Medias.Music

    @valid_attrs %{path: "some path"}
    @update_attrs %{path: "some updated path"}
    @invalid_attrs %{path: nil}

    def music_fixture(attrs \\ %{}) do
      {:ok, music} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Medias.create_music()

      music
    end

    test "list_musics/0 returns all musics" do
      music = music_fixture()
      assert Medias.list_musics() == [music]
    end

    test "get_music!/1 returns the music with given id" do
      music = music_fixture()
      assert Medias.get_music!(music.id) == music
    end

    test "create_music/1 with valid data creates a music" do
      assert {:ok, %Music{} = music} = Medias.create_music(@valid_attrs)
      assert music.path == "some path"
    end

    test "create_music/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Medias.create_music(@invalid_attrs)
    end

    test "update_music/2 with valid data updates the music" do
      music = music_fixture()
      assert {:ok, music} = Medias.update_music(music, @update_attrs)
      assert %Music{} = music
      assert music.path == "some updated path"
    end

    test "update_music/2 with invalid data returns error changeset" do
      music = music_fixture()
      assert {:error, %Ecto.Changeset{}} = Medias.update_music(music, @invalid_attrs)
      assert music == Medias.get_music!(music.id)
    end

    test "delete_music/1 deletes the music" do
      music = music_fixture()
      assert {:ok, %Music{}} = Medias.delete_music(music)
      assert_raise Ecto.NoResultsError, fn -> Medias.get_music!(music.id) end
    end

    test "change_music/1 returns a music changeset" do
      music = music_fixture()
      assert %Ecto.Changeset{} = Medias.change_music(music)
    end
  end
end
