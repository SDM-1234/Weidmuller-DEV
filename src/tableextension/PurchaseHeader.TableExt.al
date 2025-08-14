tableextension 50031 PurchaseHeader extends "Purchase Header"
{
    fields
    {
        field(50000; "WE Your Reference"; Code[100])
        {
            Caption = 'Your Reference';
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(WEKey1; "Document Type", Status, "Document Date")
        {
            Enabled = false;
        }
    }

    procedure CheckAttachment(GRec: Record "Purchase Header")
    var
        RecordLink: Record "Document Attachment";
    begin
        RecordLink.SETRANGE("Table ID", Database::"Purchase Header");
        RecordLink.SetRange("No.", GRec."No.");
        IF RecordLink.IsEmpty THEN
            ERROR('Link attachment is mandatory to send approval request');
    end;

    var
        GSTRegNoErr: Label 'You cannot select GST Reg. No. for Vendor Type.';
}

