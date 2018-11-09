defmodule DemosicWeb.MusicController do
  use DemosicWeb, :controller
  
  alias Demosic.Medias

  def index(conn, _params) do
    changeset = Medias.change_music(%Medias.Music{})
    musics = Medias.list_musics()
    render(conn, "index.html", musics: musics, changeset: changeset, action: player_path(conn, :create))
  end
end
