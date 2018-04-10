defmodule DemoGraphQL.Types.Talk do
  use Absinthe.Schema.Notation

  import Absinthe.Resolution.Helpers

  alias DemoGraphQL.Resolvers.Talk, as: TalkResolver

  # Types
  @desc "The information of a talk"
  object :talk do
    field :id, :id
    field :title, :string
    field :description, :string
    field :speaker, :speaker
  end

  # Queries
  object :talk_queries do  
    @desc "Get the list of all talks"
    field :talks, list_of(:talk) do
      resolve(&TalkResolver.list_all/3)
    end

    @desc "Get the details about a talk"
    field :talk, :talk do
      arg(:id, non_null(:id))

      resolve(&TalkResolver.get_talk/3)
    end

  end 
end
