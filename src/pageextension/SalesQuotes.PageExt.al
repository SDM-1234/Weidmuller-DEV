namespace WM.WeidmullerDEV;

using Microsoft.Sales.Document;
    
pageextension 50108 SalesQuotes extends "Sales Quotes"
{
    DeleteAllowed = false;
    layout
    {
        addlast(Control1)
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
        addafter("&Quote")
        {
            action(CheckDuplicateItem)
            {
                ApplicationArea = All;
                Caption = 'Check Duplicate Item';
                Image = CheckDuplicates;
                ToolTip = 'Click here to check duplicate items';


                trigger OnAction()
                begin
                    Rec.CheckDuplicateItem()
                end;
            }

        }
    }
}

