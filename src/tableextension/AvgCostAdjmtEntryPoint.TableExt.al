tableextension 50044 AvgCostAdjmtEntryPoint extends "Avg. Cost Adjmt. Entry Point"
{

    //Unsupported feature: Code Modification on "SetAvgCostAjmtFilter(PROCEDURE 10)".

    //procedure SetAvgCostAjmtFilter();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    AvgCostAdjmtPoint.RESET;
    AvgCostAdjmtPoint.SETRANGE("Item No.","Item No.");
    AvgCostAdjmtPoint.SETRANGE("Variant Code","Variant Code");
    AvgCostAdjmtPoint.SETRANGE("Location Code","Location Code");
    IF AvgCostCalcTypeIsChanged("Valuation Date") THEN BEGIN
      GetAvgCostCalcTypeIsChgPeriod(NextFiscalYearAccPeriod,"Valuation Date");
      AvgCostAdjmtPoint.SETRANGE("Valuation Date","Valuation Date",CALCDATE('<1D>',NextFiscalYearAccPeriod."Starting Date"));
    END ELSE
      AvgCostAdjmtPoint.SETRANGE("Valuation Date","Valuation Date",31129999D);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..8
      AvgCostAdjmtPoint.SETRANGE("Valuation Date","Valuation Date",12319999D);
    */
    //end;
}

