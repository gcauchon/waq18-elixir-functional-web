defmodule Demo.Repo.Migrations.AddStartsAtToAgenda do
  use Ecto.Migration

  def change do
    alter table("agenda") do
      add :starts_at, :naive_datetime
    end 
  end
end
