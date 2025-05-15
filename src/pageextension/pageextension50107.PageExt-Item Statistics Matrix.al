pageextension 50107 pageextension50107 extends "Item Statistics Matrix"
{

    //Unsupported feature: Code Modification on "DrillDown(PROCEDURE 1139)".

    //procedure DrillDown();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    WITH ItemBuffer DO BEGIN
      ValueEntry.SETCURRENTKEY(
        "Item No.","Posting Date","Item Ledger Entry Type","Entry Type","Variance Type",
    #4..6
      IF GETFILTER("Date Filter") <> '' THEN
        COPYFILTER("Date Filter",ValueEntry."Posting Date")
      ELSE
        ValueEntry.SETRANGE("Posting Date",0D,31129999D);
      IF GETFILTER("Entry Type Filter") <> '' THEN
        COPYFILTER("Entry Type Filter",ValueEntry."Entry Type");
      IF GETFILTER("Item Ledger Entry Type Filter") <> '' THEN
    #14..29
          PAGE.RUN(0,ValueEntry,ValueEntry."Cost Amount (Actual)");
      END;
    END;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..9
        ValueEntry.SETRANGE("Posting Date",0D,12319999D);
    #11..32
    */
    //end;
}

