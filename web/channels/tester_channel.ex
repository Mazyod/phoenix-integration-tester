defmodule Tester.TesterChannel do
  use Tester.Web, :channel
  require Logger

  def join("tester:" <> _id, params, socket) do

    with %{"auth" => _auth} <- params do
      send self(), :after_join
      {:ok, socket}
    else
      _ -> {:error, %{message: "auth required"}}
    end
  end

  def handle_in("push_test", params, socket) do
    Logger.debug("[push_test]: #{inspect params}")
    {:reply, {:ok, params}, socket}
  end

  def handle_in("error_test", _, socket) do
    Logger.debug("[error_test]")
    {:reply, :error, socket}
  end

  def handle_info(:after_join, socket) do
    push socket, "after_join", %{message: "Welcome!"}
    {:noreply, socket}
  end

end
