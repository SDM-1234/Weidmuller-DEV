pageextension 50108 pageextension50108 extends "Sales Quotes"
{
    layout
    {

        //Unsupported feature: Property Modification (SourceExpr) on "Control 17".

        addafter("Control 153")
        {
            field(Amount; Amount)
            {
            }
        }
        addafter("Control 119")
        {
            field("Enquiry No."; "Enquiry No.")
            {
            }
            field("Due Date"; "Due Date")
            {
            }
            field("Amount to Customer"; "Amount to Customer")
            {
            }
        }
        addafter("Control 1102601007")
        {
            field(Validity; Validity)
            {
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

