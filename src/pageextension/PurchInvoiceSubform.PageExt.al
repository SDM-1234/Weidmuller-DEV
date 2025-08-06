pageextension 50077 PurchInvoiceSubform extends "Purch. Invoice Subform"
{

    //Unsupported feature: Property Modification (Visible) on ""Purch. Invoice Subform"(Page 55)".


    //Unsupported feature: Property Modification (SourceExpr) on ""Purch. Invoice Subform"(Page 55)".


    //Unsupported feature: Property Insertion (Visible) on ""Purch. Invoice Subform"(Page 55)".


    //Unsupported feature: Property Modification (SourceExpr) on ""Purch. Invoice Subform"(Page 55)".


    //Unsupported feature: Property Insertion (Visible) on ""Purch. Invoice Subform"(Page 55)".


    //Unsupported feature: Property Insertion (Visible) on ""Purch. Invoice Subform"(Page 55)".


    //Unsupported feature: Property Insertion (Visible) on ""Purch. Invoice Subform"(Page 55)".


    //Unsupported feature: Property Insertion (HideValue) on ""Purch. Invoice Subform"(Page 55)".

    layout
    {
        addafter("No.")
        {
            field("Document Type"; Rec."Document Type")
            {
                Editable = false;
                ApplicationArea = all;
            }
            field("Document No."; Rec."Document No.")
            {
                Editable = false;
                Visible = true;
                ApplicationArea = All;
            }
            field("Line No."; Rec."Line No.")
            {
                Editable = false;
                ApplicationArea = All;
            }
            field("Gen. Prod. Posting Group"; Rec."Gen. Prod. Posting Group")
            {
                ApplicationArea = All;
            }
        }
    }
}

