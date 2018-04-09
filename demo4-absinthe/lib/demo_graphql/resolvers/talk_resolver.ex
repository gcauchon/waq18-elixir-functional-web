defmodule DemoGraphQL.Resolvers.Talk do

  alias Demo.Agenda

  def list_all(_, _args, _context) do
    {:ok, Agenda.list_talks()}
  end

  # Dataloader
  def data, do: Dataloader.Ecto.new(Demo.Repo, query: &query/2)

  def query(queryable, _args), do: queryable
end
