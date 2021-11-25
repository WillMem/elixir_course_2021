defmodule MyModule do
  @moduledoc """
  Provides a function `frequencies/1` to get the frequency of the words in the text
  """
  
  def frequencies(text) do
    text
    |> String.split()
    |> Enum.reduce(%{}, fn x, acc -> Map.update(acc, x, 1, fn value -> value + 1 end) end)
  end
end
