defmodule Demo.Agenda.Talk do
  use Ecto.Schema

  import Ecto.Changeset

  alias Demo.Agenda.Speaker

  # Schema
  schema "talks" do
    field(:title, :string)
    field(:description, :string)
    field(:starts_at, :naive_datetime)

    belongs_to(:speaker, Speaker)

    timestamps()
  end

  # Validations
  @required_fields ~w(
    title
    description
    speaker_id
    starts_at
  )a
  @optional_fields []

  def changeset(talk, params \\ %{}) do
    talk
    |> cast(params, @required_fields ++ @optional_fields)
    |> validate_required(@required_fields)
    |> assoc_constraint(:speaker)
  end
end
