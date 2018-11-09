defmodule DemosicWeb.PlayerController do
  use DemosicWeb, :controller

  alias Demosic.Medias
  alias Membrane.Pipeline

  def create(conn, %{"music" => %{"id" => music_id}}) do
    stop_membrane()
    music = Medias.get_music!(music_id)
    {:ok, pid} = Pipeline.start_link(Medias.Membrane, Path.expand(music.path), name: :membrane)
    Pipeline.play(pid)
    redirect conn, to: music_path(conn, :index)
  end

  def delete(conn, _params) do
    stop_membrane()
    redirect conn, to: music_path(conn, :index)
  end

  defp stop_membrane() do
    pid = Process.whereis(:membrane)
    if pid !== nil do
      Pipeline.stop_and_terminate(pid)
    end
  end


end
