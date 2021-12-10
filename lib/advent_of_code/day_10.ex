defmodule AdventOfCode.Day10 do
  def part1(args) do
    args
    |> Enum.map(&process_line(&1))
    |> Enum.filter(&(length(&1) == 1))
    |> Enum.map(&score(&1))
    |> Enum.sum()
  end

  defp process_line(line) do
    Enum.reduce_while(line, [], fn char, stack ->
      if Regex.match?(~r/[\(\[\{\<]/, char) do
        {:cont, [expected(char)] ++ stack}
      else
        if char == hd(stack) do
          {:cont, tl(stack)}
        else
          {:halt, [char]}
        end
      end
    end)
  end

  defp expected(char) do
    case char do
      "(" -> ")"
      "[" -> "]"
      "{" -> "}"
      "<" -> ">"
    end
  end

  defp score([char | _]) do
    case char do
      ")" -> 3
      "]" -> 57
      "}" -> 1197
      ">" -> 25137
    end
  end

  def part2(args) do
  end
end
