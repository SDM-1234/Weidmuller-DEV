tableextension 50034 PurchaseLine extends "Purchase Line"
{
    fields
    {
        field(50000; Weight; Decimal)
        {
            Description = 'SE-E859';
        }
        field(50001; "Demand Order No."; Code[20])
        {
            Caption = 'Demand Order No.';
            Description = 'SE-E859';
            Editable = false;
        }
    }
    keys
    {
        key(WEKey1; "Document Type", "Pay-to Vendor No.")
        {
            Enabled = false;
        }
    }
}

