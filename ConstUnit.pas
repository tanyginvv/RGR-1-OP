UNIT ConstUnit;

INTERFACE
CONST
  UpperCase = ['A' .. 'Z', 'À' .. 'ß', '¨'];
  LowerCase = ['a' .. 'z', 'à' .. 'ÿ', '¸', '-'];
  CorrectChars = UpperCase + LowerCase; 
  MaxLeafs = 10000;
  OverflowConstStr = 'Overflow count this word';

IMPLEMENTATION

BEGIN{ConstUnit}
END.{ConstUnit}
