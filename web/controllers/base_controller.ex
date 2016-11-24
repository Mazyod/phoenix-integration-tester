defmodule Tester.BaseController do
  use Tester.Web, :controller

  # call before running the test, to make sure this server is up
  def health_check(conn, _) do
    json(conn, %{ok: true})
  end
end
