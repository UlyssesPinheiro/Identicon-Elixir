defmodule Identicon do
  @moduledoc """
  Documentation for `Identicon`.
  """

  @doc """

  """
  def main(input) do
    hash_input(input)
    |> pick_color()
    |> build_grid()
    |> filter_odd_squares()
  end

  def hash_input(input) do
    hex = :crypto.hash(:md5, input)
    |> :binary.bin_to_list

    %Identicon.Image{hex: hex}
  end

  def pick_color(image) do
    %Identicon.Image{hex: [r, g, b | _tail]} = image

    %Identicon.Image{image | color: {r, g, b}}
  end

  def build_grid(image) do
    %Identicon.Image{hex: hex} = image

    grid =
      Enum.chunk(hex, 3)
      |> Enum.map(&mirror_row/1)
      |> List.flatten
      |> Enum.with_index

    %Identicon.Image{image | grid: grid}
  end

  def mirror_row(row) do
  # [145, 46, 200]
  [first, second | _tail] = row

  # [145, 46, 200, 46, 145]
  row ++ [second, first ]
  end

  def filter_odd_squares(image) do
    %Identicon.Image{grid: grid} = image
  end

end
