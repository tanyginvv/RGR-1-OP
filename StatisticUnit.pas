UNIT StatisticUnit;

INTERFACE

USES
  WordUnit, TreeSortUnit, ConstUnit;
PROCEDURE GetStatistic;
  
IMPLEMENTATION      
  
PROCEDURE GetStatistic;
VAR
  Data: WordType;
  Root: Tree; 
  CountLeafs: INTEGER;
  FIn, FOut: TEXT;
BEGIN{StatisticUnit} 
  ASSIGN(FIn, 'in.txt');
  ASSIGN(FOut, 'out.txt');
  RESET(FIn);
  REWRITE(FOut);
  CountLeafs := 0;
  Root := NIL;
  WHILE (NOT EOF(FIn)) AND (CountLeafs < MaxLeafs)
  DO
    BEGIN
      GetWord(FIn, Data);
      IF Data <> ''
      THEN
        Insert(Root, Data, CountLeafs);
      IF (NOT EOF(FIn)) AND (EOLN(FIn))
      THEN
        READLN(FIn) 
    END;
  PrintTree(Root, FOut);
  Clear(Root)
END;{StatisticUnit}  
    
BEGIN
END.    
