defmodule LibraryDemoWeb.BookController do
  use LibraryDemoWeb, :controller

  alias LibraryDemo.Book
  alias LibraryDemo.Author

  def show(conn, _params) do
    #TODO implement
    conn
  end

  def author_to_name_id(%{pen_name: pen_name, id: id}) do
    {pen_name, id}
  end

  def new(conn, _params) do
    changeset = Book.changeset(%Book{})
    authors = Author.list();

    author_options = authors |> Enum.map(&author_to_name_id/1)

    conn
    |> assign(:changeset, changeset)
    |> assign(:authors, author_options)
    |> render(:new)
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
