defmodule Demo.Talk do
  use Ecto.Schema

  schema "talks" do
    field(:title, :string)
    field(:description, :string)
    field(:speaker, :string)
    field(:starts_at, :naive_datetime)

    timestamps()
  end
end
