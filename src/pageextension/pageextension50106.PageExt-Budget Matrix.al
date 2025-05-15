pageextension 50106 pageextension50106 extends "Budget Matrix"
{

    //Unsupported feature: Code Modification on "BudgetDrillDown(PROCEDURE 1172)".

    //procedure BudgetDrillDown();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    GLBudgetEntry.SETRANGE("Budget Name",GLBudgetName.Name);
    IF GLAccBudgetBuf.GETFILTER("G/L Account Filter") <> '' THEN
      GLAccBudgetBuf.COPYFILTER("G/L Account Filter",GLBudgetEntry."G/L Account No.");
    #4..17
    IF GLAccBudgetBuf.GETFILTER("Date Filter") <> '' THEN
      GLAccBudgetBuf.COPYFILTER("Date Filter",GLBudgetEntry.Date)
    ELSE
      GLBudgetEntry.SETRANGE(Date,0D,31129999D);
    WITH GLBudgetEntry DO
      IF (GETFILTER("Global Dimension 1 Code") <> '') OR (GETFILTER("Global Dimension 2 Code") <> '') OR
         (GETFILTER("Business Unit Code") <> '')
    #25..28
    GLBudgetEntries.SetEditable(TRUE);
    GLBudgetEntries.SETTABLEVIEW(GLBudgetEntry);
    GLBudgetEntries.RUN;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..20
      GLBudgetEntry.SETRANGE(Date,0D,12319999D);
    #22..31
    */
    //end;
}

