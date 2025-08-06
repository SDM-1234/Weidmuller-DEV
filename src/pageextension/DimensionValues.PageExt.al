pageextension 50075 DimensionValues extends "Dimension Values"
{
    layout
    {
        addafter(Code)
        {
            field("Dimension Code"; Rec."Dimension Code")
            {
                ApplicationArea = All;
            }
            field(Description; Rec.Description)
            {
                ApplicationArea = All;
            }
        }
    }
}

