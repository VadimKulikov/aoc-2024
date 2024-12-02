defmodule AOC.D2 do
  def first() do
    res =
      File.stream!("input.txt")
      |> Stream.map(&String.trim/1)
      |> Enum.to_list()
      |> Enum.map(fn str -> String.split(str) |> Enum.map(&String.to_integer/1) end)
      |> Enum.filter(fn list ->
        chunks =
          list
          |> Enum.chunk_every(2, 1)

        is_increasing =
          chunks
          |> Enum.all?(fn
            [x, y] -> 1 <= abs(x - y) and abs(x - y) <= 3 and x < y
            [_] -> true
          end)

        is_decreasing =
          chunks
          |> Enum.all?(fn
            [x, y] -> 1 <= abs(x - y) and abs(x - y) <= 3 and y < x
            [_] -> true
          end)

        is_increasing or is_decreasing
      end)
      |> Enum.count()

    IO.puts(res)
  end
end

AOC.D2.first()
