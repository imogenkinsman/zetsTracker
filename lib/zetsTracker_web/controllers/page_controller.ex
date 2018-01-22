defmodule ZetsTrackerWeb.PageController do
  use ZetsTrackerWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
