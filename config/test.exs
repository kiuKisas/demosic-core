use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :demosic, DemosicWeb.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :demosic, Demosic.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "demosic_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
