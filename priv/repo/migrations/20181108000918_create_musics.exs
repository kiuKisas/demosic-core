defmodule Demosic.Repo.Migrations.CreateMusics do
  use Ecto.Migration

  def change do
    create table(:musics) do
      add :path, :string

      timestamps()
    end

  end
end
