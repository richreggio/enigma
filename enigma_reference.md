# Enigma Model

The reference model of Enigma machine I am attempting to use is the **Enigma M4**

I am not sure if I have this figured out correctly, if you feel that I made a mistake, please let me know!

Please see [Crypto Museum](https://www.cryptomuseum.com/crypto/enigma/m4/index.htm) for reference material.

It used:

- 8 different normal Rotors (Only 3 used at a time)
- 2 different non-rotating Rotors (Only 1 used at a time)
- 10 Plugs (Setting 10 swapped letter pairs)
- 2 Reflectors (Only 1 used at a time)

# Rotors

Rotors I-VII (1-8), ß (Beta), and γ (Gamma) will be programmed for this exercise:

Transforms [ABCDEFGHIJKLMNOPQRSTUVWXYZ] into the corresponding arrays

I [EKMFLGDQVZNTOWYHXUSPAIBRCJ]

II [AJDKSIRUXBLHWTMCQGZNPYFVOE]

III [BDFHJLCPRTXVZNYEIWGAKMUSQO]

IV [ESOVPZJAYQUIRHXLNFTGKDCMWB]

V [VZBRGITYUPSDNHLXAWMJQOFECK]

---

VI [JPGVOUMFYQBENHZRDKASXLICTW]

VII [NZJHGRCXMYSWBOUFAIVLPEKQDT]

VIII [FKQHTLXOCBJSPDZRAMEWNIUYGV]

---

ß [LEYJVCNIXWPBQMDRTAKZGFUHOS]

γ [FSOKANUERHMBTIYCWLQPZXVGJD]

Note: Rotors I-V only have 1 notch, Rotors VI-VIII have 2 notches, Rotors ß and γ do not rotate during use or have notches and can only be used with the thin reflectors.

# Reflectors

The following Reflectors will be programmed for this exercise:

Transforms [ABCDEFGHIJKLMNOPQRSTUVWXYZ] into the corresponding arrays

Reflector B Thin [ENKQAUYWJICOPBLMDXZVFTHRGS]

Reflector C Thin [RDOBJNTKVEHMLFCWZAXGYIPSUQ]

# Plugboard

There are a total of 10 plugs.

They are each capable of swapping

The process for transcoding a character in a 4 rotor Enigma machine is as follows:

1. A character is pressed on the keyboard
2. The plugboard transforms the character
3. The first Rotor transforms the character
4. The second Rotor transforms the character
5. The third Rotor transforms the character
6. The fourth Rotor transforms the character
7. The Reflector transforms the chracter
8. The fourth Rotor transforms the character again
9. The third Rotor transforms the character again
10. The second Rotor transforms the character again
11. The first Rotor transforms the character again
12. The plugboard transforms the character again
13. The keyboard displays the final transformed character

# Transcoding Test Example

```elixir
test "encodes the first line of the Donitz message" do
  assert Enigma.transcode("FOLG ENDE SIST SOFO RTBE KANN TZUG EBEN") = "RBBF PMHP HGCZ XTDY GAHG UFXG EWKB LKGJ"
end
```

Shows the entire message transcoding process for the above message
This is a 4 rotor Enigma machine, the 4 numbers represent the current positions of the 4 rotors
The example used Rotors VII, VI, V, and Beta with thin Reflector C (order of Rotors/Reflector is Right to Left)

0001 F > KGWNT(R)BLQPAHYDVJIFXEZOCSMU CDTK 25 15 16 26

0002 O > UORYTQSLWXZHNM(B)VFCGEAPIJDK CDTL 25 15 16 01

0003 L > HLNRSKJAMGF(B)ICUQPDEYOZXWTV CDTM 25 15 16 02

0004 G > KPTXIG(F)MESAUHYQBOVJCLRZDNW CDUN 25 15 17 03

0005 E > XDYB(P)WOSMUZRIQGENLHVJTFACK CDUO 25 15 17 04

0006 N > DLIAJUOVCEXBN(M)GQPWZYFHRKTS CDUP 25 15 17 05

0007 D > LUS(H)QOXDMZNAIKFREPCYBWVGTJ CDUQ 25 15 17 06

0008 E > JKGO(P)TCIHABRNMDEYLZFXWVUQS CDUR 25 15 17 07

0009 S > GCBUZRASYXVMLPQNOF(H)WDKTJIE CDUS 25 15 17 08

0010 I > XPJUOWIY(G)CVRTQEBNLZMDKFAHS CDUT 25 15 17 09

0011 S > DISAUYOMBPNTHKGJRQ(C)LEZXWFV CDUU 25 15 17 10

0012 T > FJLVQAKXNBGCPIRMEOY(Z)WDUHST CDUV 25 15 17 11

0013 S > KTJUQONPZCAMLGFHEW(X)BDYRSVI CDUW 25 15 17 12

0014 O > ZQXUVGFNWRLKPH(T)MBJYODEICSA CDUX 25 15 17 13

0015 F > XJWFR(D)ZSQBLKTVPOIEHMYNCAUG CDUY 25 15 17 14

0016 O > FSKTJARXPECNUL(Y)IZGBDMWVHOQ CDUZ 25 15 17 15

0017 R > CEAKBMRYUVDNFLTXW(G)ZOIJQPHS CDVA 25 15 18 16

0018 T > TLJRVQHGUCXBZYSWFDO(A)IEPKNM CDVB 25 15 18 17

0019 B > Y(H)LPGTEBKWICSVUDRQMFONJZAX CDVC 25 15 18 18

0020 E > KRUL(G)JEWNFADVIPOYBXZCMHSQT CDVD 25 15 18 19

0021 K > RCBPQMVZXY(U)OFSLDEANWKGTIJH CDVE 25 15 18 20

0022 A > (F)CBJQAWTVDYNXLUSEZPHOIGMKR CDVF 25 15 18 21

0023 N > VFTQSBPORUZWY(X)HGDIECJALNMK CDVG 25 15 18 22

0024 N > JSRHFENDUAZYQ(G)XTMCBPIWVOLK CDVH 25 15 18 23

0025 T > RCBUTXVZJINQPKWMLAY(E)DGOFSH CDVI 25 15 18 24

0026 Z > URFXNCMYLVPIGESKTBOQAJZDH(W) CDVJ 25 15 18 25

0027 U > JIOZFEWMBAUSHPCNRQLV(K)TGYXD CDVK 25 15 18 26

0028 G > ZGVRKO(B)XLNEIWJFUSDQYPCMHTA CDVL 25 15 18 01

0029 E > RMJV(L)YQZKCIEBONUGAWXPDSTFH CDVM 25 15 18 02

0030 B > G(K)QRFEANZPBMLHVJCDUXSOYTWI CDWN 25 15 19 03

0031 E > YMZT(G)VEKQOHPBSJLIUNDRFXWAC CDWO 25 15 19 04

0032 N > PDSBTIUQFNOVW(J)KAHZCEGLMYXR CDWP 25 15 19 05

# Single Character Transcoding Process

Enigma machine settings:
Rotors:

The first character goes through the transcoding process as follows:

G > ABCDEF(G)HIJKLMNOPQRSTUVWXYZ
P EFMQAB(G)UINKXCJORDPZTHWVLYS AE.BF.CM.DQ.HU.JN.LX.PR.SZ.VW
1 OFRJVM(A)ZHQNBXPYKCULGSWETDI N 03 VIII
2 (N)UKCHVSMDGTZQFYEWPIALOXRJB U 17 VI
3 XJMIYVCARQOWH(L)NDSUFKGBEPZT D 15 V
4 QUNGALXEPKZ(Y)RDSOFTVCMBIHWJ C 25 β
R RDOBJNTKVEHMLFCWZAXGYIPS(U)Q c
4 EVTNHQDXWZJFUCPIAMOR(B)SYGLK β
3 H(V)GPWSUMDBTNCOKXJIQZRFLAEY V
2 TZDIPNJESYCUHAVRMXGKB(F)QWOL VI
1 GLQYW(B)TIZDPSFKANJCUXREVMOH VIII
P E(F)MQABGUINKXCJORDPZTHWVLYS AE.BF.CM.DQ.HU.JN.LX.PR.SZ.VW
F < KPTXIG(F)MESAUHYQBOVJCLRZDNW
