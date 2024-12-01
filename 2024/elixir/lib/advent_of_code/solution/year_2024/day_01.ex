defmodule AdventOfCode.Solution.Year2024.Day01 do
  def part1(input) do
    test =
      input
      |> String.split("\n", trim: true)
      |> Enum.map(&String.split/1)
      |> Enum.zip()
      |> Enum.map(&Tuple.to_list/1)
      |> Enum.map(&Enum.sort/1)
      |> Enum.zip()
      |> Enum.reduce(0, fn item, accumulator ->
        accumulator + abs(String.to_integer(elem(item, 0)) - String.to_integer(elem(item, 1)))
      end)

    IO.inspect(test, limit: :infinity)
    test
  end

  def part2(_input) do
  end
end
