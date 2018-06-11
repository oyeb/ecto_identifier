use Mix.Config

config :ecto_identifier, EctoIdentifier.TestRepo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "ecto_identifier",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

config :ecto_identifier, ecto_repos: [EctoIdentifier.TestRepo]
