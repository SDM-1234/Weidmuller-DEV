pageextension 50039 pageextension50039 extends "Vendor Ledger Entries"
{
    Editable = false;
    layout
    {
        addafter("Control 70")
        {
            field("Original Currency Factor"; "Original Currency Factor")
            {
                Editable = false;
            }
        }
        addafter("Control 1500007")
        {
            field("Closed at Date"; "Closed at Date")
            {
            }
        }
    }
}

