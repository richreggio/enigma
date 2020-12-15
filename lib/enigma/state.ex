defmodule Enigma.State do
  @rotors %{
    # These rotors have 1 notch. String, Notch, Turnover
    I: ["EKMFLGDQVZNTOWYHXUSPAIBRCJ", "Q"],
    II: ["AJDKSIRUXBLHWTMCQGZNPYFVOE", "E"],
    III: ["BDFHJLCPRTXVZNYEIWGAKMUSQO", "V"],
    IV: ["ESOVPZJAYQUIRHXLNFTGKDCMWB", "J"],
    V: ["VZBRGITYUPSDNHLXAWMJQOFECK", "Z"],
    # These rotors have 2 notches
    VI: ["JPGVOUMFYQBENHZRDKASXLICTW", "ZM"],
    VII: ["NZJHGRCXMYSWBOUFAIVLPEKQDT", "ZM"],
    VIII: ["FKQHTLXOCBJSPDZRAMEWNIUYGV", "ZM"],
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
    original_state: %{
      optional_rotor: nil,
      left_rotor: [],
      middle_rotor: [],
      right_rotor: [],
      reflector: [],
      plugboard: nil
    },
    current_state: %{
      optional_rotor: nil,
      left_rotor: [],
      middle_rotor: [],
      right_rotor: [],
      reflector: [],
      plugboard: nil
    }
  )

  # Default setting
  def setup_state([]) do
    %{I: left, II: middle, III: right, ß: optional} = @rotors
    %{b: reflector} = @reflectors
    plugboard = ~w(BV OW MP JL ZS HT RC YQ NX FI)

    setup_state(%{
      left_rotor: {left, 1},
      middle_rotor: {middle, 1},
      right_rotor: {right, 1},
      optional_rotor: {optional},
      reflector: reflector,
      plugboard: plugboard
    })
  end

  def setup_state(:random) do
    setup_state(%{
      optional_rotor: random_optional_rotor(),
      left_rotor: random_rotor(),
      middle_rotor: random_rotor(),
      right_rotor: random_rotor(),
      reflector: random_reflector(),
      plugboard: random_plugboard()
    })
  end

  def setup_state(options) do
    %Enigma.State{
      original_state: %{
        optional_rotor: options.optional_rotor,
        left_rotor: options.left_rotor,
        middle_rotor: options.middle_rotor,
        right_rotor: options.right_rotor,
        reflector: options.reflector,
        plugboard: options.plugboard
      },
      current_state: %{
        optional_rotor: options.optional_rotor,
        left_rotor: options.left_rotor,
        middle_rotor: options.middle_rotor,
        right_rotor: options.right_rotor,
        reflector: options.reflector,
        plugboard: options.plugboard
      }
    }
  end

  defp random_rotor() do
    rotor_string =
      Enum.take_random(?A..?Z, 26)
      |> to_string()

    turnover =
      Enum.take_random(?A..?Z, 1)
      |> to_string()

    offset = Enum.take_random(1..26, 1)

    {[rotor_string, turnover], offset}
  end

  defp random_optional_rotor() do
    {[optional_string, _turnover], _offset} = random_rotor()
    optional_string
  end

  defp random_reflector() do
    Enum.take_random(?A..?Z, 26)
    |> Enum.chunk_every(2)
    |> Enum.map(&to_string(&1))
  end

  defp random_plugboard() do
    Enum.take_random(?A..?Z, 26)
    |> Enum.chunk_every(2)
    |> Enum.take(10)
    |> Enum.map(&to_string(&1))
  end
end
