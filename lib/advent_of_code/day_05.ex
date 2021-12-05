defmodule AdventOfCode.Day05 do
  def part1(args) do
    Enum.reduce(args, %{}, fn [[x1, y1], [x2, y2]], acc ->
      if x1 != x2 && y1 != y2, do: acc, else: traverse(acc, x1, x2, y1, y2)
    end)
    |> Enum.count(fn {_, v} -> v >= 2 end)
  end

  def part2(args) do
    Enum.reduce(args, %{}, fn [[x1, y1], [x2, y2]], acc ->
      traverse(acc, x1, x2, y1, y2)
    end)
    |> Enum.count(fn {_, v} -> v >= 2 end)
  end

  defp traverse(coords, x1, x2, y1, y2) do
    end_line = max(abs(x1 - x2), abs(y1 - y2))
    slope_x = signum(x2 - x1)
    slope_y = signum(y2 - y1)

    Enum.reduce(0..end_line, coords, fn i, acc ->
      x = x1 + i * slope_x
      y = y1 + i * slope_y
      {_, m} = Map.get_and_update(acc, [x, y], fn curr -> {curr, (curr || 0) + 1} end)
      m
    end)
  end

  defp signum(x) do
    cond do
      x > 0 ->
        1

      x == 0 ->
        0

      x < 0 ->
        -1
    end
  end
end
