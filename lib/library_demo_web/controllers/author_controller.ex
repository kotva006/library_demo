defmodule LibraryDemoWeb.AuthorController do
  use LibraryDemoWeb, :controller

  alias LibraryDemo.Author

  def index(conn, _params) do
    authors = Author.list()
    render(conn, :index, authors: authors)
  end

  def show(conn, _params) do
    #TODO implement
    conn
  end

  def new(conn, _params) do
    changeset = Author.changeset(%Author{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, params) do
    IO.inspect(params)
    #TODO handle more errors
    {:ok, _model} = Author.create(Map.get(params, "author"))
    conn
    |> send_resp(201, "")
  end

  def edit(conn, _params) do
    #TODO implement
    conn
  end

  def update(conn, _params) do
    #TODO implement
    conn
  end

  def delete(conn, _params) do
    conn
  end
end
