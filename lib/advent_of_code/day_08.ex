defmodule AdventOfCode.Day08 do
  def part1(args) do
    Enum.flat_map(args, & &1)
    |> Enum.count(fn x -> Enum.member?([2, 3, 4, 7], String.length(x)) end)
  end

  def part2(args) do
  end
end
