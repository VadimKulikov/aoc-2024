list =
  File.stream!("input.txt")
  |> Stream.map(&String.trim/1)
  |> Enum.to_list()
  |> Enum.map(fn str ->
    String.split(str)
    |> Enum.map(&String.to_integer/1)
  end)

first = Enum.map(list, fn [x, _] -> x end) |> Enum.sort()
second = Enum.map(list, fn [_, y] -> y end) |> Enum.sort()
res = Enum.zip(first, second) |> Enum.map(fn {a, b} -> abs(a - b) end) |> Enum.sum()

IO.inspect(res)
