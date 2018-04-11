defmodule DemoTest do
  use ExUnit.Case

  test "Get the Fibonnaci number" do
    assert Demo.fib(4) == 3
    assert Demo.fib(40) == 102_334_155
  end
end
