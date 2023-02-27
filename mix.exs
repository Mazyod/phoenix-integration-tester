defmodule Tester.Mixfile do
  use Mix.Project

  def project do
    [app: :tester,
     version: "0.0.1",
     elixir: "~> 1.14",
     elixirc_paths: elixirc_paths(Mix.env),
     compilers: [:phoenix] ++ Mix.compilers,
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [mod: {Tester, []},
     applications: [:phoenix, :phoenix_pubsub, :cowboy, :logger, :gettext]]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "web", "test/support"]
  defp elixirc_paths(_),     do: ["lib", "web"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [{:phoenix, "~> 1.7.0"},
     {:phoenix_pubsub, "~> 2.1"},
     {:gettext, "~> 0.20"},
     {:plug_cowboy, "~> 2.6"},
     {:jason, "~> 1.4"},
     {:plug, "~> 1.14"}]
  end
end
