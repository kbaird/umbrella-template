defmodule SampleApp.Mixfile do
  use Mix.Project

  def project do
    [app:             :sample_app,
     version:         "0.1.0",
     build_path:      "../../_build",
     config_path:     "../../config/config.exs",
     deps_path:       "../../deps",
     lockfile:        "../../mix.lock",
     elixir:          "~> 1.4",
     elixirc_paths:   elixirc_paths(Mix.env),
     build_embedded:  Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps:            deps()]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    # Specify extra applications you'll use from Erlang/Elixir
    [extra_applications: [:logger, :gproc],
    mod: {SampleApp.Application, []}]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ~w[lib test/support]
  defp elixirc_paths(_),     do: ~w[lib]

  # Dependencies can be Hex packages:
  #
  #   {:my_dep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:my_dep, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
      {:credo,      "~> 0.5", only: [:dev, :test], runtime: false},
      {:exrm,       "~> 1.0.8"},
      {:gproc,      "0.3.1"},
      {:httpoison,  "~> 0.11.0"},
      {:dialyxir,   "~> 0.5", only: [:dev, :test], runtime: false},
      {:poison,     "~> 3.1"}
    ]
  end
end
