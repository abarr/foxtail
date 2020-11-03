defmodule FoxtailWeb.Components.MessageComponent do
  use FoxtailWeb, :live_component
  alias Foxtail.Contact.{Message, Mail}

  @impl true
  def render(assigns) do
    ~L"""

    <div class="mt-6 ">
      <div class="text-center text-green-600"> <%= live_flash(@flash, :success) %> </div>
      <div class="text-center text-red-600"> <%= live_flash(@flash, :error) %> </div>
      <%= f = form_for @changeset, "#", phx_target: @myself, phx_change: "validate", phx_submit: "send_message", class: "space-y-6" %>
        <div>
          <label for="name" class="sr-only">
            Full name
          </label>
          <div class="rounded-md shadow-sm">
            <%= text_input f, :name, [phx_debounce: "blur", class: "appearance-none block w-full px-3 py-2 border border-gray-300 rounded-md placeholder-gray-400 placeholder-text-sm focus:outline-none focus:shadow-outline-blue focus:border-blue-300 transition duration-150 ease-in-out sm:text-sm sm:leading-5", placeholder: "Your name"] %>
          </div>
          <%= error_tag f, :name %>
        </div>

        <div>
          <label for="email" class="sr-only">
            Email
          </label>
          <div class="rounded-md shadow-sm">
            <%= text_input f, :email, [phx_debounce: "blur", class: "appearance-none block w-full px-3 py-2 border border-gray-300 rounded-md placeholder-gray-400 placeholder-text-sm focus:outline-none focus:shadow-outline-blue focus:border-blue-300 transition duration-150 ease-in-out sm:text-sm sm:leading-5", placeholder: "name@example.com"] %>
          </div>
          <%= error_tag f, :email %>
        </div>

        <div>
          <label for="text" class="sr-only">
            Message
          </label>
          <div class="rounded-md shadow-sm">
            <%= textarea f, :text, [phx_debounce: "blur", class: "appearance-none block w-full px-3 py-2 border border-gray-300 rounded-md placeholder-gray-400 placeholder-text-sm focus:outline-none focus:shadow-outline-blue focus:border-blue-300 transition duration-150 ease-in-out sm:text-sm sm:leading-5", placeholder: "Write your message ..."] %>
          </div>
          <%= error_tag f, :text %>
        </div>

        <div>

          <span class="block w-full rounded-md shadow-sm">
            <%= submit "Send Message", phx_disable_with: "Saving ....", class: "w-full flex justify-center py-2 px-4 border border-transparent text-sm font-medium rounded-md text-white bg-blue-600 hover:bg-blue-500 focus:outline-none focus:border-blue-700 focus:shadow-outline-blue active:bg-blue-700 transition duration-150 ease-in-out" %>
          </span>

        </div>
      </form>
    </div>
    """
  end

  def mount(_assigns, socket) do
    {:ok, socket }
  end

  @impl true
  def update(assigns, socket) do
    changeset = Message.changeset(%Message{})
    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("send_message", %{"message" => %{ "name" => name, "email" => email, "text" => message}}, socket) do
    changeset = Message.changeset(%Message{})
    case Mail.send(name, email, message) do
       {:ok, _msg } ->
          {:noreply,
              socket
              |> put_flash(:success, "Your message is on its way!")
              |> assign(:changeset, changeset)
          }
       {:error, _msg } ->
          {:noreply,
              socket
              |> put_flash(:error, "Whoops! Please check your details")
              |> assign(:changeset, changeset)
          }
    end
  end

  @impl true
  def handle_event("validate", %{"message" => message}, socket) do
    changeset =
      %Message{}
      |> Message.changeset(message)
      |> Map.put(:action, :validate)

    {:noreply,
      socket
      |> assign(:changeset, changeset)
      |> clear_flash
    }
  end
end
