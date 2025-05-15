tableextension 50060 tableextension50060 extends "Action Message Entry"
{

    //Unsupported feature: Code Modification on "SumUp(PROCEDURE 1)".

    //procedure SumUp();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    ActionMessageEntry2 := ActionMessageEntry;

    WITH ActionMessageEntry2 DO BEGIN
    #4..51

      ComponentBinding := FALSE;
      IF ActionMessageEntry."Source Type" = DATABASE::"Prod. Order Line" THEN BEGIN
        FirstDate := 31129999D;
        ActionMessageEntry.FilterToReservEntry(ReservEntry);
        ReservEntry.SETRANGE(Binding,ReservEntry.Binding::"Order-to-Order");
        IF ReservEntry.FINDSET THEN
    #59..74
          UNTIL ReservEntry.NEXT = 0;
      END;
    END; // WITH
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..54
        FirstDate := 12319999D;
    #56..77
    */
    //end;
}

