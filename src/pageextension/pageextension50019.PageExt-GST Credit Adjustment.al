pageextension 50019 pageextension50019 extends "GST Credit Adjustment"
{

    //Unsupported feature: Code Modification on "OnOpenPage".

    //trigger OnOpenPage()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    AdjDocNo := NoSeriesManagement.GetNextNo(GSTInputTaxCredit.GetNoSeriesCode(FALSE),PostingDate,FALSE);
    AdjustmentPerc := 100;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*

    AdjDocNo := NoSeriesManagement.GetNextNo(GSTInputTaxCredit.GetNoSeriesCode(FALSE),PostingDate,FALSE);
    AdjustmentPerc := 100;
    */
    //end;
}

