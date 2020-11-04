defmodule FoxtailWeb.PostLive.Index do
  use FoxtailWeb, :live_view

  alias Foxtail.Posts

  @impl true
  def mount(_params, _session, socket) do
    {:ok,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:posts, fetch_posts())
     |> assign(:menu, "blog")}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:post, nil)
  end

  defp fetch_posts do
    Posts.list_posts()
  end

  defp page_title(:index), do: "Andrew Barr"
end
