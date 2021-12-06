defmodule AdventOfCode.Day06 do
  def part1(args) do
    process_lanternfish(args, 80)
  end

  def part2(args) do
    process_lanternfish(args, 256)
  end

  defp process_lanternfish(fish, iterations) do
    state =
      Enum.reduce(0..iterations, %{}, fn x, acc ->
        Map.put(acc, x, Enum.count(fish, &(&1 == x)))
      end)

    Enum.reduce(1..iterations, state, fn _, acc ->
      newbs = Map.get(acc, 0)

      %{
        8 => newbs,
        7 => Map.get(acc, 8),
        6 => Map.get(acc, 7) + newbs,
        5 => Map.get(acc, 6),
        4 => Map.get(acc, 5),
        3 => Map.get(acc, 4),
        2 => Map.get(acc, 3),
        1 => Map.get(acc, 2),
        0 => Map.get(acc, 1)
      }
    end)
    |> Map.values()
    |> Enum.sum()
  end
end
