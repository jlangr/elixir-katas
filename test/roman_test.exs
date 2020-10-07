defmodule RomanTest do
  use ExUnit.Case

  test "converts" do
    assert Roman.convert(1) == "I"
    assert Roman.convert(2) == "II"
    assert Roman.convert(3) == "III"
    assert Roman.convert(4) == "IV"
    assert Roman.convert(10) == "X"
    assert Roman.convert(20) == "XX"
    assert Roman.convert(23) == "XXIII"
    assert Roman.convert(1996) == "MCMXCVI"
  end
end
