defmodule DemoTest.Agenda.Speaker do
  use Demo.DataCase, async: true

  alias Demo.Agenda.Speaker

  test "create a valid Speaker" do
    changeset = Factory.insert(:speaker)
                |> Speaker.changeset()

    assert changeset.valid?
  end

  test "create a Speaker with a missing field" do
    changeset = Factory.insert(:speaker)
                |> Speaker.changeset(%{name: nil})

    assert not changeset.valid?
    assert [name: {"can't be blank", [validation: :required]}] = changeset.errors()
  end

  test "create a Speaker with an invalid handle" do
    changeset = Factory.insert(:speaker)
                |>Speaker.changeset(%{handle: "foobar"})

    assert not changeset.valid?
    assert [handle: {"has invalid format", [validation: :format]}] = changeset.errors()
  end
end
