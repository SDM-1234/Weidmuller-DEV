pageextension 50012 pageextension50012 extends "Posted Sales Invoices"
{
    layout
    {
        addafter("Control 13")
        {
            field("Amount(LCY)"; AmountLCY)
            {
                Caption = 'Amount(LCY)';
            }
        }
    }
    actions
    {


        //Unsupported feature: Code Modification on "Action 1500000.OnAction".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        ShowInvoiceTypeDoc("Invoice Type"::Taxable);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        ShowInvoiceTypeDoc("Invoice Type"::" ");
        */
        //end;
        addafter(IncomingDoc)
        {
            action("Print Invoice")
            {
                Caption = 'Print Invoice';
                Image = Print;

                trigger OnAction()
                begin
                    //ZE_LIJO 25.06.2019
                    //<<
                    CurrPage.SETSELECTIONFILTER(Rec);
                    SaInvHdr.RESET;
                    SaInvHdr.COPY(Rec);
                    CLEAR(Rec);
                    REPORT.RUN(50015, TRUE, FALSE, SaInvHdr);
                    //>>
                end;
            }
            action("Print Invoice Certificate")
            {
                Caption = 'Print Invoice Certificate';
                Image = Print;

                trigger OnAction()
                begin
                    //ZE_LIJO 05.08.2019
                    //<<
                    CurrPage.SETSELECTIONFILTER(Rec);
                    SaInvHdr.RESET;
                    SaInvHdr.COPY(Rec);
                    CLEAR(Rec);
                    REPORT.RUN(50023, TRUE, FALSE, SaInvHdr);
                    //>>
                end;
            }
        }
    }

    var
        SaInvHdr: Record "112";
        AmountLCY: Decimal;


        //Unsupported feature: Code Modification on "OnAfterGetRecord".

        //trigger OnAfterGetRecord()
        //>>>> ORIGINAL CODE:
        //begin
        /*
        DocExchStatusStyle := GetDocExchStatusStyle;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        DocExchStatusStyle := GetDocExchStatusStyle;
        //ZE_LIJO 08.08.2019
        //++
        CALCFIELDS(Amount);
        IF "Currency Factor"<>0 THEN
          AmountLCY:=(1/"Currency Factor")*Amount
        ELSE
          AmountLCY:=Amount;
        //--
        */
        //end;
}

