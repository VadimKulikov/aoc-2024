defmodule AOC.D2 do
  def is_safe(report) do
    check_diff = fn x, y -> abs(x - y) in 1..3 end
    chunks = report |> Enum.chunk_every(2, 1, :discard)

    is_increasing = chunks |> Enum.all?(fn [x, y] -> check_diff.(x, y) and x < y end)
    is_decreasing = chunks |> Enum.all?(fn [x, y] -> check_diff.(x, y) and y < x end)

    is_increasing or is_decreasing
  end

  def first() do
    File.stream!("input.txt")
    |> Stream.map(&String.trim/1)
    |> Enum.to_list()
    |> Enum.map(fn str -> String.split(str) |> Enum.map(&String.to_integer/1) end)
    |> Enum.count(&is_safe/1)
    |> IO.inspect()
  end

  def second() do
    File.stream!("input.txt")
    |> Stream.map(&String.trim/1)
    |> Enum.to_list()
    |> Enum.map(fn str -> String.split(str) |> Enum.map(&String.to_integer/1) end)
    |> Enum.count(fn report ->
      Enum.any?(
        0..(length(report) - 1),
        &(report |> List.delete_at(&1) |> is_safe())
      )
    end)
    |> IO.inspect()
  end
end
