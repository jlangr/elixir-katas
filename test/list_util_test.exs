defmodule ListUtilTest do
  use ExUnit.Case

  import ListUtil

  test "but last does nothing on empty list" do
    assert but_last([]) === []
  end

  test "but last removes everything from single element list" do
    assert but_last([2]) === []
  end

  test "but last ..." do
    assert but_last([1, 2, 3]) === [1, 2]
  end

end
