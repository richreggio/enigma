defmodule Enigma.Rotor do
  @alphabet ~w(A B C D E F G H I J K L M N O P Q R S T U V W X Y Z)

  @moduledoc """
    Each rotor transforms the given letter using a simple caesar cipher.

    The first complication is the ring setting, which rotates the cipher from it's initial position.
    It is best to understand this as an offset, at position 0 it does what it says on the tin.
    For values 1-25 it advances the letter in each position to 1 place further in the alphabet.

    ```
      "EKMF|LGDQ|VZNT|OWYH|XUSP|AIBR|CJ"
    ```

    Becomes:

    ```
      "FLNG|MHER|WAOU|PXZI|YVTQ|BJCS|DK
    ```

    The second complication is that rotors I-V only have 1 notch while rotors VI-VIII have 2 notches,
    this means that they have different behaviours that need to be implemented.
  """

  # Given a string containing all 26 letters of the alphabet (i.e. a valid rotor)
  # it will give you what values would be given when the signal passes through
  # the rotor on it's return trip (After hitting the reflector)
  def reverse_rotor(string) do
    # if valid_rotor?(string) do
    convert_to_index(String.codepoints(string), @alphabet, [])
    |> index_to_letter()
    |> List.to_string()

    # else
    #   "Not a valid rotor"
    # end
  end

  defp convert_to_index(stringList, [alphabetHead | []], indexList) do
    newIndexList =
      stringList
      |> Enum.find_index(&String.equivalent?(&1, alphabetHead))
      |> List.wrap()

    newIndexList ++ indexList
  end

  defp convert_to_index(stringList, [alphabetHead | alphabetTail], indexList) do
    newIndexList =
      stringList
      |> Enum.find_index(&String.equivalent?(&1, alphabetHead))
      |> List.wrap()

    convert_to_index(stringList, alphabetTail, newIndexList ++ indexList)
  end

  defp index_to_letter([index | indexTail]) do
    Enum.at(@alphabet, index)
    |> List.wrap()
    |> index_to_letter(indexTail)
  end

  defp index_to_letter(letterList, [index | []]) do
    nextLetter = Enum.at(@alphabet, index)

    List.wrap(nextLetter) ++ letterList
  end

  defp index_to_letter(letterList, [index | indexTail]) do
    nextLetter = Enum.at(@alphabet, index)

    (List.wrap(nextLetter) ++ letterList)
    |> index_to_letter(indexTail)
  end

  # defp valid_rotor?(string) do
  #   string_list =
  #     String.upcase(string)
  #     |> String.codepoints()
  #     |> Enum.sort()

  #   string_list == @alphabet
  # end
end
