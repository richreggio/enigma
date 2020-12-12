defmodule Enigma.State do
  @rotors %{
    # These rotors have 1 notch. String, Notch, Turnover
    I: ["EKMFLGDQVZNTOWYHXUSPAIBRCJ", "Y", "Q"],
    II: ["AJDKSIRUXBLHWTMCQGZNPYFVOE", "M", "E"],
    III: ["BDFHJLCPRTXVZNYEIWGAKMUSQO", "D", "V"],
    IV: ["ESOVPZJAYQUIRHXLNFTGKDCMWB", "R", "J"],
    V: ["VZBRGITYUPSDNHLXAWMJQOFECK", "H", "Z"],
    # These rotors have 2 notches
    VI: ["JPGVOUMFYQBENHZRDKASXLICTW", "HU", "ZM"],
    VII: ["NZJHGRCXMYSWBOUFAIVLPEKQDT", "HU", "ZM"],
    VIII: ["FKQHTLXOCBJSPDZRAMEWNIUYGV", "HU", "ZM"],
    # These rotors do not rotate and are 'optional' 4th rotors
    ß: "LEYJVCNIXWPBQMDRTAKZGFUHOS",
    γ: "FSOKANUERHMBTIYCWLQPZXVGJD"
  }
  @reflectors %{
    # These reflectors can only be used when the 'optional' rotors are not in use (3 rotor operation)
    A: "EJMZALYXVBWFCRQUONTSPIKHGD",
    B: "YRUHQSLDPXNGOKMIEBFZCWVJAT",
    C: "FVPJIAOYEDRZXWGCTKUQSBNMHL",
    # These are the thin reflectors that must be used when using ß and γ 'optional' rotors
    b: "ENKQAUYWJICOPBLMDXZVFTHRGS",
    c: "RDOBJNTKVEHMLFCWZAXGYIPSUQ"
  }

  # The reflector, left, middle, and right rotors are required.
  # optional_rotor and plugboard can be left as nil if not used.
  defstruct(
    optional_rotor: nil,
    left_rotor: [],
    middle_rotor: [],
    right_rotor: [],
    reflector: [],
    plugboard: nil
  )

  def setup_state([]) do
    create_default()
  end

  def setup_state(options) do
    %Enigma.State{
      left_rotor: options
    }
  end

  defp create_default() do
    %{I: left_rotor, II: middle_rotor, III: right_rotor, ß: optional_rotor} = @rotors
    %{b: reflector} = @reflectors

    # Each rotor is made up of a Tuple containing a list with a its encryption String, where the
    # notch is, what letter place causes it to turnover, then its ring setting(offset)
    %Enigma.State{
      left_rotor: {left_rotor, 0},
      middle_rotor: {middle_rotor, 0},
      right_rotor: {right_rotor, 0},
      optional_rotor: {optional_rotor, 0},
      reflector: reflector,
      plugboard: ["BV", "OW", "MP", "JL", "ZS", "HT", "RC", "YQ", "NX", "FI"]
    }
  end
end
