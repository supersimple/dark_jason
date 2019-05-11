# DarkJason
> A Darksky.net weather api client for Elixir that uses Jason

## Credits

This library borrows heavily from [Darkskyx](https://github.com/techgaun/darkskyx).
If you prefer to use Poison, definitely use Darkskyx instead. The purpose of this
library is purely to be able to use Jason for JSON parsing.

## Installation

Add `dark_jason` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [{:dark_jason, "~> 0.1.0"}]
end
```

## Usage

You can use dark_jason to perform forecast as well as time machine request. You will need to configure the darksky api key properly.

### configuration

The simplest would be to set darksky api key as below:

```shell
export DARKSKY_API_KEY=<api_key>
```

Now, in your config.exs (or environment specific configuration), add the config block to configure DarkJason. You can pass keyword list of `units`, `lang`, `excludes` and `extends` for the `defaults` config block which will be used to override the global default configuration. The default configuration is to use `units: auto` and `lang: en`. On top of the default configuration, you can also override the default configuration per request by passing the `%DarkJason{}` struct configured to your liking.

```elixir
config :dark_jason, api_key: System.get_env("DARKSKY_API_KEY"),
  defaults: [
    units: "us",
    lang: "en"
  ]
```

### Examples

```elixir
DarkJason.forecast(41.032, -94.234)

DarkJason.forecast(41.043, -93.23432, %DarkJason{lang: "ar"})

DarkJason.forecast(41.032, -94.234, %DarkJason{exclude: "daily,hourly"})

DarkJason.time_machine(41.043, -93.23432, 13432423)

DarkJason.time_machine(41.043, -93.23432, 13432423, %DarkJason{lang: "ar", units: "si"})

DarkJason.current(37, -94)

DarkJason.current(37, -94, %DarkJason{lang: "ar"})
```

## To Do

- ~~Consider adding shortcuts such as current instead of having to parse response on users side~~
- Consider adding rate-limit and show current day API usage

## Author

- [Samar Acharya](https://github.com/techgaun)

## License

- See [License](LICENSE) for more details.
