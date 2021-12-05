defmodule Mix.Tasks.D04.P2 do
  use Mix.Task

  import AdventOfCode.Day04

  @shortdoc "Day 04 Part 2"
  def run(args) do
    [draws | boards] =
      AdventOfCode.Input.get!(4, 2021)
      |> String.split("\n\n", trim: true)

    input = %{
      draws: String.split(draws, ",", trim: true),
      boards:
        Enum.map(boards, fn x ->
          x
          |> String.split("\n", trim: true)
          |> Enum.map(&String.split(&1, " ", trim: true))
        end)
    }

    if Enum.member?(args, "-b"),
      do: Benchee.run(%{part_2: fn -> input |> part2() end}),
      else:
        input
        |> part2()
        |> IO.inspect(label: "Part 2 Results")
  end
end
