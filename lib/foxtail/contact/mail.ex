defmodule Foxtail.Contact.Mail do
  import Swoosh.Email
  alias Foxtail.Contact.Mailer

  def send(name, email, message) do
    to_email = Application.get_env(:foxtail, Foxtail.Contact.Mailer)[:to_email]

    new()
    |> to(to_email)
    |> from({name, email})
    |> subject("Message from foxtail website")
    |> text_body(message)
    |> Mailer.deliver()
  end
end
