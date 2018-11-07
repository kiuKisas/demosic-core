defmodule DemosicWeb.LayoutView do
  use DemosicWeb, :view

  def maybe_logged(conn, current_user) do
    case current_user do
      nil -> render DemosicWeb.LayoutView, "_login.html", conn: conn
      user -> render DemosicWeb.LayoutView, "_logged.html", conn: conn, user: user
    end
  end
end
