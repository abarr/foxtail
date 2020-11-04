defmodule Foxtail.Contact.Message do
  import Ecto.Changeset
  use Ecto.Schema

  embedded_schema do
    field(:name, :string)
    field(:email, :string)
    field(:text, :string)
    field(:answer, :integer)
  end

  def changeset(message, attrs \\ %{}) do
    message
    |> cast(attrs, [:name, :email, :text, :answer])
    |> validate_required([:name, :email, :text, :answer], message: "Please enter all fields")
    |> validate_format(:email, ~r/^[^\s]+@[^\s]+$/,
      message: "Email must have the @ sign and no spaces"
    )
    |> validate_length(:email, max: 160)
  end
end
