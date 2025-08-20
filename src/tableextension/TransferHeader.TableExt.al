tableextension 50012 TransferHeader extends "Transfer Header"
{
    fields
    {
        field(50000; "Approval Status"; Enum "Approval Status")
        {
            Caption = 'Approval Status';
            DataClassification = CustomerContent;
        }
    }
}
