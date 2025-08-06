pageextension 50076 PurchaseOrderSubform extends "Purchase Order Subform"
{
    layout
    {
        addafter("No.")
        {
            field("Line No."; Rec."Line No.")
            {
                ApplicationArea = All;
            }
            field("Description 2"; Rec."Description 2")
            {
                ApplicationArea = All;
            }
            field("Profit %"; Rec."Profit %")
            {
                ApplicationArea = All;

            }
            field("Tax Area Code"; Rec."Tax Area Code")
            {
                ApplicationArea = All;

            }
            field("Tax Liable"; Rec."Tax Liable")
            {
                ApplicationArea = All;

            }
            field("Tax Group Code"; Rec."Tax Group Code")
            {
                ApplicationArea = All;

            }
        }
    }
}

