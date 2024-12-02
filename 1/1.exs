defmodule AOC.D1 do
  def first() do
    {left, right} =
      File.stream!("input.txt")
      |> Stream.map(&String.trim/1)
      |> Enum.to_list()
      |> Enum.map(fn str ->
        [a, b] = String.split(str)
        {String.to_integer(a), String.to_integer(b)}
      end)
      |> Enum.unzip()

    result =
      Enum.zip(left |> Enum.sort(), right |> Enum.sort())
      |> Enum.map(fn {a, b} -> abs(a - b) end)
      |> Enum.sum()

    IO.inspect(result)
  end

  def second() do
    {left, right} =
      File.stream!("input2.txt")
      |> Stream.map(&String.trim/1)
      |> Enum.to_list()
      |> Enum.map(fn str ->
        [a, b] = String.split(str)
        {String.to_integer(a), String.to_integer(b)}
      end)
      |> Enum.unzip()

    map = left |> Enum.frequencies()

    result =
      right
      |> Enum.map(fn x ->
        if Map.has_key?(map, x) do
          x * Map.get(map, x)
        else
          0
        end
      end)
      |> Enum.sum()

    IO.inspect(result)
  end
end

AOC.D1.second()
