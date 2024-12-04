defmodule AdventOfCode.Solution.Year2024.Day03 do
  def part1(input) do
    Regex.scan(~r/mul\((\d+),(\d+)\)/, input, capture: :all_but_first)
    |> Enum.reduce(0, fn match, acc ->
      acc + String.to_integer(Enum.at(match, 0)) * String.to_integer(Enum.at(match, 1))
    end)
  end

  def part2(_input) do
  end
end
