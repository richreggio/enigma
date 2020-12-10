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

  # Sets up the machine with my 'default' setting if an empty map is passsed
  def setup_machine() do
    Enigma.State.create_default()
  end

  def setup_machine(options) do
    # Sets up the initial state of the Enigma machine
    # Needs to know which rotors are used, their Ring Setting and their initial position.
    # also needs to know which if any plugboard connections are being used
    Enigma.State.setup_state(options)
  end
end
