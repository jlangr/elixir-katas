defmodule StringUtil do
  def count_char(string, char) do
    string |> to_char_list |> Enum.filter(&(&1 === char)) |> length
  end
end
