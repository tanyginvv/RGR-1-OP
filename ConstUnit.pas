UNIT ConstUnit;

INTERFACE
CONST
  UpperCase = ['A' .. 'Z', '�' .. '�', '�'];
  LowerCase = ['a' .. 'z', '�' .. '�', '�', '-'];
  CorrectChars = UpperCase + LowerCase; 
  MaxLeafs = 10000;
  OverflowConstStr = 'Overflow count this word';

IMPLEMENTATION

BEGIN{ConstUnit}
END.{ConstUnit}
