use Mix.Config

config :dark_jason,
  api_key: System.get_env("DARKSKY_API_KEY"),
  defaults: [
    units: "us",
    lang: "en"
  ]
