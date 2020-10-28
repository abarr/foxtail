defmodule FoxtailWeb.HomeLive.Index do
  use FoxtailWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    {:ok,
      socket
      |> assign(:page_title, page_title(socket.assigns.live_action))
    }
  end

  defp page_title(:index), do: "Foxtail"
end
