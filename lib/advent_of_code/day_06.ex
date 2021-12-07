defmodule AdventOfCode.Day06 do
  def part1(args) do
    cycle(init_data(args), 80) |> Enum.sum()
  end

  def part2(args) do
    cycle(init_data(args), 256) |> Enum.sum()
  end

  defp init_data(args) do
    counts = Enum.frequencies(args)
    Enum.map(0..8, &Map.get(counts, &1, 0))
  end

  def cycle(l, iteration) when iteration == 0, do: l

  def cycle([h | t], iteration) do
    cycle((t ++ [h]) |> List.update_at(6, &(&1 + h)), iteration - 1)
  end
end
