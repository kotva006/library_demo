defmodule LibraryDemoWeb.BookController do
  use LibraryDemoWeb, :controller

  alias LibraryDemo.Book

  def show(conn, _params) do
    #TODO implement
    conn
  end

  def new(conn, _params) do
    changeset = Book.changeset(%Book{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, params) do
    #TODO implement
    IO.inspect(params)
    conn
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
