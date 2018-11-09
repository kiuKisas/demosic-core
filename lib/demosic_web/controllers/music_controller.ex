defmodule DemosicWeb.MusicController do
  use DemosicWeb, :controller
  
  alias Demosic.Medias
  alias Membrane.Pipeline

  def index(conn, _params) do
    changeset = Medias.change_music(%Medias.Music{})
    musics = Medias.list_musics()
    render(conn, "index.html", musics: musics, changeset: changeset, action: music_path(conn, :create))
  end
  # should move to Room/playing/something later
  def create(conn, %{"music" => %{"id" => music_id}}) do
    music = Medias.get_music!(music_id)
    {:ok, pid} = Pipeline.start_link(Medias.Membrane, Path.expand(music.path), [])
    Pipeline.play(pid)
    index(conn, %{})

  end

end
