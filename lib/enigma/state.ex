defmodule Enigma.State do
  @rotors %{
    # These rotors have 1 notch
    I: "EKMFLGDQVZNTOWYHXUSPAIBRCJ",
    II: "AJDKSIRUXBLHWTMCQGZNPYFVOE",
    III: "BDFHJLCPRTXVZNYEIWGAKMUSQO",
    IV: "ESOVPZJAYQUIRHXLNFTGKDCMWB",
    V: "VZBRGITYUPSDNHLXAWMJQOFECK",
    # These rotors have 2 notches
    VI: "JPGVOUMFYQBENHZRDKASXLICTW",
    VII: "NZJHGRCXMYSWBOUFAIVLPEKQDT",
    VIII: "FKQHTLXOCBJSPDZRAMEWNIUYGV",
    # These rotors do not rotate and are 'optional' 4th rotors
    ß: "LEYJVCNIXWPBQMDRTAKZGFUHOS",
    γ: "FSOKANUERHMBTIYCWLQPZXVGJD"
  }
  @reflectors %{
    # These reflectors can only be used when the 'optional' rotors are not in use (3 rotoro operation)
    A: "EJMZALYXVBWFCRQUONTSPIKHGD",
    B: "YRUHQSLDPXNGOKMIEBFZCWVJAT",
    C: "FVPJIAOYEDRZXWGCTKUQSBNMHL",
    # These are the thin reflectors that must be used when using ß and γ 'optional' rotors
    b: "ENKQAUYWJICOPBLMDXZVFTHRGS",
    c: "RDOBJNTKVEHMLFCWZAXGYIPSUQ"
  }

  defstruct(
    optional_rotor: [],
    left_rotor: nil,
    middle_rotor: nil,
    right_rotor: nil,
    reflector: nil
  )

  def create_default() do
    %{I: left_rotor, II: middle_rotor, III: right_rotor, ß: optional_rotor} = @rotors
    %{b: reflector} = @reflectors

    %Enigma.State{
      left_rotor: [left_rotor, 0, "A"],
      middle_rotor: [middle_rotor, 0, "A"],
      right_rotor: [right_rotor, 0, "A"],
      optional_rotor: [optional_rotor, 0, "A"],
      reflector: reflector
    }
  end

  def setup_state(options) do
    %Enigma.State{
      left_rotor: options
    }
  end
end
