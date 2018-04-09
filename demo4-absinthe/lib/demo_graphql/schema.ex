defmodule DemoGraphQL.Schema do
  use Absinthe.Schema

  alias DemoGraphQL.Types.{
    Speaker,
    Talk
  }
  alias DemoGraphQL.Resolvers.Talk, as: TalkResolver

  # Types
  import_types(Speaker)
  import_types(Talk)

  # Queries
  query do
    import_fields(:talk_queries)
  end

  # Context
  def context(context) do
    loader =
      Dataloader.new()
      |> Dataloader.add_source(TalkResolver, TalkResolver.data())

    Map.put(context, :loader, loader)
  end

  def plugins do
    [Absinthe.Middleware.Dataloader] ++ Absinthe.Plugin.defaults()
  end
end
