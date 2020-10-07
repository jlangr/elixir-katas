defmodule FizzBuzzTest do
  use ExUnit.Case

  test "converts numbers" do
    assert FizzBuzz.convert(1) == "1"
    assert FizzBuzz.convert(2) == "2"
  end

  test "converts multiples of 3 to fizz" do
    assert FizzBuzz.convert(3) == "Fizz"
    assert FizzBuzz.convert(12) == "Fizz"
  end

  test "converts multiples of 5 to buzz" do
    assert FizzBuzz.convert(5) == "Buzz"
    assert FizzBuzz.convert(25) == "Buzz"
  end

  test "converts multiples of 3 and 5 to fizzbuzz" do
    assert FizzBuzz.convert(15) == "FizzBuzz"
  end

  test "returns stream of numbers" do
    assert FizzBuzz.fizzbuzz(2) == "1 2"
  end

  test "returns entire stream" do
    assert String.ends_with?(FizzBuzz.fizzbuzz(), "98 Fizz Buzz")
#    IO.puts(FizzBuzz.fizzbuzz())
  end
end
