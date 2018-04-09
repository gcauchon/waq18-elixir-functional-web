defmodule DemoWeb.TalkController do
  use DemoWeb, :controller

  alias Demo.Agenda
  alias Demo.Agenda.Talk

  action_fallback(DemoWeb.FallbackController)

  def index(conn, _params) do
    talks = Agenda.list_talks()
    render(conn, "index.json", talks: talks)
  end

  def create(conn, %{"talk" => talk_params}) do
    with {:ok, %Talk{} = talk} <- Agenda.create_talk(talk_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", talk_path(conn, :show, talk))
      |> render("show.json", talk: talk)
    end
  end

  def update(conn, %{"id" => id, "talk" => talk_params}) do
    with talk <- Agenda.get_talk(id),
         {:ok, %Talk{} = talk} <- Agenda.update_talk(talk, talk_params) do
      render(conn, "show.json", talk: talk)
    end
  end
end
