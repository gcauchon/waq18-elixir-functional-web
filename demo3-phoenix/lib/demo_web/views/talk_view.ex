defmodule DemoWeb.TalkView do
  use DemoWeb, :view
  alias DemoWeb.TalkView

  def render("index.json", %{talks: talks}) do
    %{data: render_many(talks, TalkView, "talk.json")}
  end

  def render("show.json", %{talk: talk}) do
    %{data: render_one(talk, TalkView, "talk.json")}
  end

  def render("talk.json", %{talk: talk}) do
    %{id: talk.id}
  end
end
