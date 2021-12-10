defmodule AdventOfCode.Day10 do
  def part1(args) do
    args
    |> Enum.map(&process_line(&1))
    |> Enum.filter(&(length(&1) == 1))
    |> Enum.map(&score(&1))
    |> Enum.sum()
  end

  def part2(args) do
    args
    |> Enum.map(&process_line(&1))
    |> Enum.filter(&(length(&1) > 1))
    |> Enum.map(&score(&1, :good))
    |> Enum.sort()
    |> then(fn scores ->
      # Same as calculating `mid` in binary search
      Enum.at(scores, Bitwise.bsr(length(scores), 1))
    end)
  end

  defp process_line(line, stack \\ [])
  defp process_line(line, stack) when line == [], do: stack

  defp process_line([char | rest], stack) do
    if Regex.match?(~r/[\(\[\{\<]/, char) do
      process_line(rest, [expected(char)] ++ stack)
    else
      if char == hd(stack), do: process_line(rest, tl(stack)), else: [char]
    end
  end

  defp expected(char) do
    case char do
      "(" -> ")"
      "[" -> "]"
      "{" -> "}"
      "<" -> ">"
    end
  end

  defp score(brackets, scheme \\ :evil)

  defp score([bracket], scheme) when scheme == :evil do
    case bracket do
      ")" -> 3
      "]" -> 57
      "}" -> 1197
      ">" -> 25137
    end
  end

  defp score(brackets, scheme) when scheme == :good do
    Enum.reduce(brackets, 0, fn bracket, total ->
      individual =
        case bracket do
          ")" -> 1
          "]" -> 2
          "}" -> 3
          ">" -> 4
        end

      total * 5 + individual
    end)
  end
end
