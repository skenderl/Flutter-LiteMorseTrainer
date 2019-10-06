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
  '9': character9
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

const rules = [
  "The length of a dot is one unit.",
  "A dash is three units.",
  "The space between symbols (dots and dashes) of the same letter is one unit.",
  "The space between letters is three units.",
  "The space between words is seven units."
];

const letters = [
  'A',
  'B',
  'C',
  'D',
  'E',
  'F',
  'G',
  'H',
  'I',
  'J',
  'K',
  'L',
  'M',
  'N',
  'O',
  'P',
  'Q',
  'R',
  'S',
  'T',
  'U',
  'V',
  'W',
  'X',
  'Y',
  'Z'
];

const numbers = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
