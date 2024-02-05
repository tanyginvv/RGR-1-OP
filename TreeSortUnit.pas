UNIT TreeSortUnit;

INTERFACE
USES 
  ConstUnit;
TYPE 
  WordType = STRING[50];    
  Tree = ^NodeType;
  NodeType = RECORD
               Word: WordType;
               Count: INTEGER;
               OverflowCount: BOOLEAN;
               LLink, RLink: Tree
             END;   
PROCEDURE Insert(VAR Ptr: Tree; VAR Data: WordType; VAR CountLeafs: INTEGER);
PROCEDURE PrintTree(VAR Ptr: Tree; VAR FOut: TEXT);
PROCEDURE Clear(Ptr: Tree);
  
IMPLEMENTATION
PROCEDURE Insert(VAR Ptr: Tree; VAR Data: WordType; VAR CountLeafs: INTEGER);
BEGIN{Insert}
  IF Ptr = NIL
  THEN
    BEGIN{Создаем лист со значением Data}
      NEW(Ptr);
      Ptr^.Word := Data;
      Ptr^.Count := 1;
      Ptr^.LLink := NIL;
      Ptr^.RLink := NIL;
      Ptr^.OverflowCount := FALSE;
      CountLeafs := CountLeafs + 1 
    END
  ELSE
    IF Ptr^.Word <> Data
    THEN
      IF Ptr^.Word > Data
      THEN
        Insert(Ptr^.LLink, Data, CountLeafs)
      ELSE
        Insert(Ptr^.RLink, Data, CountLeafs)
    ELSE
      IF Ptr^.Count < MAXINT
      THEN
        Ptr^.Count := Ptr^.Count + 1
      ELSE
        Ptr^.OverflowCount := TRUE    
END;{Insert}

PROCEDURE PrintTree(VAR Ptr: Tree; VAR FOut: TEXT);
BEGIN{PrintTree}
  IF Ptr <> NIL
  THEN
    BEGIN
      PrintTree(Ptr^.LLink, FOut);
      IF (NOT Ptr^.OverflowCount)
      THEN
        WRITELN(FOut, Ptr^.Word, ' ', Ptr^.Count)
      ELSE
        WRITELN(FOut, Ptr^.Word, ' ', OverflowConstStr);  
      PrintTree(Ptr^.RLink, FOut)
    END
END;{PrintTree} 

PROCEDURE Clear(Ptr: Tree);
BEGIN{Clear}
  IF Ptr <> NIL
  THEN
    Clear(Ptr^.LLink);
    Clear(Ptr^.RLink);
    DISPOSE(Ptr)
END;{Clear} 
  
BEGIN
END.
