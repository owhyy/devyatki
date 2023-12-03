defmodule Devyatki.Repo.Migrations.CreatePosts do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :title, :string
      add :description, :string
      add :price, :integer
      add :cover_image, :string
      add :user_id, :integer

      timestamps(type: :utc_datetime)
    end
  end
end
