defmodule Relack.Router do
  use Relack.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", Relack do
    pipe_through :api
  end
end
