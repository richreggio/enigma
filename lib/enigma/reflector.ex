defmodule Enigma.Reflector do
  @alphabet ~w(A B C D E F G H I J K L M N O P Q R S T U V W X Y Z)

  def transform(single_character_input, %Enigma.State{current_state: %{reflector: reflector}}) do
    reflector_index =
      String.codepoints(reflector)
      |> Enum.find_index(&String.contains?(&1, single_character_input))

    Enum.fetch!(@alphabet, reflector_index)
  end
end
