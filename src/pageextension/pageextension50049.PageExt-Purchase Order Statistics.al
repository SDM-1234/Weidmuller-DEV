pageextension 50049 pageextension50049 extends "Purchase Order Statistics"
{
    var
        TotalGST1: Decimal;
        ReverseChargeLineAmount: Decimal;
        ReverseChargeLineAmountInvoiced: Decimal;
        ReverseChargeLineAmountShipped: Decimal;


        //Unsupported feature: Code Modification on "OnAfterGetRecord".

        //trigger OnAfterGetRecord()
        //>>>> ORIGINAL CODE:
        //begin
        /*
        RefreshOnAfterGetRecord;
        ClearGSTStatisticsAmount;
        GLSetup.GET;
        #4..11
                GSTManagement.RoundTotalGSTAmountQtyFactor(
                  Transactiontype::Purchase,PurchaseLine."Document Type",
                  PurchaseLine."Document No.",PurchaseLine."Line No.",1,"Currency Code",FALSE);

              IF PurchaseLine."GST Assessable Value" <> 0 THEN
                TotalGSTInvoiced +=
                  GSTManagement.RoundTotalGSTAmountforGSTAssessable(
        #19..50
              TotalGSTInvoiced1 := TotalGSTInvoiced;
              TotalGSTShipped1 := TotalGSTShipped;
            END;

            IF PurchaseLine."GST Reverse Charge" THEN BEGIN
              ReverseChargeGST := TotalGST;
              ReverseChargeGSTInvoiced := TotalGSTInvoiced1;
        #58..98
            TotalAdvGSTShipped := GetApplicableAmount(TotalAmountApplied,TotalGSTShipped);
          END;
        END;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        #1..14
        #16..53
        #55..101
        */
        //end;


        //Unsupported feature: Code Modification on "ClearGSTStatisticsAmount(PROCEDURE 1500200)".

        //procedure ClearGSTStatisticsAmount();
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        TotalGST := 0;
        TotalGSTInvoiced := 0;
        TotalGSTShipped := 0;
        #4..7
        ReverseChargeGST := 0;
        ReverseChargeGSTInvoiced := 0;
        ReverseChargeGSTShipped := 0;
        ReverseChargeGSTAmount := 0;
        TotalGSTInvoiced1 :=0;
        TotalGSTShipped1 :=0;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        #1..10

        ReverseChargeLineAmount := 0;
        ReverseChargeLineAmountInvoiced := 0;
        ReverseChargeLineAmountShipped :=0;
        #11..13
        */
        //end;
}

