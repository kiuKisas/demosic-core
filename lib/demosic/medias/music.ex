defmodule Demosic.Medias.Music do
  use Ecto.Schema
  import Ecto.Changeset


  schema "musics" do
    field :path, :string

    timestamps()
  end

  @doc false
  def changeset(music, attrs) do
    music
    |> cast(attrs, [:path])
    |> validate_required([:path])
  end
end
