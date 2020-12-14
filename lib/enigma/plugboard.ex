defmodule Enigma.Plugboard do
  # If the plugboard is not configured it should just be a passthrough
  def transform(single_character_input, %Enigma.State{plugboard: nil}) do
    single_character_input
  end

  def transform(single_character_input, %Enigma.State{plugboard: plugboard_config}) do
    # Check each configured plugboard swap to see if it contains the input character
    Enum.find(plugboard_config, &String.contains?(&1, single_character_input))
    |> process_result(single_character_input)
  end

  # If there is no match with the current plugboard config, return the given letter
  defp process_result(nil, single_character_input) do
    single_character_input
  end

  # If there is a match, give the other letter in the given plugboard swap
  defp process_result(plugboard_string, single_character_input) do
    String.trim(plugboard_string, single_character_input)
  end
end
