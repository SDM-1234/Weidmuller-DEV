pageextension 50048 pageextension50048 extends "Sales Order Statistics"
{
    var
        TotalLineAmt: Decimal;
        TotalInvoiceLineAmt: Decimal;
        TotalShipLineAmt: Decimal;


        //Unsupported feature: Code Modification on "OnAfterGetRecord".

        //trigger OnAfterGetRecord()
        //>>>> ORIGINAL CODE:
        //begin
        /*
        RefreshOnAfterGetRecord;
        ClearGSTStatisticsAmount;
        GLSetup.GET;
        #4..11
                SalesLine."Document No.",SalesLine."Line No.",1,"Currency Code",FALSE);
              TotalGSTInvoiced += GSTManagement.RoundTotalGSTAmountQtyFactor(TransactionType::Sale,SalesLine."Document Type",
                SalesLine."Document No.",SalesLine."Line No.",SalesLine."Qty. to Invoice" / SalesLine.Quantity,"Currency Code",FALSE);

              TotalInvoiceGSTAmt += SalesLine."Total GST Amount" * (SalesLine."Qty. to Invoice" / SalesLine.Quantity);

              IF "Document Type" IN ["Document Type"::"Return Order","Document Type"::"Credit Memo"] THEN
        #19..87
            TotalSalesLine[3]."Amount To Customer" -= ABS(TotalGSTShipped1);
          END;
        END;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*

        #1..14
        #16..90
        */
        //end;
}

