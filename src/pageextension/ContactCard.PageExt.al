pageextension 50060 ContactCard extends "Contact Card"
{
    layout
    {
        addafter(Control1900383207)
        {
            field("Resigned - Left Company"; Rec."Resigned - Left Company")
            {
                ToolTip = 'Specifies the value of the Resigned - Left Company field.';
                ApplicationArea = All;
            }
        }
    }
}

