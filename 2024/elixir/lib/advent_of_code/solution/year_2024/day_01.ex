defmodule AdventOfCode.Solution.Year2024.Day01 do
  def part1(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(fn line ->
      String.split(line)
      |> Enum.map(&String.to_integer/1)
    end)
    |> Enum.zip()
    |> Enum.map(&Tuple.to_list/1)
    |> Enum.map(&Enum.sort/1)
    |> Enum.zip()
    |> Enum.reduce(0, fn {a, b}, acc ->
      acc + abs(a - b)
    end)

    # IO.inspect(test, limit: :infinity)
    # test
  end

  def part2(input) do
    {list1, list2} =
      input
      |> String.split("\n", trim: true)
      |> Enum.map(fn line ->
        String.split(line)
        |> Enum.map(&String.to_integer/1)
        |> List.to_tuple()
      end)
      |> Enum.unzip()

    freq = Enum.frequencies(list2)
    # IO.inspect(freq)

    list1
    |> Enum.reduce(0, fn item, acc -> acc + (item * Map.get(freq, item, 0)) end)
  end
end
