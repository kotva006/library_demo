defmodule LibraryDemoWeb.LibraryController do
  use LibraryDemoWeb, :controller

  def index(conn, _params) do
    render(conn, :index, search: %{})
  end

  def search(conn, params) do
    IO.inspect(params)
    render(conn, :search)
  end

  def redirect_to_library(conn, _params) do
    redirect(conn, to: ~p"/library")
  end
end
