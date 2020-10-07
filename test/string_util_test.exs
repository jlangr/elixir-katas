defmodule StringUtilTest do
  use ExUnit.Case

  import StringUtil

  test "count of char returns 0 when not found" do
    assert count_char("abc", ?x) === 0
  end

  test "count of char returns 1 when occurrence found" do
    assert count_char("abc", ?b) === 1
  end

  test "count of char returns count for multiple occurrences found" do
    assert count_char("abcabcabc", ?b) === 3
  end
end
