defmodule MultiLiveviewBugWeb.DataGridLive do
  use Phoenix.LiveView
  alias MultiLiveviewBugWeb.Router.Helpers, as: Routes

  def render(assigns) do
    ~L"""
    <div>
      <h2>This is a fake data grid, rendered as a main page. It uses live_links for internal navigation within this view.</h2>
      <p>Selected filter: <%= @filter %></p>
      <ul>
        <li>Navigation links</li>
        <li><%= live_link "Filter A", to: Routes.live_path(@socket, __MODULE__, filter: "filter_a") %></li>
        <li><%= live_link "Filter B", to: Routes.live_path(@socket, __MODULE__, filter: "filter_b") %></li>
      </ul>
    </div>
    """
  end

  def mount(_session, socket) do
    {:ok, assign(socket, filter: "filter_a")}
  end

  def handle_params(params, _url, socket) do
    filter = Map.get(params, "filter")
    {:noreply, assign(socket, :filter, filter)}
  end
end
