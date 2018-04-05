defmodule SimpleEcto.Application do
  @moduledoc false

  use Application

  def start(_type, _args) do
    import Supervisor.Spec

    children = [
      supervisor(SimpleEcto.Repo, [])
    ]

    opts = [strategy: :one_for_one, name: SimpleEcto.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
