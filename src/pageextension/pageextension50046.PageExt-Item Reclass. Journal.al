pageextension 50046 pageextension50046 extends "Item Reclass. Journal"
{
    layout
    {

        //Unsupported feature: Code Modification on "Control 8.OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        ItemJnlMgt.GetItem("Item No.",ItemDescription);
        ShowShortcutDimCode(ShortcutDimCode);
        ShowNewShortcutDimCode(NewShortcutDimCode);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        #1..3
        IF "Location Code" <>'' THEN
          UpdateInventory;
        */
        //end;


        //Unsupported feature: Code Modification on "Control 37.OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        WMSManagement.CheckItemJnlLineLocation(Rec,xRec);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        WMSManagement.CheckItemJnlLineLocation(Rec,xRec);
        IF xRec."Location Code"<> Rec."Location Code" THEN
         UpdateInventory;
        */
        //end;
        addafter("Control 8")
        {
            field("EAN No."; "EAN No.")
            {
            }
            field(Inventory; Inventory)
            {
            }
        }
    }

    var
        Inventory: Decimal;


        //Unsupported feature: Code Modification on "OnAfterGetRecord".

        //trigger OnAfterGetRecord()
        //>>>> ORIGINAL CODE:
        //begin
        /*
        ShowShortcutDimCode(ShortcutDimCode);
        ShowNewShortcutDimCode(NewShortcutDimCode);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        ShowShortcutDimCode(ShortcutDimCode);
        ShowNewShortcutDimCode(NewShortcutDimCode);
        UpdateInventory;
        */
        //end;


        //Unsupported feature: Code Modification on "OnNewRecord".

        //trigger OnNewRecord(BelowxRec: Boolean)
        //>>>> ORIGINAL CODE:
        //begin
        /*
        SetUpNewLine(xRec);
        CLEAR(ShortcutDimCode);
        CLEAR(NewShortcutDimCode);
        "Entry Type" := "Entry Type"::Transfer;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        #1..4
        CLEAR(Inventory);
        */
        //end;

    local procedure UpdateInventory()
    var
        ItemLedgerEntry: Record "32";
    begin
        CLEAR(Inventory);
        ItemLedgerEntry.RESET;
        ItemLedgerEntry.SETCURRENTKEY("Item No.", Open, "Variant Code", Positive, "Location Code", "Posting Date");
        ItemLedgerEntry.SETRANGE("Item No.", "Item No.");
        ItemLedgerEntry.SETRANGE("Location Code", "Location Code");
        ItemLedgerEntry.SETFILTER("Remaining Quantity", '<>%1', 0);
        ItemLedgerEntry.CALCSUMS("Remaining Quantity");
        Inventory := ItemLedgerEntry."Remaining Quantity";
    end;
}

