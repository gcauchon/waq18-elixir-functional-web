defmodule Demo.AgendaTest do
  use Demo.DataCase

  alias Demo.Agenda
  alias DemoTest.Factory

  describe "talks" do
    alias Demo.Agenda.Talk

    @valid_attrs %{
      title: "title",
      description: "description",
      starts_at: Factory.random_datetime()
    }

    test "list_talks/0 returns all talks" do
      talks = [
        Factory.insert(:talk),
        Factory.insert(:talk),
        Factory.insert(:talk)
      ]

      assert Agenda.list_talks() == talks    
    end

    test "get_talk/1 returns the talk with given id" do
      talk = Factory.insert(:talk)

      assert Agenda.get_talk(talk.id) == talk
    end

    test "create_talk/1 with valid data creates a talk" do
      speaker = Factory.insert(:speaker)
      result = Map.put(@valid_attrs, :speaker_id, speaker.id)
               |> Agenda.create_talk()

      assert {:ok, %Talk{}} = result
    end

    test "create_talk/1 with invalid data returns error changeset" do
      # Map.put/merge shorthant
      result = Agenda.create_talk(%{@valid_attrs | starts_at: nil})

      assert {:error, %Ecto.Changeset{}} = result 
    end

    test "update_talk/2 with valid data updates the talk" do
      result = Factory.insert(:talk)
             |> Agenda.update_talk(%{title: "foo"})

      assert {:ok, %Talk{} = talk} = result 
      assert "foo" = talk.title
    end

    test "update_talk/2 with invalid data returns error changeset" do
      talk = Factory.insert(:talk)
      result = Agenda.update_talk(talk, %{title: nil})

      assert {:error, %Ecto.Changeset{}} = result
      assert talk == Agenda.get_talk(talk.id)
    end
  end
end
