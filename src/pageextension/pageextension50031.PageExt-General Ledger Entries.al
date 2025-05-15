pageextension 50031 pageextension50031 extends "General Ledger Entries"
{
    layout
    {
        addafter("Control 10")
        {
            field("External Document No."; "External Document No.")
            {
            }
        }
        addafter("Control 54")
        {
            field("Source Type"; "Source Type")
            {
            }
            field("Source No."; "Source No.")
            {
            }
        }
        addafter("Control 20")
        {
            field("Dimension Code"; DimensionCode)
            {
                Caption = 'Dimension Code';
            }
            field("Dimension Name"; DimensionName)
            {
                Caption = 'Dimension Name';
            }
            field("Debit Amount"; "Debit Amount")
            {
            }
            field("Credit Amount"; "Credit Amount")
            {
            }
        }
    }

    var
        DimensionCode: Code[20];
        DimensionName: Text[50];
        DimensionSetEntry: Record "480";


        //Unsupported feature: Code Insertion on "OnAfterGetRecord".

        //trigger OnAfterGetRecord()
        //begin
        /*
        DimensionSetEntry.RESET;
        DimensionSetEntry.SETRANGE(DimensionSetEntry."Dimension Set ID","Dimension Set ID");
        IF DimensionSetEntry.FINDFIRST THEN BEGIN
          DimensionCode :=DimensionSetEntry."Dimension Value Code";
          DimensionSetEntry.CALCFIELDS("Dimension Value Name");
          DimensionName :=DimensionSetEntry."Dimension Value Name";
        END;
        */
        //end;
}

