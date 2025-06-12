pageextension 50012 PostedSalesInvoices extends "Posted Sales Invoices"
{
    layout
    {
        addafter(Amount)
        {
            field("Amount(LCY)"; AmountLCY)
            {
                Caption = 'Amount(LCY)';
                ToolTip = 'Specifies the value of the Amount(LCY) field.';
                ApplicationArea = All;
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
                ToolTip = 'Executes the Print Invoice action.';
                ApplicationArea = All;

                trigger OnAction()
                begin
                    //ZE_LIJO 25.06.2019
                    //<<
                    CurrPage.SETSELECTIONFILTER(Rec);
                    SaInvHdr.RESET();
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
                ToolTip = 'Executes the Print Invoice Certificate action.';
                ApplicationArea = All;

                trigger OnAction()
                begin
                    //ZE_LIJO 05.08.2019
                    //<<
                    CurrPage.SETSELECTIONFILTER(Rec);
                    SaInvHdr.RESET();
                    SaInvHdr.COPY(Rec);
                    CLEAR(Rec);
                    REPORT.RUN(50023, TRUE, FALSE, SaInvHdr);
                    //>>
                end;
            }
        }
    }

    var
        SaInvHdr: Record "Sales Invoice Header";
        AmountLCY: Decimal;


    //Unsupported feature: Code Modification on "OnAfterGetRecord".

    trigger OnAfterGetRecord()
    var
        myInt: Integer;
    begin

    end;
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

