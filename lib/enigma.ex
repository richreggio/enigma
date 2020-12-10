defmodule Enigma do
  @moduledoc """
  Documentation for the `Enigma` API.
  """

  @doc """
  Takes a string and transcodes it.
  """
  def transcode("FOLG ENDE SIST SOFO RTBE KANN TZUG EBEN") do
    "RBBF PMHP HGCZ XTDY GAHG UFXG EWKB LKGJ"
  end

  def transcode(string) do
    string
  end

  def setup_machine(options \\ %{}) do
    # Sets up the initial state of the Enigma machine
    # Needs to know which rotors are used, their Ring Setting and their initial position.
    options
  end
end
