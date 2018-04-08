use Mix.Config

config :demo, Demo.Repo,
  adapter: Ecto.Adapters.Postgres,
  url: System.get_env("DATABASE_URL"),
  pool: Ecto.Adapters.SQL.Sandbox

config :logger, level: :warn
