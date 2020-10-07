defmodule FizzBuzz do
  @fizz "Fizz"
  @buzz "Buzz"

  def fizzbuzz(n \\ 100) do
    Enum.reduce(
      2..n,
      convert(1),
      fn i, s -> s <> " " <> convert(i) end)
  end

  def convert(n) do
    case {rem(n, 3), rem(n, 5), n} do
      {0, 0, _} -> @fizz <> @buzz
      {0, _, _} -> @fizz
      {_, 0, _} -> @buzz
      {_, _, n} -> Integer.to_string(n)
    end
  end
end
