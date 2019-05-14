defmodule DarkJason.Mixfile do
  use Mix.Project

  def project do
    [
      app: :dark_jason,
      version: "0.1.8",
      elixir: "~> 1.7",
      description: "A Darksky.net weather api client for Elixir",
      source_url: "https://github.com/supersimple/dark_jason",
      package: package(),
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      docs: [extras: ["README.md"]],
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger, :httpoison]
    ]
  end

  defp deps do
    [
      {:httpoison, "~> 1.5"},
      {:jason, "~> 1.1"},
      {:earmark, "~> 1.0", only: :dev},
      {:ex_doc, "~> 0.19", only: :dev},
      {:exvcr, "~> 0.10", only: :test},
      {:credo, "~> 0.10", only: [:dev, :test], runtime: false}
    ]
  end

  defp package do
    [
      maintainers: [
        "Todd Resudek"
      ],
      licenses: ["Apache-2.0"],
      links: %{"GitHub" => "https://github.com/supersimple/dark_jason"}
    ]
  end
end
