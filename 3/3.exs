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
end

AOC.D3.first()
