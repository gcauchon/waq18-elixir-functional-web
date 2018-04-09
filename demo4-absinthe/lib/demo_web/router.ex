defmodule DemoWeb.Router do
  use DemoWeb, :router

  pipeline :api do
    plug(:accepts, ["json"])
  end

  scope "/api", DemoWeb do
    pipe_through(:api)

    resources("/talks", TalkController, except: ~w[new edit]a)
  end

  # GraphQL
  scope "/graph" do
    pipe_through(:api)
    
    forward "/", Absinthe.Plug, 
      schema: DemoGraphQL.Schema
  end
  
  # GraphiQL for development <3
  with :dev <- Mix.env() do
    scope "/graphiql" do
      pipe_through(:api)

      forward "/", Absinthe.Plug.GraphiQL,
        schema: DemoGraphQL.Schema,
        interface: :playground
    end
  end
end
