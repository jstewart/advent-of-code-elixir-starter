defmodule Mix.Tasks.D08.P1 do
  use Mix.Task

  import AdventOfCode.Day08

  @shortdoc "Day 08 Part 1"
  def run(args) do
    input =
      AdventOfCode.Input.get!(8, 2021)
      |> String.split(["\n", " | "], trim: true)
      |> Enum.chunk_every(2)
      |> Enum.map(fn [_, output] -> String.split(output, " ", trim: true) end)

    if Enum.member?(args, "-b"),
      do: Benchee.run(%{part_1: fn -> input |> part1() end}),
      else:
        input
        |> part1()
        |> IO.inspect(label: "Part 1 Results")
  end
end
