defmodule DarkJason.Utils do
  @moduledoc false

  def api_key, do: Application.get_env(:dark_jason, :api_key)
  def defaults, do: :dark_jason |> Application.get_env(:defaults) |> Enum.into(%{})
  def user_agent, do: [{"User-agent", "DarkJason"}]
  def compression, do: [{"Content-Encoding", "gzip"}]
  def request_headers, do: user_agent() ++ compression()
end
