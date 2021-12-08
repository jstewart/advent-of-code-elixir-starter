defmodule AdventOfCode.Day07 do
  def part1(args) do
    target = cheesy_median(args)
    Enum.map(args, &abs(&1 - target)) |> Enum.sum()
  end

  def cheesy_median(l), do: Enum.sort(l) |> Enum.at(floor(length(l) / 2))

  def part2(args) do
  end
end
