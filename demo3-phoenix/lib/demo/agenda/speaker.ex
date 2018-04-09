defmodule Demo.Agenda.Speaker do
  use Ecto.Schema

  import Ecto.Changeset

  alias Demo.Agenda.Talk

  # Schema
  schema "persons" do
    field(:name, :string)
    field(:email, :string)
    field(:website, :string)
    field(:handle, :string)

    has_many(:talks, Talk)

    timestamps()
  end

  # Validations
  @required_fields ~w(name)a
  @optional_fields ~w(email website handle)a

  def changeset(talk, params \\ %{}) do
    talk
    |> cast(params, @required_fields ++ @optional_fields)
    |> validate_required(@required_fields)
    |> unique_constraint(:email)
    |> validate_format(:handle, ~r/@\w+/)
  end
end
