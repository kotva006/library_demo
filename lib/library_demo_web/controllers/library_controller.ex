defmodule LibraryDemoWeb.LibraryController do
  use LibraryDemoWeb, :controller

  def index(conn, _params) do
    conn
    |> assign(:changeset, %{})
    |> render(:index)
  end

  def search(conn, _params) do
    conn
    |> assign(:changeset, %{})
    |> render(:search)
  end

  def redirect_to_library(conn, _params) do
    redirect(conn, to: ~p"/library")
  end
end
