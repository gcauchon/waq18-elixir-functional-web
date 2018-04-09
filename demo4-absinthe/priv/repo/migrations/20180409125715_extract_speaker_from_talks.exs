defmodule Demo.Repo.Migrations.ExtractSpeakerFromTalks do
  use Ecto.Migration

  def change do
    create table("persons") do
      add(:name, :string)
      add(:email, :string)
      add(:website, :string)
      add(:handle, :string)

      timestamps()
    end

    create unique_index(:persons, [:email])

    alter table("talks") do
      remove(:speaker)
      remove(:handle)
      add(:speaker_id, references(:persons), null: false)
    end
  end
end
