defmodule JsonEx.Mixfile do
  use Mix.Project

  def project do
    [app: :json_ex,
     version: "0.2.0",
     elixir: "~> 1.3",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  def application do
    [applications: [:logger, :atomic_map, :poison]]
  end

  defp deps do
    [
      {:poison, "~> 2.2 or ~> 3.0 or ~> 4.0"},
      {:atomic_map, "~> 0.8"}
    ]
  end
end
