defmodule AdventOfCode.Solution.Year2024.Day02 do
  def part1(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(fn line ->
      String.split(line)
      |> Enum.map(&String.to_integer/1)

      # |> IO.inspect(charlists: :as_list)
    end)
    |> Enum.count(fn line ->
      safe?(:start, 0, 0, line)
    end)
  end

  def ssafe(:start, _, _, list) do
    safe?(:start, 0, 0, list)
  end

  defp safe?(0, a, b, []) when abs(a - b) in 1..3 do
    a < b
  end

  defp safe?(1, a, b, []) when abs(a - b) in 1..3 do
    a > b
  end

  defp safe?(:start, _, _, list) do
    [a | t] = list
    [b | newt] = t
    [c | finalt] = newt

    cond do
      abs(a - b) not in 1..3 ->
        false

      a < b ->
        safe?(0, b, c, finalt)

      a > b ->
        safe?(1, b, c, finalt)
    end
  end

  defp safe?(0, a, b, list) when abs(a - b) in 1..3 do
    [c | t] = list
    if(a < b, do: safe?(0, b, c, t), else: false)
  end

  defp safe?(1, a, b, list) when abs(a - b) in 1..3 do
    [c | t] = list
    if(a > b, do: safe?(1, b, c, t), else: false)
  end

  defp safe?(_, _, _, _) do
    false
  end

  def part2(_input) do
  end
end
