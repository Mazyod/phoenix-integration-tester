defmodule Tester.TesterChannelTest do
  use Tester.ChannelCase


  setup %{} do
    {:ok, _, socket} =
      socket("user_id", %{some: :assign})
      |> subscribe_and_join(Tester.TesterChannel, "tester:user_id")

    {:ok, socket: socket}
  end

  test "it receives a welcome message after joining", %{socket: _socket} do
    assert_push "after_join", %{message: "Welcome!"}
  end

end
