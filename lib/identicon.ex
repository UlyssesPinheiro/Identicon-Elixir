defmodule Identicon do
  @moduledoc """
  Documentation for `Identicon`.
  """

  @doc """

  """
  def main(input) do
    hash_input(input)
  end

  def hash_input(input) do
    hex = :crypto.hash(:md5, input)
    |> :binary.bin_to_list

    %Identicon.Image{hex: hex}
  end
end
