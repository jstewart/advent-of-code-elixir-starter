defmodule AdventOfCode.Day09 do
  def part1(args) do
    Enum.reduce(0..(length(args) - 1), [], fn y, acc ->
      l = length(hd(args)) - 1

      Enum.reduce(0..l, acc, fn x, xacc ->
        the_element = Enum.at(Enum.at(args, y), x)
        xacc ++ [{the_element, find_adjacents(args, {y, x})}]
      end)
    end)
    |> Enum.reduce([], fn {elem, adj}, acc ->
      if Enum.all?(adj, &(&1 > elem)), do: acc ++ [elem + 1], else: acc
    end)
    |> Enum.sum()
  end

  def part2(args) do
  end

  defp find_adjacents(matrix, {row, col}) do
    u = if row == 0, do: nil, else: Enum.at(Enum.at(matrix, row - 1), col)
    d = if row == length(matrix) - 1, do: nil, else: Enum.at(Enum.at(matrix, row + 1), col)
    l = if col == 0, do: nil, else: Enum.at(Enum.at(matrix, row), col - 1)
    r = if col == length(hd(matrix)) - 1, do: nil, else: Eum.at(Enum.at(matrix, row), col + 1)

    [u, d, l, r]
  end
end
