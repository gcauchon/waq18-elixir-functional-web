defmodule Demo.Agenda.Talk do
  use Ecto.Schema

  import Ecto.Changeset

  # Schema
  schema "talks" do
    field(:title, :string)
    field(:description, :string)
    field(:speaker, :string)
    field(:handle, :string)
    field(:starts_at, :naive_datetime)

    timestamps()
  end

  # Validations
  @required_fields ~w(
    title
    description
    speaker
    starts_at
  )a

  @optional_fields ~w(
    handle 
  )a


  def changeset(talk, params \\ %{}) do
    talk
    |> cast(params, @required_fields ++ @optional_fields)
    |> validate_required(@required_fields)
    |> validate_format(:handle, ~r/@\w+/)
  end
end
