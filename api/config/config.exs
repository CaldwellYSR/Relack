# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :relack,
  ecto_repos: [Relack.Repo]

# Configures the endpoint
config :relack, Relack.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "9id66rY2BasM0rHjjrMX8VqedUX7xSpeK3agc6xPtG1U+Vm6NfY8m8JWwD+FNjJz",
  render_errors: [view: Relack.ErrorView, accepts: ~w(json)],
  pubsub: [name: Relack.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :guardian, Guardian,
  issuer: "Relack",
  ttl: {30, :days},
  verify_issuer: true,
  serializer: Relack.GuardianSerializer

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
