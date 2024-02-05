UNIT WordUnit;

INTERFACE
TYPE 
  WordType = STRING[50];
USES
  ConstUnit;
FUNCTION TransformLetters(VAR Ch: CHAR): CHAR;
PROCEDURE GetWord(VAR FIn: TEXT; VAR Data: WordType);

IMPLEMENTATION
FUNCTION TransformLetters(VAR Ch: CHAR): CHAR;
BEGIN{ApperInLow}
  TransformLetters := Ch;
  CASE Ch OF
    'A': TransformLetters := 'a';
    'B': TransformLetters := 'b';
    'C': TransformLetters := 'c';
    'D': TransformLetters := 'd';
    'E': TransformLetters := 'e';
    'F': TransformLetters := 'f';
    'G': TransformLetters := 'g';
    'H': TransformLetters := 'h';
    'I': TransformLetters := 'i';
    'J': TransformLetters := 'j';
    'K': TransformLetters := 'k';
    'L': TransformLetters := 'l';
    'M': TransformLetters := 'm';
    'N': TransformLetters := 'n';
    'O': TransformLetters := 'o';
    'P': TransformLetters := 'p';
    'Q': TransformLetters := 'q';
    'R': TransformLetters := 'r';
    'S': TransformLetters := 's';
    'T': TransformLetters := 't';
    'U': TransformLetters := 'u';
    'V': TransformLetters := 'v';
    'W': TransformLetters := 'w';
    'X': TransformLetters := 'x';
    'Y': TransformLetters := 'y';
    'Z': TransformLetters := 'z';
    'À': TransformLetters := 'à';
    'Á': TransformLetters := 'á';
    'Â': TransformLetters := 'â';
    'Ã': TransformLetters := 'ã';
    'Ä': TransformLetters := 'ä';
    'Å': TransformLetters := 'å';
    '¨': TransformLetters := 'å';    
    '¸': TransformLetters := 'å';
    'Æ': TransformLetters := 'æ';
    'Ç': TransformLetters := 'ç';
    'È': TransformLetters := 'è';
    'É': TransformLetters := 'é';
    'Ê': TransformLetters := 'ê';
    'Ë': TransformLetters := 'ë';
    'Ì': TransformLetters := 'ì';
    'Í': TransformLetters := 'í';
    'Î': TransformLetters := 'î';
    'Ï': TransformLetters := 'ï';
    'Ð': TransformLetters := 'ð';
    'Ñ': TransformLetters := 'ñ';
    'Ò': TransformLetters := 'ò';
    'Ó': TransformLetters := 'ó';
    'Ô': TransformLetters := 'ô';
    'Õ': TransformLetters := 'õ';
    'Ö': TransformLetters := 'ö';
    '×': TransformLetters := '÷';
    'Ø': TransformLetters := 'ø';
    'Ù': TransformLetters := 'ù';
    'Ú': TransformLetters := 'ú';
    'Û': TransformLetters := 'û';
    'Ü': TransformLetters := 'ü';
    'Ý': TransformLetters := 'ý';
    'Þ': TransformLetters := 'þ';
    'ß': TransformLetters := 'ÿ'
  END
END;{ApperInLow}

PROCEDURE GetWord(VAR FIn: TEXT; VAR Data: WordType);
VAR
  Ch: CHAR;
BEGIN{GetWord}
  Data := '';
  WHILE (NOT EOLN(FIn))
  DO
    BEGIN
      READ(FIn, Ch);
      IF (Ch IN CorrectChars)
      THEN
        IF Ch <> '-' 
        THEN
          BEGIN  
            Ch := TransformLetters(Ch);
            Data := Data + Ch
          END
        ELSE
          BEGIN
            Data := Data + Ch;
            WHILE(Ch = '-') AND (NOT EOLN(FIn))
            DO
              READ(FIn, Ch);
            IF (Ch IN CorrectChars)
            THEN
              BEGIN
                Ch := TransformLetters(Ch);  
                Data := Data + Ch
              END
            ELSE
              BREAK       
          END   
      ELSE
        BREAK
    END
END;{GetWord}  

BEGIN
END.
