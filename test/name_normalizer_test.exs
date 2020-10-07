defmodule NameNormalizerTest do
  use ExUnit.Case

  alias NameNormalizer

  test "degenerate case" do
    assert NameNormalizer.normalize("") === ""
  end

  test "mononym" do
    assert NameNormalizer.normalize("Plato") === "Plato"
  end

  test "duonym" do
    assert NameNormalizer.normalize("Jeff Langr") === "Langr, Jeff"
  end

  test "ignores whitespace" do
    assert NameNormalizer.normalize("  Jeff Langr  ") === "Langr, Jeff"
  end

  test "initializes middle name" do
    assert NameNormalizer.normalize("Jeffrey John Langr") === "Langr, Jeffrey J."
  end

  test "does not initialize single-letter middle name" do
    assert NameNormalizer.normalize("Harry S Truman") === "Truman, Harry S"
  end

  test "initializes multiple middle names" do
    assert NameNormalizer.normalize("Jeffrey John Schmidt Langr") === "Langr, Jeffrey J. S."
  end
end
