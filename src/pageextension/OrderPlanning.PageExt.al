pageextension 50078 OrderPlanning extends "Order Planning"
{
    layout
    {
        addafter("No.")
        {
            field("Line No."; Rec."Line No.")
            {
                ApplicationArea = All;
            }
        }
    }
}

