defmodule AdventOfCode.Solution.Year2024.Day04 do
  def part1(input) do
    acc1 =
      input
      |> String.split("\n", trim: true)
      |> Enum.reduce(0, &countxmas/2)

    acc2 =
      input
      |> String.split("\n", trim: true)
      |> Enum.map(&String.split(&1, "", trim: true))
      |> Enum.zip()
      |> Enum.map(&Tuple.to_list/1)
      |> Enum.map(&Enum.join(&1, ""))
      |> Enum.reduce(0, &countxmas/2)

    acc3 =
      input
      |> String.split("\n", trim: true)
      |> takefour(0)

    # Take lines 4 at a time, shift them other way and check if they match xmas or samx

    acc1 + acc2 + acc3
  end

  defp countxmas(line, acc) do
    acc +
      (Regex.scan(~r/XMAS/, line)
       |> length()) +
      (Regex.scan(~r/SAMX/, line)
       |> length())
  end

  defp shiftleft(li, 0), do: li
  defp shiftleft([_ | t], n), do: shiftleft(t, n - 1)

  defp takefour([_, _, _], acc), do: acc

  defp takefour([a | rest], acc) do
    [b, c, d | _] = rest
    [x, y, z, t] = Enum.map([a, b, c, d], &String.split(&1, "", trim: true))
    [p, q, r, s] = Enum.map([x, y, z, t], &Enum.reverse/1)

    takefour(
      rest,
      acc +
        ([shiftleft(x, 3), shiftleft(y, 2), shiftleft(z, 1), t]
         |> Enum.zip()
         |> Enum.map(&Tuple.to_list/1)
         |> Enum.map(&Enum.join(&1, ""))
         |> Enum.reduce(0, &countxmas/2)) +
        ([shiftleft(p, 3), shiftleft(q, 2), shiftleft(r, 1), s]
         |> Enum.zip()
         |> Enum.map(&Tuple.to_list/1)
         |> Enum.map(&Enum.join(&1, ""))
         |> Enum.reduce(0, &countxmas/2))
    )
  end

  defp take3row([_, _], acc), do: acc

  defp take3row([a | rest], acc) do
    [b, c | _] = rest

    list =
      Enum.zip([a, b, c])
      |> Enum.map(&Tuple.to_list/1)

    x = take3col(list, 0)
    take3row(rest, acc + x)
  end

  defp take3col([_, _], acc), do: acc

  defp take3col([a | rest], acc) do
    [b, c | _] = rest

    if(
      Regex.match?(
        ~r/(m.s.a.m.s)|(m.m.a.s.s)|(s.s.a.m.m)|(s.m.a.s.m)/i,
        Enum.concat([a, b, c]) |> Enum.join("")
      ),
      do: take3col(rest, acc + 1),
      else: take3col(rest, acc)
    )
  end

  def part2(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(&String.split(&1, "", trim: true))
    |> take3row(0)
  end
end
