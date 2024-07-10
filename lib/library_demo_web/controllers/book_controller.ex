defmodule LibraryDemoWeb.BookController do
  use LibraryDemoWeb, :controller

  alias LibraryDemo.Book
  alias LibraryDemo.Author

  def index(conn, _params) do
    books = Book.list()
    render(conn, :index, books: books)
  end

  def show(conn, _params) do
    #TODO implement
    conn
  end

  defp author_to_name_id(%{pen_name: pen_name, id: id}) do
    {pen_name, id}
  end

  @spec new(Plug.Conn.t(), any()) :: Plug.Conn.t()
  def new(conn, _params) do
    changeset = Book.changeset(%Book{})
    authors = Author.list();

    author_options = authors |> Enum.map(&author_to_name_id/1)

    conn
    |> assign(:changeset, changeset)
    |> assign(:authors, author_options)
    |> render(:new)
  end

  @spec create(Plug.Conn.t(), any()) :: Plug.Conn.t()
  def create(conn, params) do
    #TODO handle more errors
    {:ok, _model} = Book.create(Map.get(params, "book"))
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
