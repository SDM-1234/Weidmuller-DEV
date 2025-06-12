pageextension 50108 SalesQuotes extends "Sales Quotes"
{
    layout
    {

        //Unsupported feature: Property Modification (SourceExpr) on "Control 17".

        addafter(Control1)
        {
            field("Enquiry No."; Rec."Enquiry No.")
            {
                ToolTip = 'Specifies the value of the Enquiry No. field.';
                ApplicationArea = All;
            }
            field(Validity; Rec.Validity)
            {
                ToolTip = 'Specifies the value of the Validity field.';
                ApplicationArea = All;
            }
        }
    }
    actions
    {


        //Unsupported feature: Code Modification on "Action 69.OnAction".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        DocPrint.PrintSalesHeader(Rec);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        TESTFIELD("Currency Code");//SDM-RSF_ZOHO.1583

        DocPrint.PrintSalesHeader(Rec);
        */
        //end;
    }
}

