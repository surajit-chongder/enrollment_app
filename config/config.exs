# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :enrollment_app,
  ecto_repos: [EnrollmentApp.Repo]

# Configures the endpoint
config :enrollment_app, EnrollmentApp.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "jgmgPfF7cdC94/wcpLshRZ3408LpBOlueCRrP4WSkf1T2RLhVf7st3AcYUCtflWo",
  render_errors: [view: EnrollmentApp.ErrorView, accepts: ~w(html json)],
  pubsub: [name: EnrollmentApp.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
