defmodule AdventOfCode.Day07 do
  def part1(args) do
    target = cheesy_median(args)
    Enum.map(args, &abs(&1 - target)) |> Enum.sum()
  end

  defp cheesy_median(l), do: Enum.sort(l) |> Enum.at(floor(length(l) / 2))
  defp cheesy_mean(l), do: Enum.sum(l) / length(l)
  defp gauss(x), do: x * (x + 1) / 2

  def part2(args) do
    target = cheesy_mean(args)

    c = Enum.map(args, fn x -> gauss(abs(ceil(target) - x)) end) |> Enum.sum()
    f = Enum.map(args, fn x -> gauss(abs(floor(target) - x)) end) |> Enum.sum()
    min(c, f) |> trunc
  end
end
