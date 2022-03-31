defmodule Tester.TesterChannelTest do
  use Tester.ChannelCase
  alias Tester.UserSocket


  setup %{} do
    {:ok, _, socket} =
      socket(UserSocket, "user_id", %{some: :assign})
      |> subscribe_and_join(Tester.TesterChannel, "tester:user_id", %{"auth" => "test"})

    {:ok, socket: socket}
  end

  test "it requires auth payload" do
    result = socket(UserSocket, "user_id", %{some: :assign})
    |> subscribe_and_join(Tester.TesterChannel, "tester:user_id")

    assert {:error, _} = result
  end

  test "it receives a welcome message & presence state after joining", %{socket: socket} do
    assert_push "after_join", %{message: "Welcome!"}
    presence_list = TesterWeb.Presence.list(socket)
    assert_push "presence_state", ^presence_list
  end

end
