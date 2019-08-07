defmodule DpwWeb.PageController do
  use DpwWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
