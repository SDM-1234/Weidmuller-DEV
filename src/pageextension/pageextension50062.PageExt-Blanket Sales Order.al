pageextension 50062 pageextension50062 extends "Blanket Sales Order"
{
    layout
    {

        //Unsupported feature: Property Modification (SourceExpr) on "Control 507".

        addafter("Control 119")
        {
            field(Validity; Validity)
            {
                Editable = false;
            }
            field("Quote No."; "Quote No.")
            {
            }
        }
    }
}

