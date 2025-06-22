tableextension 50010 PurchCrMemoHdr extends "Purch. Cr. Memo Hdr."
{
    fields
    {
        field(50000; "WE Your Reference"; Code[100])
        {
            Caption = 'Your Reference';
            DataClassification = ToBeClassified;
        }
    }
}

