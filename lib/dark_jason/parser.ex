defmodule DarkJason.Parser do
  @moduledoc """
  Generic parser to parse all the darksky api responses
  """

  @type status_code :: integer
  @type response ::
          {:ok, [struct]} | {:ok, struct} | :ok | {:error, map, status_code} | {:error, map} | any

  @doc """
  Parses the response from darksky API calls
  """
  @spec parse(tuple) :: response
  def parse(response) do
    case response do
      {:ok, %HTTPoison.Response{body: body, headers: _, status_code: status}}
      when status in [200, 201] ->
        {:ok, parse_success_response(body)}

      {:ok, %HTTPoison.Response{body: _, headers: _, status_code: 204}} ->
        :ok

      {:ok, %HTTPoison.Response{body: body, headers: _, status_code: 403}} ->
        {:error, body, 403}

      {:ok, %HTTPoison.Response{body: body, headers: _, status_code: status}} ->
        parse_error_response(body, status)

      {:error, %HTTPoison.Error{id: _, reason: reason}} ->
        {:error, %{reason: reason}}

      _ ->
        response
    end
  end

  defp parse_error_response(body, status) do
    case Jason.decode(body) do
      {:ok, json} -> {:error, json, status}
      {:error, error} -> {:error, %{reason: "response can not be decoded."}, status}
    end
  end

  defp parse_success_response(body) do
    Jason.decode!(body)
  end
end
