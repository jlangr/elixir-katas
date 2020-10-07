defmodule NameNormalizer do
  def normalize(name) do
    if StringUtil.count_char(name, ?,) > 1 do
      {:error, "Too many commas"}
    else
      {:ok,
      (String.trim(name) |> extract_base_name |> format_base_name)
        <>
      suffix(name)}
    end
  end

  def suffix(name) do
    case String.split(name, ",") do
      [_] -> ""
      [_, suffix] -> ", " <> String.trim(suffix)
    end
  end

  def extract_base_name(name), do: Enum.at(String.split(name, ","), 0)

  def format_base_name(name), do: String.split(name, " ") |> format

  def format([mononym]), do: mononym
  def format([first, last]), do: last <> ", " <> first
  def format([first | rest]), do: List.last(rest) <> ", " <> first <> " " <> middle_initials(rest)

  def middle_initials(rest) do
    ListUtil.but_last(rest)
    |> Enum.map(&initial/1)
    |> Enum.join(" ")
  end

  def initial(<<one_letter_name :: binary - size(1)>>), do: one_letter_name
  def initial(<<first_letter :: binary - size(1)>> <> _), do: first_letter <> "."
end


