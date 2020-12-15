defmodule Enigma do
  @moduledoc """
  Documentation for the `Enigma` API.
  """

  @doc """
  Creates an Enigma machine with the provided initial settings.

  If no settings are provided then it will create a machine with default settings.

  Settings should be in a map similar to the default settings:

  ```
    %{
      left_rotor: {["EKMFLGDQVZNTOWYHXUSPAIBRCJ", "Q"], 1},
      middle_rotor: {["AJDKSIRUXBLHWTMCQGZNPYFVOE", "E"], 1},
      right_rotor: {["BDFHJLCPRTXVZNYEIWGAKMUSQO", "V"], 1},
      optional_rotor: "LEYJVCNIXWPBQMDRTAKZGFUHOS",
      reflector: "ENKQAUYWJICOPBLMDXZVFTHRGS"
      plugboard: ["BV", "OW", "MP", "JL", "ZS", "HT", "RC", "YQ", "NX", "FI"]
    }
  ```

  Note that if optional_rotor and plugboard aren't being used their values should be replaced with ```nil```
  """
  def setup_machine(options \\ []) do
    Enigma.MachineSupervisor.start_child(options)
  end

  @doc """
  Takes a string and transcodes it.
  """
  def transcode(machine_pid, string) do
    GenServer.call(machine_pid, {:transcode, string})
  end

  @doc """
  Sends a message to an already running GenServer and resets it to its initial state.
  """
  def restart(machine_pid) do
    GenServer.call(machine_pid, {:restart})
  end
end
