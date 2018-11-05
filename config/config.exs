# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :demosic,
  ecto_repos: [Demosic.Repo]

# Configures the endpoint
config :demosic, DemosicWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "TRdl/nWvbF8NRKIGXIMVeCPPJEgnBqzbLpqdqhW4hwOG18/nSCT98PmZ8ALCt3YF",
  render_errors: [view: DemosicWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Demosic.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

# Slime support
config :phoenix, :template_engines,
  slim: PhoenixSlime.Engine,
  slime: PhoenixSlime.Engine

config :phoenix_slime, :use_slim_extension, true
