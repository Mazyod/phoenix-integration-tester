defmodule Tester.Router do
  use Tester.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", Tester do
    pipe_through :api
  end
end
