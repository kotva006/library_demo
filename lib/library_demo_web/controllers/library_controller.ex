defmodule LibraryDemoWeb.LibraryController do
  use LibraryDemoWeb, :controller

  def index(conn, _params) do
    render(conn, :index, search: %{})
  end

  def search(conn, params) do
    IO.inspect(params)
    render(conn, :search)
  end
end
