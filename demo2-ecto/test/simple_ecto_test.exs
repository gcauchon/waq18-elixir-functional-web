defmodule SimpleEctoTest do
  use ExUnit.Case
  doctest SimpleEcto

  test "greets the world" do
    assert SimpleEcto.hello() == :world
  end
end
