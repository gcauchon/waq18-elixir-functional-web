defmodule Demo.Agenda do
  @moduledoc """
  The Agenda context.
  """

  import Ecto.Query, warn: false

  alias Demo.Repo
  alias Demo.Agenda.Talk

  def list_talks do
    Repo.all(Talk)
    |> Repo.preload(:speaker)
  end

  def get_talk(id) do
    # Repo.get_by(Talk, id: id)
    # Repo.preload(:speaker)
    from(t in Talk, where: [id: ^id], preload: :speaker)
    |> Repo.one()
  end

  def create_talk(attrs \\ %{}) do
    %Talk{}
    |> Talk.changeset(attrs)
    |> Repo.insert_or_update()
  end

  def update_talk(%Talk{} = talk, attrs) do
    talk
    |> Talk.changeset(attrs)
    |> Repo.update()
  end 
end
