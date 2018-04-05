# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
use Mix.Config

config :simple_ecto, SimpleEcto.Repo,
  adapter: Ecto.Adapters.Postgres,
  url: System.get_env("DATABASE_URL")

config :simple_ecto,
  ecto_repos: [SimpleEcto.Repo]

