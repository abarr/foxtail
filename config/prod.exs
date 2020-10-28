use Mix.Config

config :foxtail, FoxtailWeb.Endpoint,
  server: true,
  http: [
    port: String.to_integer(System.get_env("PORT") || "4001"),
    transport_options: [socket_opts: [:inet6]]
  ],
  url: [host: "foxtail.consulting", port: 80],
  check_origin: [
    "https://foxtail.consulting",
    "http://foxtail.consulting:4001",
    "https://www.foxtail.consulting",
    "http://www.foxtail.consulting:4001"
  ],
  secret_key_base: "TtOqzHhD5+jMWQiY8+yQbqrr+83WsjySCOB+20kHAv9MlQ9DWhddskrMKcpMQuf"

# Do not print debug messages in production
config :logger, level: :info
