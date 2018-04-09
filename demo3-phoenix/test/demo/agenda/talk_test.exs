defmodule DemoTest.Agenda.Talk do
  use Demo.DataCase, async: true

  alias Demo.Agenda.Talk

  test "create a valid talk" do
    talk = Factory.insert(:talk)

    changeset = Talk.changeset(talk)
    assert changeset.valid?
  end

  test "create a talk with a missing field" do
    talk = Factory.insert(:talk)

    changeset = Talk.changeset(talk, %{title: nil})
    assert not changeset.valid?
    assert [title: {"can't be blank", [validation: :required]}] = changeset.errors()
  end

  test "create a talk with an invalid handle" do
    talk = Factory.insert(:talk)

    changeset = Talk.changeset(talk, %{handle: "foobar"})
    assert not changeset.valid?
    assert [handle: {"has invalid format", [validation: :format]}] = changeset.errors()
  end
end
