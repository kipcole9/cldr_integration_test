# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

config :locale_bug, LocaleBugWeb.Gettext, default_locale: "en", locales: ~w(en de)

config :ex_cldr,
  gettext: LocaleBugWeb.Gettext

# Configures the endpoint
config :locale_bug, LocaleBugWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Gmeyl5ASs5JluyY/UBiZqnWpv4ejZnrQr5POsIiAp+If6IqIelxX1OGtfibnFbUW",
  render_errors: [view: LocaleBugWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: LocaleBug.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
