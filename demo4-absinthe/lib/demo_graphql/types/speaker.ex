defmodule DemoGraphQL.Types.Speaker do
  use Absinthe.Schema.Notation

  import Absinthe.Resolution.Helpers

  alias DemoGraphQL.Resolvers.Talk, as: TalkResolver

  # Types
  @desc "The information of a speaker"
  object :speaker do
    field :id, :id
    field :name, :string
    field :handle, :string
    field :email, :string
    field :website, :string
  end 
end
