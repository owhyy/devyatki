defmodule DevyatkiWeb.PageLive do
  alias Devyatki.Post
  use DevyatkiWeb, :live_view

  @post_topic "posts"

  @impl true
  def mount(_params, _session, socket) do
    if connected?(socket), do: DevyatkiWeb.Endpoint.subscribe(@post_topic)
    {:ok, assign(socket, posts: Post.list())}
  end
end
