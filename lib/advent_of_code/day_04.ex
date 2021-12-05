defmodule AdventOfCode.Day04 do
  def part1(args) do
    args
    |> winning_draw_and_board()
    |> then(fn {draw, board} -> sum_winner(hd(board)) * String.to_integer(draw) end)
  end

  def part2(args) do
    args
    |> winning_draw_and_board(:last)
    |> then(fn {draw, board} -> sum_winner(List.last(board)) * String.to_integer(draw) end)
  end

  defp winning_draw_and_board(%{draws: draws, boards: boards}, strategy \\ :first) do
    {winners, _} =
      Enum.reduce(draws, {[], boards}, fn d, {draw_winners, bds} ->
        Enum.map(bds, &mark_board(&1, d))
        |> Enum.group_by(&(winner(&1) != nil))
        |> then(fn x ->
          w = draw_winners ++ [{d, Map.get(x, true, [])}]
          {w, Map.get(x, false, [])}
        end)
      end)

    Enum.filter(winners, fn {_, w} -> w != [] end)
    |> then(fn x -> if strategy == :first, do: hd(x), else: List.last(x) end)
  end

  defp sum_winner(board) do
    List.flatten(board)
    |> Enum.filter(&(!is_nil(&1)))
    |> Enum.reduce(0, fn x, acc -> acc + String.to_integer(x) end)
  end

  defp mark_board(board, draw) do
    Enum.map(board, &Enum.map(&1, fn x -> if x == draw, do: nil, else: x end))
  end

  defp winner(board) do
    Enum.find(board, &row_wins?/1) || transpose(board) |> Enum.find(&row_wins?/1)
  end

  defp row_wins?(row), do: Enum.all?(row, &is_nil/1)
  defp transpose(x), do: Enum.zip(x) |> Enum.map(&Tuple.to_list/1)
end
