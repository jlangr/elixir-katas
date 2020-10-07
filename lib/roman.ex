defmodule Roman do

  def convert(arabic) do
    _conversions = [
      {10, "X"},
      {1, "I"}
    ]
#    Enum.reduce(conversions, "", fn roman, {arabic_digit, roman_digit} ->
#        digits_needed = div(arabic, arabic_digit)
#        String.duplicate(roman_digit, digits_needed) <> convert(arabic - arabic_digit * digits_needed)
#        roman <>
#      end)
    cond do
      arabic >= 1000 -> append_roman(arabic, 1000, "M")
      arabic >= 900 -> append_roman(arabic, 900, "CM")
      arabic >= 500 -> append_roman(arabic, 500, "D")
      arabic >= 400 -> append_roman(arabic, 400, "CD")
      arabic >= 100 -> append_roman(arabic, 100, "C")
      arabic >= 90 -> append_roman(arabic, 90, "XC")
      arabic >= 50 -> append_roman(arabic, 50, "L")
      arabic >= 40 -> append_roman(arabic, 40, "XL")
      arabic >= 10 -> append_roman(arabic, 10, "X")
      arabic >= 9 -> append_roman(arabic, 9, "IX")
      arabic >= 5 -> append_roman(arabic, 5, "V")
      arabic >= 4 -> append_roman(arabic, 4, "IV")
      arabic >= 1 -> append_roman(arabic, 1, "I")
      true -> ""
    end
  end

  def append_roman(arabic, arabic_digit, roman_digit) do
    digits_needed = div(arabic, arabic_digit)
    String.duplicate(roman_digit, digits_needed) <> convert(arabic - arabic_digit * digits_needed)
  end
end
