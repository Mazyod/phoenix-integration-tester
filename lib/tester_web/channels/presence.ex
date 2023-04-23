defmodule TesterWeb.Presence do
  @moduledoc """
  Provides presence tracking to channels and processes.

  See the [`Phoenix.Presence`](https://hexdocs.pm/phoenix/Phoenix.Presence.html)
  docs for more details.
  """
  use Phoenix.Presence,
    otp_app: :tester,
    pubsub_server: Tester.PubSub

  def fetch("tester:" <> _, presences) do
    for {key, %{metas: metas}} <- presences, into: %{} do
      {key, %{metas: metas, device: %{make: "Apple", model: "iPhone 11"}}}
    end
  end
end
