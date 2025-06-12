pageextension 50003 UserSetup extends "User Setup"
{
    layout
    {
        addafter(PhoneNo)
        {
            field("Update Pricing"; Rec."Update Pricing")
            {
                ToolTip = 'Specifies the value of the Update Pricing field.';
                ApplicationArea = All;
            }
        }
    }
}

