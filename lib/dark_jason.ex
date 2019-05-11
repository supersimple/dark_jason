defmodule DarkJason do
  @moduledoc """
  DarkJason is a Hex Package to talk with darksky.net API.

  For more details on API, refer to https://darksky.net/dev/docs

  ## Usage

      DarkJason.forecast(41.032, -94.234)

      DarkJason.forecast(41.043, -93.23432, %DarkJason{lang: "ar"})

      DarkJason.time_machine(41.043, -93.23432, 13432423)

      DarkJason.time_machine(41.043, -93.23432, 13432423, %DarkJason{lang: "ar", units: "si"})

      DarkJason.current(37, -94)

      DarkJason.current(37, -94, %DarkJason{lang: "ar"})
  """
  @derive Jason.Encoder
  defstruct extend: nil, exclude: nil, lang: "en", units: "auto"
  defdelegate forecast(lat, lng), to: DarkJason.Api
  defdelegate forecast(lat, lng, params), to: DarkJason.Api
  defdelegate time_machine(lat, lng, time), to: DarkJason.Api
  defdelegate time_machine(lat, lng, time, params), to: DarkJason.Api
  def current(lat, lng), do: lat |> forecast(lng) |> _format_current
  def current(lat, lng, params), do: lat |> forecast(lng, params) |> _format_current
  defp _format_current({:ok, %{"currently" => current}}), do: current
  defp _format_current(_), do: {:error, %{reason: "could not retrieve current weather"}}
end
