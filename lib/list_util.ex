defmodule ListUtil do
  def but_last([]), do: []
  def but_last(list) do
    [_ | tail] = Enum.reverse(list)
    Enum.reverse(tail)
  end
end
