defmodule WordCount do
  @moduledoc """
  Provides a function `frequencies/1` to get the frequency of the words in the text
  """
  def count(path) do
    File.read(path)
    |> frequencies
  end

  defp frequencies({:ok, text}) do
    text
    |> :unicode.characters_to_nfd_binary()
    |> String.downcase()
    |> String.replace(~r/[^a-z-\s]/u, "")
    |> String.split([" ", "\n"], trim: true)
    |> Enum.reduce(%{}, fn x, acc -> Map.update(acc, x, 1, fn value -> value + 1 end) end)
  end

  defp frequencies({:error, reason}) do
    IO.puts("Error, reason: #{reason}")
  end
end