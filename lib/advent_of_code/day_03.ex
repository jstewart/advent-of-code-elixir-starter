defmodule AdventOfCode.Day03 do
  def part1(args) do
    gamma =
      Enum.map(args, &String.split(&1, "", trim: true))
      |> transpose()
      |> Enum.map(&most_common_bit/1)

    epsilon = Enum.map(gamma, &if(&1 == "1", do: "0", else: "1"))

    to_int(gamma) * to_int(epsilon)
  end

  def part2(args) do
    matrix = Enum.map(args, &String.split(&1, "", trim: true))

    {_, oxy_bits} =
      Enum.reduce_while(matrix, {0, matrix}, fn _, {pos, keep} ->
        t = transpose(keep)
        %{"0" => zeroes_count, "1" => ones_count} = Enum.at(t, pos) |> Enum.frequencies()

        filter = if ones_count > zeroes_count or ones_count == zeroes_count, do: "1", else: "0"
        filtered = Enum.filter(keep, fn y -> Enum.at(y, pos) == filter end)

        if length(filtered) == 1 do
          {:halt, {pos, filtered}}
        else
          {:cont, {pos + 1, filtered}}
        end
      end)

    {_, co2_bits} =
      Enum.reduce_while(matrix, {0, matrix}, fn _, {pos, keep} ->
        t = transpose(keep)
        %{"0" => zeroes_count, "1" => ones_count} = Enum.at(t, pos) |> Enum.frequencies()
        filter = if zeroes_count < ones_count or ones_count == zeroes_count, do: "0", else: "1"
        filtered = Enum.filter(keep, fn y -> Enum.at(y, pos) == filter end)

        if length(filtered) == 1 do
          {:halt, {pos, filtered}}
        else
          {:cont, {pos + 1, filtered}}
        end
      end)

    to_int(oxy_bits) * to_int(co2_bits)
  end

  defp transpose(x), do: Enum.zip(x) |> Enum.map(&Tuple.to_list/1)
  defp to_int(x), do: Enum.join(x) |> Integer.parse(2) |> elem(0)

  defp most_common_bit(x) do
    Enum.group_by(x, & &1)
    |> Enum.map(fn {k, v} -> {length(v), k} end)
    |> Enum.max()
    |> elem(1)
  end
end
