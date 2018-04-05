defmodule SimpleEcto.Repo.Migrations.CreateAgenda do
  use Ecto.Migration

  def change do
    create table("agenda") do
      add :title, :string
      add :description, :text
      add :speaker, :string

      timestamps()
    end
  end
end
