defmodule DemoTest.Agenda.Talk do
  use DemoTest.DataCase, async: true

  alias Demo.Agenda.Talk

  test "create a valid talk" do
    talk = Factory.insert(:talk)

    changeset = Talk.changeset(talk)
    assert changeset.valid?
  end

  test "create a talk with an invalid handle" do
    talk = Factory.insert(:talk)

    changeset = Talk.changeset(talk, %{handle: "foobar"})
    assert changeset.valid?
  end
end
