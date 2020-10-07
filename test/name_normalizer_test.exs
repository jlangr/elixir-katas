defmodule NameNormalizerTest do
  use ExUnit.Case

  import NameNormalizer

  test "degenerate case" do
    assert normalize("") === {:ok, ""}
  end

  test "mononym" do
    assert normalize("Plato") === {:ok, "Plato"}
  end

  test "duonym" do
    assert normalize("Jeff Langr") === {:ok, "Langr, Jeff"}
  end

  test "ignores whitespace" do
    assert normalize("  Jeff Langr  ") === {:ok, "Langr, Jeff"}
  end

  test "initializes middle name" do
    assert normalize("Jeffrey John Langr") === {:ok, "Langr, Jeffrey J."}
  end

  test "does not initialize single-letter middle name" do
    assert normalize("Harry S Truman") === {:ok, "Truman, Harry S"}
  end

  test "initializes multiple middle names" do
    assert normalize("Jeffrey John Schmidt Langr") === {:ok, "Langr, Jeffrey J. S."}
  end

  test "appends suffixes" do
    assert normalize("Jeffrey John Langr,  Esq. ") === {:ok, "Langr, Jeffrey J., Esq."}
  end

  test "fails on too many commas" do
    assert normalize("Hey, Diddle, Diddle") === {:error, "Too many commas"}
  end
end
