defmodule Demo.Repo.Migrations.AddStartsAtToTalk do
  use Ecto.Migration

  # def change do
  #   alter table("talks") do
  #     add(:starts_at, :naive_datetime)
  #   end 
  # end
  #
  # `change` est le shorthand pour la formulation complète suivante :

  def up do
    alter table("talks") do
      add(:starts_at, :naive_datetime)
    end 
  end

  def down do
    alter table("talks") do
      remove(:starts_at)
    end 
  end
end
