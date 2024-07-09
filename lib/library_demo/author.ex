defmodule LibraryDemo.Author do
  use Ecto.Schema
  import Ecto.Changeset
  alias LibraryDemo.Repo

  schema "authors" do
    field :first_name, :string
    field :middle_name, :string
    field :last_name, :string
    field :pen_name, :string

    timestamps(type: :utc_datetime)
  end

  def list() do
    Repo.all(__MODULE__)
  end

  def create(attrs) do
    %__MODULE__{}
    |> changeset(attrs)
    |> Repo.insert()
  end

  @doc false
  def changeset(author, attrs \\ %{}) do
    author
    |> cast(attrs, [:first_name, :middle_name, :last_name, :pen_name])
    |> validate_required([:first_name, :last_name])
  end
end
