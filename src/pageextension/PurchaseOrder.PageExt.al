pageextension 50061 PurchaseOrder extends "Purchase Order"
{

    layout
    {
        addafter("Buy-from Vendor Name")
        {
            field("Buy-from Vendor Name 2"; Rec."Buy-from Vendor Name 2")
            {
                ApplicationArea = All;
            }
        }
        addafter("Vendor Invoice No.")
        {
            field("Receiving No."; Rec."Receiving No.")
            {
                ApplicationArea = All;
            }

            field("Receiving No. Series"; Rec."Receiving No. Series")
            {
                ApplicationArea = All;
            }
        }
    }
}

