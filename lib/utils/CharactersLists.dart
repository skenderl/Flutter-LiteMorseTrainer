// true == "dot"
// false == "dash"
const Map<String, List<bool>> characters = {
  'A': characterA,
  'B': characterB,
  'C': characterC,
  'D': characterD,
  'E': characterE,
  'F': characterF,
  'G': characterG,
  'H': characterH,
  'I': characterI,
  'J': characterJ,
  'K': characterK,
  'L': characterL,
  'M': characterM,
  'N': characterN,
  'O': characterO,
  'P': characterP,
  'Q': characterQ,
  'R': characterR,
  'S': characterS,
  'T': characterT,
  'U': characterU,
  'V': characterV,
  'W': characterW,
  'X': characterX,
  'Y': characterY,
  'Z': characterZ,
  '0': character0,
  '1': character1,
  '2': character2,
  '3': character3,
  '4': character4,
  '5': character5,
  '6': character6,
  '7': character7,
  '8': character8,
  '9': character9,
  'Å': specialCharacter1,
  'Ä': specialCharacter2,
  'À': specialCharacter3,
  'É': specialCharacter4,
  'È': specialCharacter5,
  'Ö': specialCharacter6,
  'Ü': specialCharacter7,
  'ß': specialCharacter8,
  'Ñ': specialCharacter9,
  'Ą': specialCharacter10,
  'Æ': specialCharacter11,
  'Ć': specialCharacter12,
  'Ĉ': specialCharacter13,
  'Ç': specialCharacter14,
  'Đ': specialCharacter15,
  'Ð': specialCharacter16,
  'Ę': specialCharacter17,
  'Ĝ': specialCharacter18,
  'Ĥ': specialCharacter19,
  'Ĵ': specialCharacter20,
  'Ł': specialCharacter21,
  'Ń': specialCharacter22,
  'Ó': specialCharacter23,
  'Ø': specialCharacter24,
  'Ś': specialCharacter25,
  'Ŝ': specialCharacter26,
  'Š': specialCharacter27,
  'Þ': specialCharacter28,
  'Ŭ': specialCharacter29,
  'Ź': specialCharacter30,
  'Ż': specialCharacter31,
  //these might be wrong
  'Á': characterA,
  'Í': characterI,
  'Ú': characterU,
  'Â': characterA,
  'Ê': characterE,
  'Ë': characterE,
  'Î': characterI,
  'Ô': characterO,
  'Û': characterU,
  'Ù': characterU,
  'Ÿ': characterY,
  'Ï': characterI,
  'Œ': characterE
  //these might be wrong
};

const characterA = [true, false];
const characterB = [false, true, true, true];
const characterC = [false, true, false, true];
const characterD = [false, true, true];
const characterE = [true];
const characterF = [true, true, false, true];
const characterG = [false, false, true];
const characterH = [true, true, true, true];
const characterI = [true, true];
const characterJ = [true, false, false, false];
const characterK = [false, true, false];
const characterL = [true, false, true, true];
const characterM = [false, false];
const characterN = [false, true];
const characterO = [false, false, false];
const characterP = [true, false, false, true];
const characterQ = [false, false, true, false];
const characterR = [true, false, true];
const characterS = [true, true, true];
const characterT = [false];
const characterU = [true, true, false];
const characterV = [true, true, true, false];
const characterW = [true, false, false];
const characterX = [false, true, true, false];
const characterY = [false, true, false, false];
const characterZ = [false, false, true, true];

const character0 = [false, false, false, false, false];
const character1 = [true, false, false, false, false];
const character2 = [true, true, false, false, false];
const character3 = [true, true, true, false, false];
const character4 = [true, true, true, true, false];
const character5 = [true, true, true, true, true];
const character6 = [false, true, true, true, true];
const character7 = [false, false, true, true, true];
const character8 = [false, false, false, true, true];
const character9 = [false, false, false, false, true];

const specialCharacter1 = [true, false, false, true, false];
const specialCharacter2 = [true, false, true, false];
const specialCharacter3 = [true, false, false, true, false];
const specialCharacter4 = [true, true, false, true, true];
const specialCharacter5 = [true, false, true, true, false];
const specialCharacter6 = [false, false, false, true];
const specialCharacter7 = [true, true, false, false];
const specialCharacter8 = [true, true, true, false, false, true, true];
const specialCharacter9 = [false, false, true, false, false];
const specialCharacter10 = [true, false, true, false];
const specialCharacter11 = [true, false, true, false];
const specialCharacter12 = [false, true, false, true, true];
const specialCharacter13 = [false, true, false, true, true];
const specialCharacter14 = [false, true, false, true, true];
const specialCharacter15 = [true, true, false, true, true];
const specialCharacter16 = [true, true, false, false, true];
const specialCharacter17 = [true, true, false, true, true];
const specialCharacter18 = [false, false, true, false, true];
const specialCharacter19 = [false, false, false, false];
const specialCharacter20 = [true, false, false, false, true];
const specialCharacter21 = [true, false, true, true, false];
const specialCharacter22 = [false, false, true, false, false];
const specialCharacter23 = [false, false, false, true];
const specialCharacter24 = [false, false, false, true];
const specialCharacter25 = [true, true, true, false, true, true, true];
const specialCharacter26 = [true, true, true, false, true];
const specialCharacter27 = [false, false, false, false];
const specialCharacter28 = [true, false, false, true, true];
const specialCharacter29 = [true, true, false, false];
const specialCharacter30 = [false, false, true, true, false, true];
const specialCharacter31 = [false, false, true, true, false];
