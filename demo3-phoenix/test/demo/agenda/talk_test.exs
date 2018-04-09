defmodule DemoTest.Agenda.Talk do
  use Demo.DataCase, async: true

  alias Demo.Agenda.Talk

  test "create a valid Talk" do
    changeset = Factory.insert(:talk)
                |> Talk.changeset()

    assert changeset.valid?
  end

  test "create a Talk with a missing field" do
    changeset = Factory.insert(:talk)
                |> Talk.changeset(%{title: nil})

    assert not changeset.valid?
    assert [title: {"can't be blank", [validation: :required]}] = changeset.errors()
  end
end
