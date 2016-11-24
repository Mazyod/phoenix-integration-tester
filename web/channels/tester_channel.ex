defmodule Tester.TesterChannel do
  use Tester.Web, :channel


  def join("tester:" <> _id, _payload, socket) do
    send self(), :after_join
    {:ok, socket}
  end


  def handle_info(:after_join, socket) do
    push socket, "after_join", %{message: "Welcome!"}
    {:noreply, socket}
  end

end
