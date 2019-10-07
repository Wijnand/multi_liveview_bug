defmodule MultiLiveviewBugWeb.PageController do
  use MultiLiveviewBugWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
