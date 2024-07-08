defmodule LibraryDemo.Repo do
  use Ecto.Repo,
    otp_app: :library_demo,
    adapter: Ecto.Adapters.Postgres
end
