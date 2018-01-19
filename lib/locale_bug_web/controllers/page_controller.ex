defmodule LocaleBugWeb.PageController do
  use LocaleBugWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
