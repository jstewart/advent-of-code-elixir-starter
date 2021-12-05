defmodule Mix.Tasks.D05.P1 do
  use Mix.Task

  import AdventOfCode.Day05

  @shortdoc "Day 05 Part 1"
  def run(args) do
    input =
      AdventOfCode.Input.get!(5, 2021)
      |> String.split("\n", trim: true)
      |> Enum.map(fn row ->
        String.split(row, " -> ", trim: true)
        |> Enum.map(fn coord ->
          String.split(coord, ",", trim: true)
          |> Enum.map(&String.to_integer/1)
        end)
      end)

    if Enum.member?(args, "-b"),
      do: Benchee.run(%{part_1: fn -> input |> part1() end}),
      else:
        input
        |> part1()
        |> IO.inspect(label: "Part 1 Results")
  end
end
