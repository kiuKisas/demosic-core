defmodule DemosicWeb.MusicView do
  use DemosicWeb, :view

  def length_string(musics) do
    musics
    |> length
    |> Integer.to_string
  end
end
