defmodule Foxtail.Contact.Mail do
  import Swoosh.Email
  alias Foxtail.Contact.Mailer

  def send(name, email, message) do
    to_email = {"Andrew", "andrew@foxtail.consulting"}

    new()
    |> to(to_email)
    |> from({name, email})
    |> subject("Message from website")
    |> text_body(message)
    |> Mailer.deliver
  end


end
