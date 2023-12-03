defmodule Devyatki.ItemTest do
  use Devyatki.DataCase
  alias Devyatki.Post

  describe "posts" do
    @valid_attrs %{title: "some text", user_id: 1, cover_image: "https://picsum.photos/800/600", price: 1000, description: "some description"}
    @invalid_attrs %{title: nil}

    def post_fixture(attrs \\ %{}) do
      {:ok, %Post{} = post} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Post.create()

      post
    end

    test "get!/1 returns the post with given id" do
      post = post_fixture(@valid_attrs)
      assert Post.get!(post.id) == post
    end
  
    test "create/1 with valid data creates a post" do
      count_before_inserting = length(Post.list())
      assert {:ok, %Post{} = post} = Post.create(@valid_attrs)
      assert post.title == @valid_attrs.title

      assert count_before_inserting + 1 == length(Post.list())
    end

    test "create/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Post.create(@invalid_attrs)
    end
  
    test "list/0 returns a list of posts stored in the DB" do
      post1 = post_fixture()
      post2 = post_fixture()
      posts = Post.list()
      assert Enum.member?(posts, post1)
      assert Enum.member?(posts, post2)
    end
  end
end
