defmodule FoxtailWeb.PostLive.Show do
  use FoxtailWeb, :live_view

  alias Foxtail.Posts

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:post, Posts.get_post!(id))
     |> assign(:menu, "posts")
    }
  end

  defp page_title(:show), do: "Andrew Barr"
end
