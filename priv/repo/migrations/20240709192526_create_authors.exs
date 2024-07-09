defmodule LibraryDemo.Repo.Migrations.CreateAuthors do
  use Ecto.Migration

  def change do
    create table(:authors) do
      add :first_name, :string
      add :middle_name, :string
      add :last_name, :string
      add :pen_name, :string

      timestamps(type: :utc_datetime)
    end
  end
end
