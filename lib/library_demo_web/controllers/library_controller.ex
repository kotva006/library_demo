defmodule LibraryDemoWeb.LibraryController do
  use LibraryDemoWeb, :controller

  def index(conn, _params) do
    render(conn, :index)
  end
end
