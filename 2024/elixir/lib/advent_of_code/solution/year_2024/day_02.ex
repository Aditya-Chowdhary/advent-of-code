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
      safe?(:start, line)
    end)
  end

  def part2(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(fn line ->
      String.split(line)
      |> Enum.map(&String.to_integer/1)
    end)
    |> Enum.count(fn line ->
      damp =
        0..length(line)
        |> Enum.map(&List.delete_at(line, &1))

      safe?(:start, line) || Enum.any?(damp, &safe?(:start, &1))
    end)
  end

  def ssafe(:start, list), do: safe?(:start, list)

  defp safe?(:start, [a, b | tail]) when (b - a) in 1..3, do: safe?(:inc, [b | tail])
  defp safe?(:start, [a, b | tail]) when (a - b) in 1..3, do: safe?(:dec, [b | tail])
  defp safe?(:inc, [a, b | tail]) when (b - a) in 1..3, do: safe?(:inc, [b | tail])
  defp safe?(:dec, [a, b | tail]) when (a - b) in 1..3, do: safe?(:dec, [b | tail])
  defp safe?(_, [_]), do: true
  defp safe?(_, _), do: false

  # ! Part 2 Functions

  # defp safe?(_incdec, _, n) when n > 1, do: false
  # Start setting flag
  # 5 7 3 1
  # 5 7 6 7
  # 5 3 8 10
  # 5 3 4 3
  # defp safe?(:start, [a, b, c | tail]) when abs(b-a) in 1..3 and abs(c-b) in 1..3 do
  #   x = b-a
  #   y = c-b
  # end

  # 5 7 2 8
  # 5 3 8 1
  # defp safe?(:start, [a, b | tail], n) when (b - a) in 1..3, do: safe?(:inc, [b | tail], n)
  # defp safe?(:start, [a, b | tail], n) when (a - b) in 1..3, do: safe?(:dec, [b | tail], n)
  # # Cases where immediate next succeeds.
  # defp safe?(:inc, [a, b | tail], n) when (b - a) in 1..3, do: safe?(:inc, [b | tail], n)
  # defp safe?(:dec, [a, b | tail], n) when (a - b) in 1..3, do: safe?(:dec, [b | tail], n)
  # # Cases where we ignore b
  # defp safe?(:inc, [a, _b, c | tail], n) when (c - a) in 1..3, do: safe?(:inc, [c | tail], n + 1)
  # defp safe?(:dec, [a, _b, c | tail], n) when (a - c) in 1..3, do: safe?(:dec, [c | tail], n + 1)
end
