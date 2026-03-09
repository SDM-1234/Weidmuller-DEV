namespace WM.WeidmullerDEV;

using Microsoft.Sales.Document;
    
pageextension 50051 SalesQuote extends "Sales Quote"
{
    DeleteAllowed = false;
    layout
    {
        addlast(General)
        {
            field("Posting Date"; Rec."Posting Date")
            {
                ToolTip = 'Specifies the value of the Posting Date field.';
                ApplicationArea = All;
            }

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

    trigger OnAfterGetRecord()
    begin
        Rec.UpdatePONo();
    end;
}


