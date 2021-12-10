defmodule Mix.Tasks.D09.P1 do
  use Mix.Task

  import AdventOfCode.Day09

  @shortdoc "Day 09 Part 1"
  def run(args) do
    input =
      AdventOfCode.Input.get!(9, 2021)
      |> String.split("\n", trim: true)
      |> Enum.map(fn x ->
        String.split(x, "", trim: true)
        |> Enum.map(&String.to_integer/1)
      end)

    if Enum.member?(args, "-b"),
      do: Benchee.run(%{part_1: fn -> input |> part1() end}),
      else:
        input
        |> part1()
        |> IO.inspect(label: "Part 1 Results")
  end
end
