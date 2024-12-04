defmodule AdventOfCode.Solution.Year2024.Day03 do
  def part1(input) do
    Regex.scan(~r/mul\((\d+),(\d+)\)/, input, capture: :all_but_first)
    |> Enum.reduce(0, fn match, acc ->
      acc + String.to_integer(Enum.at(match, 0)) * String.to_integer(Enum.at(match, 1))
    end)
  end

  def part2(input) do
    Regex.scan(~r/do\(\)|don\'t\(\)|mul\((\d+),(\d+)\)/, input)
    |> mul(0, :do)
  end

  defp mul([], acc, _state), do: acc

  defp mul([h | t], acc, state) do
    cond do
      hd(h) == "do()" ->
        mul(t, acc, :do)

      hd(h) == "don't()" ->
        mul(t, acc, :dont)

      state == :dont ->
        mul(t, acc, state)

      hd(h) =~ "mul" ->
        prod = String.to_integer(Enum.at(h, 1)) * String.to_integer(Enum.at(h, 2))
        mul(t, acc + prod, state)
    end
  end
end
