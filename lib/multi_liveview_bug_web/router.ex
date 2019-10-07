defmodule MultiLiveviewBugWeb.Router do
  use MultiLiveviewBugWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug Phoenix.LiveView.Flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", MultiLiveviewBugWeb do
    pipe_through :browser

    get "/", PageController, :index
    live "/data", DataGridLive
  end

  # Other scopes may use custom stacks.
  # scope "/api", MultiLiveviewBugWeb do
  #   pipe_through :api
  # end
end
