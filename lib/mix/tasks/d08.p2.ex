defmodule Mix.Tasks.D08.P2 do
  use Mix.Task

  import AdventOfCode.Day08

  @shortdoc "Day 08 Part 2"
  def run(args) do
    input =
      AdventOfCode.Input.get!(8, 2021)
      |> String.split(["\n", " | "], trim: true)
      |> Enum.chunk_every(2)
      |> Enum.map(fn [input, output] ->
        {String.split(input, " ", trim: true), String.split(output, " ", trim: true)}
      end)

    if Enum.member?(args, "-b"),
      do: Benchee.run(%{part_2: fn -> input |> part2() end}),
      else:
        input
        |> part2()
        |> IO.inspect(label: "Part 2 Results")
  end
end
