defmodule Mix.Tasks.D05.P2 do
  use Mix.Task

  import AdventOfCode.Day05

  @shortdoc "Day 05 Part 2"
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
      do: Benchee.run(%{part_2: fn -> input |> part2() end}),
      else:
        input
        |> part2()
        |> IO.inspect(label: "Part 2 Results")
  end
end
