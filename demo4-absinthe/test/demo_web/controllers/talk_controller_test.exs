defmodule DemoWeb.TalkControllerTest do
  use DemoWeb.ConnCase

  alias Demo.Agenda.Talk
  alias DemoTest.Factory

  @valid_attrs %{
    title: "title",
    description: "description",
    starts_at: Factory.random_datetime()
  }

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all talks", %{conn: conn} do
      conn = get(conn, talk_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create talk" do
    test "renders talk when data is valid", %{conn: conn} do
      speaker = Factory.insert(:speaker)

      talk_attrs = Map.put(@valid_attrs, :speaker_id, speaker.id)
      conn = post(conn, talk_path(conn, :create), talk: talk_attrs)
      assert %{"id" => _id} = json_response(conn, 201)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, talk_path(conn, :create), talk: %{@valid_attrs | title: nil})
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update talk" do
    setup [:create_talk]

    test "renders talk when data is valid", %{conn: conn, talk: %Talk{id: id} = talk} do
      talk_attrs = Map.merge(talk, %{description: "bar!"})
                   |> Map.from_struct()
      conn = put(conn, talk_path(conn, :update, talk), talk: talk_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, talk: talk} do
      talk_attrs = Map.merge(talk, %{starts_at: nil})
                   |> Map.from_struct()
      conn = put(conn, talk_path(conn, :update, talk), talk: talk_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  defp create_talk(_) do
    talk = Factory.insert(:talk)
    {:ok, talk: talk}
  end
end
