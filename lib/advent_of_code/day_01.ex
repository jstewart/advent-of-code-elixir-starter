defmodule AdventOfCode.Day01 do
  def part1(args) do
    args
    |> Enum.chunk_every(2, 1, :discard)
    |> Enum.filter(fn [a, b] -> b > a end)
    |> Enum.count()
  end

  def part2(args) do
    args
    |> Enum.chunk_every(3, 1, :discard)
    |> Enum.map(&Enum.sum(&1))
    |> part1
  end
end
