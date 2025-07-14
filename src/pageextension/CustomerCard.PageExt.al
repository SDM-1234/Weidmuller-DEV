pageextension 50032 CustomerCard extends "Customer Card"
{
    layout
    {

        addlast(General)
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
        }
        addlast(Shipping)
        {
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


    //Unsupported feature: Code Insertion on "OnModifyRecord".


    // trigger OnModifyRecord()
    // var
    //     myInt: Integer;
    // begin
    //     //++ ZT0207 06.05.2020
    //     IF Rec."E-Mail" = '' THEN
    //         ERROR('Kindly enter Customer mail');
    //     //-- ZT0207 06.05.2020
    //     //++ ZT0207 19.08.2020
    //     //IF(COMPANYNAME='PreGOLIVE') THEN BEGIN
    //     IF (xRec."Customer Price Group" <> Rec."Customer Price Group") OR (xRec."Customer Posting Group" <> Rec."Customer Posting Group")
    //       OR (xRec."Gen. Bus. Posting Group" <> Rec."Gen. Bus. Posting Group") THEN
    //         Rec.Blocked := Rec.Blocked::All;
    //     //END;
    //     //-- ZT0207 19.08.2020

    //end;

    trigger OnQueryClosePage(CloseAction: Action): Boolean
    begin

        IF Rec."Currency Code" = '' THEN
            Rec.TESTFIELD("Currency Code");

    end;
}

