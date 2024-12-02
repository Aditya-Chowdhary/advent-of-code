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

  def part2(_input) do
  end
end
