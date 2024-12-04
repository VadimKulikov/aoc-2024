defmodule AOC.D3 do
  def first() do
    File.read!("input.txt")
    |> String.trim()
    |> then(fn str ->
      Regex.scan(~r/mul\((\d{1,3}),(\d{1,3})\)/, str, capture: :all_but_first)
    end)
    |> Enum.map(fn [x, y] -> String.to_integer(x) * String.to_integer(y) end)
    |> Enum.sum()
    |> IO.inspect()
  end

  def second() do
    input = File.read!("input.txt")

    ~r/
    (do\(\)) # ["do()"]
    |
    (don't\(\)) # ["", "don't()"] we skip first part because it does not match?
    |
    mul\((\d{1,3}),(\d{1,3})\) # ["", "", "1", "3"] captures digits inside in mul() skipping first two parts because they don't match?
    /x
    # Allows formatting in regexp
    |> Regex.scan(input, capture: :all_but_first)
    |> Enum.map(fn
      ["do()"] -> :do
      ["", "don't()"] -> :dont
      ["", "", a, b] -> {String.to_integer(a), String.to_integer(b)}
    end)
    |> Enum.reduce({0, :do}, fn
      :do, {sum, _} -> {sum, :do}
      :dont, {sum, _} -> {sum, :dont}
      # Perform calculation only if current state is :do
      {a, b}, {sum, :do} -> {sum + a * b, :do}
      _, acc -> acc
    end)
    |> elem(0)
    |> IO.inspect()
  end
end

AOC.D3.second()
