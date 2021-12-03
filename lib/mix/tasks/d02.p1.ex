defmodule Mix.Tasks.D02.P1 do
  use Mix.Task

  import AdventOfCode.Day02

  @shortdoc "Day 02 Part 1"
  def run(args) do
    input =
      AdventOfCode.Input.get!(2, 2021)
      |> String.split("\n")
      |> Enum.map(&String.split/1)
      |> Enum.filter(&Enum.any?/1)
      |> Enum.map(fn [cmd, unit] -> {cmd, String.to_integer(unit)} end)

    if Enum.member?(args, "-b"),
      do: Benchee.run(%{part_1: fn -> input |> part1() end}),
      else:
        input
        |> part1()
        |> IO.inspect(label: "Part 1 Results")
  end
end
