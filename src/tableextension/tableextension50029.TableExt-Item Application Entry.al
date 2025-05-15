tableextension 50029 tableextension50029 extends "Item Application Entry"
{

    //Unsupported feature: Code Modification on "GetVisitedEntries(PROCEDURE 15)".

    //procedure GetVisitedEntries();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    MaxValuationDate := 0D;
    IF WithinValuationDate THEN BEGIN
      ValueEntry.SETCURRENTKEY("Item Ledger Entry No.","Valuation Date");
    #4..7
        AvgCostAdjmtEntryPoint.SETRANGE("Variant Code",FromItemLedgEntry."Variant Code");
        AvgCostAdjmtEntryPoint.SETRANGE("Location Code",FromItemLedgEntry."Location Code");
      END;
      AvgCostAdjmtEntryPoint.SETRANGE("Valuation Date",ValueEntry."Valuation Date",31129999D);
      IF AvgCostAdjmtEntryPoint.FINDFIRST THEN
        MaxValuationDate := AvgCostAdjmtEntryPoint."Valuation Date"
    END;
    #15..24
        ItemLedgEntryInChain := ToItemLedgEntry;
        ItemLedgEntryInChain.INSERT;
      UNTIL ItemLedgEntryInChainNo.NEXT = 0;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..10
      AvgCostAdjmtEntryPoint.SETRANGE("Valuation Date",ValueEntry."Valuation Date",12319999D);
    #12..27
    */
    //end;
}

