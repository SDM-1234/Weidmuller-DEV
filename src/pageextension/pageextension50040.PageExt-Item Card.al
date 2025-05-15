pageextension 50040 pageextension50040 extends "Item Card"
{
    layout
    {
        addafter("Control 4")
        {
            field("Description 2"; "Description 2")
            {
            }
        }
        addafter("Control 14")
        {
            field("Inventory-Nippon"; "Inventory-Nippon")
            {
                Caption = 'Inventory-FG';
                DecimalPlaces = 0 : 5;
                Importance = Promoted;
            }
            field("Inventory-Quarantine"; "Inventory-Quarantine")
            {
                DecimalPlaces = 0 : 5;
                Importance = Promoted;
            }
        }
        addafter(PreventNegInventoryDefaultNo)
        {
            field("EAN No."; "EAN No.")
            {
            }
            field("Marketing Status"; "Marketing Status")
            {
            }
            field(Notification; Notification)
            {
            }
        }
        addafter("Control 54")
        {
            field("Item Type"; "Item Type")
            {
            }
        }
    }


    //Unsupported feature: Code Insertion on "OnQueryClosePage".

    //trigger OnQueryClosePage(CloseAction: Action): Boolean
    //begin
    /*
    //>> 1065
    IF "Reordering Policy" = "Reordering Policy"::"Fixed Reorder Qty." THEN
      TESTFIELD("Order Multiple");
    //<< 1065
    */
    //end;
}

