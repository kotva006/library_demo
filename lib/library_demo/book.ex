defmodule LibraryDemo.Book do
  use Ecto.Schema

  import Ecto.Changeset

  alias LibraryDemo.Repo

  schema "books" do
    field :title, :string
    field :cover_url, :string
    field :publication_date, :date
    field :genre, :string
    field :author_id, :id

    timestamps(type: :utc_datetime)
  end

  def create(attrs) do
    %__MODULE__{}
    |> changeset(attrs)
    |> Repo.insert()
  end

  @doc false
  def changeset(book, attrs \\ %{}) do
    book
    |> cast(attrs, [:title, :cover_url, :publication_date, :genre])
    |> validate_required([:title, :publication_date, :genre])
  end
end
