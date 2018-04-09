defmodule Demo.Repo.Migrations.CreateTalks do
  use Ecto.Migration

  def change do
    create table("talks") do
      add(:title, :string)
      add(:description, :text)
      add(:speaker, :string)

      timestamps()
    end
  end
end
