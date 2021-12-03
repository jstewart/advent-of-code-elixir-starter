defmodule AdventOfCode.Day02 do
  # Assumes that args is [{"forward", 3}, {"depth", 5}...]
  def part1(args) do
    {depth, position} = Enum.reduce(args, {0, 0}, fn x, coords -> cmd(x, coords) end)
    depth * position
  end

  def part2(args) do
    {depth, position, _} = Enum.reduce(args, {0, 0, 0}, fn x, coords -> cmd(x, coords) end)
    depth * position
  end

  defp cmd({"forward", units}, {depth, position}), do: {depth, position + units}
  defp cmd({"down", units}, {depth, position}), do: {depth + units, position}
  defp cmd({"up", units}, {depth, position}), do: {depth - units, position}

  defp cmd({"forward", units}, {depth, position, aim}),
    do: {depth + aim * units, position + units, aim}

  defp cmd({"down", units}, {depth, position, aim}), do: {depth, position, aim + units}
  defp cmd({"up", units}, {depth, position, aim}), do: {depth, position, aim - units}
end
