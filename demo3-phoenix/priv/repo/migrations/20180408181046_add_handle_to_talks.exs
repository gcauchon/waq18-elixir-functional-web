defmodule Demo.Repo.Migrations.AddHandleToTalk do
  use Ecto.Migration

  def change do
    alter table("talks") do
      add(:handle, :string)
    end
  end
end
