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
    json = Map.take(talk, ~w[id title description speaker]a)
    speaker = Map.take(talk.speaker, ~w[name email handle]a)

    %{json | speaker: speaker}
  end
end
