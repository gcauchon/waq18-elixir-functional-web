defmodule DemoTest.DataCase do 
  use ExUnit.CaseTemplate

  alias Ecto.{Adapters.SQL.Sandbox, Changeset}

  alias Demo.Repo
  
  using do
    quote do
      import Ecto
      import Ecto.{Changeset, Query}

      alias Demo.Repo
      alias DemoTest.Factory
    end
  end
  
  setup tags do
    :ok = Sandbox.checkout(Repo)

    unless tags[:async] do
      Sandbox.mode(Repo, {:shared, self()})
    end

    :ok
  end
end
