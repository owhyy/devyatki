defmodule Devyatki.Post do
  use Ecto.Schema
  import Ecto.Changeset

  schema "posts" do
    field :description, :string
    field :title, :string
    field :price, :integer
    field :cover_image, :string
    field :user_id, :integer

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:title, :description, :price, :cover_image, :user_id])
    |> validate_required([:title, :price, :user_id])
  end
end
