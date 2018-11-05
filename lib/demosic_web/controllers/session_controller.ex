defmodule DemosicWeb.SessionController do
  use DemosicWeb, :controller

  alias Demosic.{Auth, Auth.User, Auth.Guardian}
  
  def new(conn, _params) do
    changeset = Auth.change_user(%User{})
    maybe_user = Guardian.Plug.current_resource(conn)
    if maybe_user do
      redirect(conn, to: "/secret")
    else
      render(conn, "new.html", changeset: changeset, action: session_path(conn, :login), current_user: maybe_user)
    end
  end

  def login(conn, %{"user" => %{"username" => username, "password" => password}}) do
    username
    |> Auth.authenticate_user(password)
    |> login_reply(conn)
  end

  def logout(conn, _) do
    conn
    |> Guardian.Plug.sign_out()
    |> redirect(to: "/login")
  end

  defp login_reply({:ok, user}, conn) do
    conn
    |> put_flash(:success, "Welcome back!")
    |> Guardian.Plug.sign_in(user)
    |> redirect(to: "/secret")
  end

  defp login_reply({:error, reason}, conn) do
    conn
    |> put_flash(:error, to_string(reason))
    |> new(%{})
  end
end
