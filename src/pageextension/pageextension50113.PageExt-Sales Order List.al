pageextension 50113 pageextension50113 extends "Sales Order List"
{
    layout
    {

        //Unsupported feature: Property Modification (SourceExpr) on "Control 17".

        addafter("Control 1102601005")
        {
            field(Amount; Amount)
            {
            }
            field("Amount to Customer"; "Amount to Customer")
            {
            }
        }
        addafter("Control 5")
        {
            field("Order Date"; "Order Date")
            {
            }
            field("Quote No."; "Quote No.")
            {
            }
            field(Validity; Validity)
            {
                Editable = false;
            }
        }
    }
    actions
    {


        //Unsupported feature: Code Modification on "Post(Action 1102601003).OnAction".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        SendToPosting(CODEUNIT::"Sales-Post (Yes/No)");
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        TESTFIELD("Currency Code");//SDM-RSF_ZOHO.1583

        TESTFIELD("PO No.");
        SendToPosting(CODEUNIT::"Sales-Post (Yes/No)");
        */
        //end;


        //Unsupported feature: Code Modification on "Action 1102601004.OnAction".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        SendToPosting(CODEUNIT::"Sales-Post + Print");
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        TESTFIELD("Currency Code");//SDM-RSF_ZOHO.1583

        TESTFIELD("PO No.");
        SendToPosting(CODEUNIT::"Sales-Post + Print");
        */
        //end;


        //Unsupported feature: Code Modification on "Action 14.OnAction".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        SalesPostPrint.PostAndEmail(Rec);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        TESTFIELD("PO No.");
        SalesPostPrint.PostAndEmail(Rec);
        */
        //end;


        //Unsupported feature: Code Modification on "Action 50.OnAction".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        REPORT.RUNMODAL(REPORT::"Batch Post Sales Orders",TRUE,TRUE,Rec);
        CurrPage.UPDATE(FALSE);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        TESTFIELD("PO No.");
        REPORT.RUNMODAL(REPORT::"Batch Post Sales Orders",TRUE,TRUE,Rec);
        CurrPage.UPDATE(FALSE);
        */
        //end;


        //Unsupported feature: Code Modification on "Action 22.OnAction".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        ShowPreview
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        TESTFIELD("Currency Code");//SDM-RSF_ZOHO.1583

        TESTFIELD("PO No.");
        ShowPreview;
        */
        //end;


        //Unsupported feature: Code Modification on "Action 151.OnAction".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        DocPrint.PrintSalesOrder(Rec,Usage::"Order Confirmation");
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        TESTFIELD("Currency Code");//SDM-RSF_ZOHO.1583

        DocPrint.PrintSalesOrder(Rec,Usage::"Order Confirmation");
        */
        //end;
    }
}

