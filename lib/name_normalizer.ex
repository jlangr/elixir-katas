defmodule NameNormalizer do
  def normalize(name) do
    String.trim(name) |> parts |> format
  end

  def parts(name), do: String.split(name, " ")

  def format(parts) do
    cond do
      is_mononym(parts) -> format_mononym(parts)
      is_duonym(parts) -> format_duonym(parts)
      true -> format_multinym(parts)
    end
  end

  def format_mononym(parts), do: first_name(parts)

  def format_duonym(parts), do: last_name(parts) <> ", " <> first_name(parts)

  def format_multinym(parts), do: last_name(parts) <> ", " <> first_name(parts) <> " " <> middle_initials(parts)

  def middle_initials(parts), do: middle(parts) |> Enum.map(&initial/1) |> Enum.join(" ")

  def middle([_ | tail]) do
    [_ | tail ] = Enum.reverse(tail)
    Enum.reverse(tail)
  end

#  def middle(list) do
#    list |> Enum.drop(1) |> Enum.take(length(list) - 2)
#  end

  def middle_initial(parts), do: parts |> middle_name |> initial

  def initial(name) do
    case String.graphemes(name) do
      [first] -> first
      [first | _] -> first <> "."
    end
  end

  def middle_name(parts), do: Enum.at(parts, 1)

  def last_name(parts), do: List.last(parts)

  def first_name(parts), do: List.first(parts)

  def is_mononym(parts), do: length(parts) === 1

  def is_duonym(parts), do: length(parts) === 2
end
