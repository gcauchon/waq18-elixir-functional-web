# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :demo, ecto_repos: [Demo.Repo]

# Configure your database
config :demo, Demo.Repo,
  adapter: Ecto.Adapters.Postgres,
  url: System.get_env("DATABASE_URL"),
  pool_size: 10

# Configures the endpoint
config :demo, DemoWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "gMLb5JS0qZM4xLBbGHqSH5AAWHLZOIIzZhMjl+Lyjnn2+gh/U0X5fO/f3wML8yPk",
  render_errors: [view: DemoWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: Demo.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
