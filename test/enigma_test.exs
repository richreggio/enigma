defmodule EnigmaTest do
  use ExUnit.Case, async: false
  doctest Enigma

  # @default_rotors %{
  #   I: "EKMFLGDQVZNTOWYHXUSPAIBRCJ",
  #   II: "AJDKSIRUXBLHWTMCQGZNPYFVOE",
  #   III: "BDFHJLCPRTXVZNYEIWGAKMUSQO",
  #   IV: "ESOVPZJAYQUIRHXLNFTGKDCMWB",
  #   V: "VZBRGITYUPSDNHLXAWMJQOFECK",
  #   # These rotors have 2 notches
  #   VI: "JPGVOUMFYQBENHZRDKASXLICTW",
  #   VII: "NZJHGRCXMYSWBOUFAIVLPEKQDT",
  #   VIII: "FKQHTLXOCBJSPDZRAMEWNIUYGV"
  # }

  # test "encodes the first line of the Donitz message" do
  #   assert Enigma.transcode("FOLG ENDE SIST SOFO RTBE KANN TZUG EBEN") ==
  #            "RBBF PMHP HGCZ XTDY GAHG UFXG EWKB LKGJ"
  # end

  # test "can show the reverse path on a rotor I" do
  #   %{I: string} = @default_rotors

  #   assert Enigma.Rotor.reverse_rotor(string) == "UWYGADFPVZBECKMTHXSLRINQOJ"
  # end

  # test "can show the reverse path on a rotor V" do
  #   %{V: string} = @default_rotors

  #   assert Enigma.Rotor.reverse_rotor(string) == "QCYLXWENFTZOSMVJUDKGIARPHB"
  # end

  # test "can show the reverse path on a rotor VI" do
  #   %{VI: string} = @default_rotors

  #   assert Enigma.Rotor.reverse_rotor(string) == "SKXQLHCNWARVGMEBJPTYFDZUIO"
  # end
end
