defmodule EnigmaTest do
  use ExUnit.Case
  doctest Enigma

  test "encodes the first line of the Donitz message" do
    assert Enigma.transcode("FOLG ENDE SIST SOFO RTBE KANN TZUG EBEN") ==
             "RBBF PMHP HGCZ XTDY GAHG UFXG EWKB LKGJ"
  end
end
