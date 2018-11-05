defmodule Demosic.Auth.User do
  @moduledoc """
    User Model with hash password
  """
  use Ecto.Schema
  import Ecto.Changeset

  alias Comeonin.Bcrypt
  alias Demosic.Auth.User

  schema "users" do
    field :password, :string
    field :username, :string

    timestamps()
  end

  @doc false
  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:username, :password])
    |> validate_required([:username, :password])
    |> put_passhash()
  end

  defp put_passhash(%Ecto.Changeset{valid?: true, changes: %{password: password}} = changeset) do
    change(changeset, password: Bcrypt.hashpwsalt(password))
  end

  defp put_passhash(changeset), do: changeset
end
