defmodule LocaleBug.Mixfile do
  use Mix.Project

  def project do
    [
      app: :locale_bug,
      version: "0.0.1",
      elixir: "~> 1.4",
      elixirc_paths: elixirc_paths(Mix.env),
      compilers: [:phoenix, :gettext] ++ Mix.compilers ++ [:cldr],
      start_permanent: true, # Mix.env == :prod,
      build_embedded: true,
      deps: deps()
    ]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [
      mod: {LocaleBug.Application, []},
      extra_applications: [:logger, :runtime_tools]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_),     do: ["lib"]

  defp deps do
    [
      {:phoenix, "~> 1.3.0"},
      {:phoenix_pubsub, "~> 1.0"},
      {:phoenix_html, "~> 2.10"},
      {:phoenix_live_reload, "~> 1.0", only: :dev},
      {:gettext, "~> 0.11"},
      {:cowboy, "~> 1.0"},
      # {:ex_cldr, path: "../cldr", override: true},
      {:ex_cldr, "~> 1.0"},
      {:ex_cldr_numbers, "~> 1.0"},
      {:ex_cldr_dates_times, "~> 1.0"},
      {:ex_cldr_units, "~> 1.1"},
      {:ex_cldr_languages, "~> 0.1"},
      {:ex_cldr_territories, "~> 1.0"},
      {:ex_cldr_lists, "~> 1.0"},
      {:benchee, "~> 0.12", optional: true, only: :dev}
    ]
  end
end
