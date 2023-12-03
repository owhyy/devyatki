defmodule DevyatkiWeb.PostListComponent do
  use DevyatkiWeb, :live_component

  @topic "posts"

  def render(assigns) do
    ~H"""
    <div>
      <h1>Newest offers</h1>
      <ul>
        <%= for post <- @posts do %>
          <li data-id={post.id}>
            <%= post.title %>
          </li>
        <% end %>
      </ul>
    </div>
    """
  end
end
