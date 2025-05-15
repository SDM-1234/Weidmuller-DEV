pageextension 50114 pageextension50114 extends "Purchase Order List"
{
    actions
    {

        //Unsupported feature: Code Modification on "Print(Action 55).OnAction".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        DocPrint.PrintPurchHeader(Rec);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        //DocPrint.PrintPurchHeader(Rec); ZE_LIJO 25.06.2019
        //<<
        CurrPage.SETSELECTIONFILTER(Rec);
        PurchHdr.RESET;
        PurchHdr.COPY(Rec);
        CLEAR(Rec);
        REPORT.RUN(50018,TRUE,FALSE,PurchHdr);
        //>>
        */
        //end;
    }

    var
        PurchHdr: Record "38";
}

