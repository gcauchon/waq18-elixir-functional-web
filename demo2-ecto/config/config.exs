use Mix.Config

config :demo, Demo.Repo,
  adapter: Ecto.Adapters.Postgres,
  url: System.get_env("DATABASE_URL")

config :demo, ecto_repos: [Demo.Repo]

import_config "#{Mix.env()}.exs"
