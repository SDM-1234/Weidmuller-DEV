pageextension 50097 WhseReceiptLines extends "Whse. Receipt Lines"
{
    layout
    {
        addafter("Bin Code")
        {
            field("EAN No."; Rec."EAN No.")
            {
                ApplicationArea = All;
            }
        }
    }
}

