pageextension 50043 CustomerCard extends "Customer Card"
{
    layout
    {
        modify(Blocked)
        {
            trigger OnBeforeValidate()
            begin
                IF (xRec.Blocked = Rec.Blocked::All) OR (xRec.Blocked = Rec.Blocked::Invoice) THEN
                    IF xRec."No." <> 'C001' THEN
                        ERROR('Send Approval Request for Customer Unblocking');
            end;
        }
        addafter("Last Date Modified")
        {
            field("No. of Industry Segments"; Rec."No. of Industry Segments")
            {
                ToolTip = 'Specifies the value of the No. of Industry Segments field.';
                ApplicationArea = All;
            }
            field("Invoice Print Check"; Rec."Invoice Print Check")
            {
                ToolTip = 'Specifies the value of the Invoice Print Check field.';
                ApplicationArea = All;
            }
            field(Freight; Rec.Freight)
            {
                ToolTip = 'Specifies the value of the Freight field.';
                ApplicationArea = All;
            }
            field("Freight GL Account"; Rec."Freight GL Account")
            {
                ToolTip = 'Specifies the value of the Freight GL Account field.';
                ApplicationArea = All;
            }
        }
    }
    actions
    {
        modify(Approve)
        {
            Enabled = true;
        }
        modify(Reject)
        {
            Enabled = true;
        }
        modify(Delegate)
        {
            Enabled = false;
        }
    }

    trigger OnModifyRecord(): Boolean
    begin
        IF Rec."E-Mail" = '' THEN
            ERROR('Kindly enter Customer mail');
        IF (xRec."Customer Price Group" <> Rec."Customer Price Group") OR (xRec."Customer Posting Group" <> Rec."Customer Posting Group")
          OR (xRec."Gen. Bus. Posting Group" <> Rec."Gen. Bus. Posting Group") THEN
            Rec.Blocked := Rec.Blocked::All;
    end;


    trigger OnQueryClosePage(CloseAction: Action): Boolean
    begin

        IF Rec."Currency Code" = '' THEN
            Rec.TESTFIELD("Currency Code");

    end;
}

