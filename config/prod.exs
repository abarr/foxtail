use Mix.Config

config :foxtail, FoxtailWeb.Endpoint,
  server: true,
  http: [
    port: String.to_integer(System.get_env("PORT") || "4000"),
    transport_options: [socket_opts: [:inet6]]
  ],
  url: [host: "foxtail.consulting", port: 80],
  check_origin: [
    "https://foxtail.consulting",
    "https://www.foxtail.consulting"
  ],
  secret_key_base: System.get_env("KEY_BASE"),
  live_view: [signing_salt: System.get_env("SIGNING_SALT")]

config :foxtail, Foxtail.Contact.Mailer,
  adapter: Swoosh.Adapters.Mailgun,
  api_key: System.get_env("MAILGUN_KEY"),
  domain: System.get_env("DOMAIN"),
  to_email: System.get_env("EMAIL")

# Do not print debug messages in production
config :logger, level: :info
