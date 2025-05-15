page 50012 "Actual Inventory"
{
    PageType = List;
    SourceTable = Table32;
    SourceTableTemporary = true;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Item No."; "Item No.")
                {
                }
                field("Location Code"; "Location Code")
                {
                }
                field("Remaining Quantity"; "Remaining Quantity")
                {
                }
            }
        }
    }

    actions
    {
    }

    trigger OnOpenPage()
    var
        ItemLedgerEntry: Record "32";
    begin
        EntryNo := 0;
        ItemLedgerEntry.RESET;
        IF ItemLedgerEntry.FINDLAST THEN
            EntryNo := ItemLedgerEntry."Entry No.";
        ItemLedgerEntry.RESET;
        ItemLedgerEntry.SETCURRENTKEY("Location Code", "Item No.");
        ItemLedgerEntry.SETFILTER("Location Code", '<>%1', '');
        ItemLedgerEntry.SETFILTER("Item No.", '<>%1', '');
        ItemLedgerEntry.SETFILTER("Remaining Quantity", '<>%1', 0);
        IF ItemLedgerEntry.FINDSET THEN
            REPEAT
                IF LocationCode <> ItemLedgerEntry."Location Code" THEN BEGIN
                    CLEAR(ItemNo);
                    IF ItemNo <> ItemLedgerEntry."Item No." THEN BEGIN
                        EntryNo += 1;
                        InsertTemLedgeEntry(ItemLedgerEntry);
                    END;
                END ELSE BEGIN
                    IF ItemNo <> ItemLedgerEntry."Item No." THEN BEGIN
                        EntryNo += 1;
                        InsertTemLedgeEntry(ItemLedgerEntry);
                    END ELSE BEGIN
                        UpdateTempLedgerEntry(ItemLedgerEntry);
                    END;
                END;
                ItemNo := ItemLedgerEntry."Item No.";
                LocationCode := ItemLedgerEntry."Location Code";
            UNTIL ItemLedgerEntry.NEXT = 0;
        CurrPage.UPDATE;
    end;

    var
        LocationCode: Code[20];
        ItemNo: Code[20];
        EntryNo: Integer;

    local procedure InsertTemLedgeEntry(var ItemLedgerEntry: Record "32")
    begin
        Rec.INIT;
        Rec."Entry No." := EntryNo;
        Rec."Location Code" := ItemLedgerEntry."Location Code";
        Rec."Item No." := ItemLedgerEntry."Item No.";
        Rec."Remaining Quantity" := ItemLedgerEntry."Remaining Quantity";
        Rec.INSERT;
    end;

    local procedure UpdateTempLedgerEntry(var ItemLedgerEntry: Record "32")
    begin
        /*RESET;
        SETRANGE("Location Code",ItemLedgerEntry."Location Code");
        SETRANGE("Item No.",ItemLedgerEntry."Item No.");
        IF FINDFIRST THEN BEGIN
         "Remaining Quantity" += ItemLedgerEntry."Remaining Quantity";
         MODIFY;
        END;
        */
        "Remaining Quantity" += ItemLedgerEntry."Remaining Quantity";
        MODIFY;

    end;
}

