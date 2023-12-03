defmodule DevyatkiWeb.PageLiveTest do
  use DevyatkiWeb.ConnCase
  import Phoenix.LiveViewTest

  test "disconnected and connected mount", %{conn: conn} do
    {:ok, page_live, disconnected_html} = live(conn, "/")
    assert disconnected_html =~ "Newest offers"
    assert render(page_live) =~ "Newest offers"
  end
end
