defmodule DemosicWeb.HelloController do
  use DemosicWeb, :controller

  alias Demosic.Auth.Guardian

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def secret(conn, _params) do
    user = Guardian.Plug.current_resource(conn)
    render(conn, "secret.html", current_user: user)
  end
  
end
