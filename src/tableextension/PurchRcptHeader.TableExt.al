tableextension 50006 PurchRcptHeader extends "Purch. Rcpt. Header"
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

