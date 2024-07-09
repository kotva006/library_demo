defmodule LibraryDemo.Repo.Migrations.CreateBooks do
  use Ecto.Migration

  def change do
    create table(:books) do
      add :title, :string
      add :cover_url, :string
      add :publication_date, :date
      add :genre, :string
      add :author_id, references(:authors, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:books, [:author_id])
  end
end
