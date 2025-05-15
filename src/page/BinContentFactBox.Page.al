page 50000 "BinContent FactBox"
{
    // Project: Weidmuller
    // ********************************************************************************************************************************
    // Developer: SourceEdge
    // ********************************************************************************************************************************
    // -+------+---------+--------+---------+----+--------------------------------------
    // T|ID_RIC|MOD  REL |DATE    |SEARCH   |Developer|DESCRIPTION
    // -+------+---------+--------+---------+----+--------------------------------------
    // ?|SE    |SE   1.00|26.09.17|SE-E859  |Johnson  |Add new page.
    // /|                                             |Added a new FactBox page.

    Caption = 'Bin Content - Details';
    Editable = false;
    InsertAllowed = true;
    PageType = ListPart;
    SourceTable = Table7302;
    SourceTableView = SORTING (Location Code, Bin Code, Item No., Variant Code, Unit of Measure Code)
                      ORDER(Ascending)
                      WHERE (Quantity = FILTER (> 0));

    layout
    {
        area(content)
        {
            repeater()
            {
                field("Bin Code"; "Bin Code")
                {
                    Caption = 'Bin Code';
                }
                field(Quantity; BinQuantity)
                {
                    Caption = 'Quantity';
                }
                field("Receipt Date"; RecieptDate)
                {
                    Caption = 'Receipt Date';
                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetRecord()
    begin
        CLEAR(BinQuantity);
        CLEAR(RecieptDate);
        UpdatewithPostDate(G_PostingDate, G_LocationCode);
    end;

    var
        BinQuantity: Decimal;
        WarehouseEntry: Record "7312";
        G_PostingDate: Date;
        RecieptDate: Date;
        G_LocationCode: Code[10];
        WarehouseEntry1: Record "7312";

    local procedure UpdatewithPostDate(L_PostingDate: Date; L_LocCode: Code[10])
    begin
        WarehouseEntry.RESET;
        WarehouseEntry.SETCURRENTKEY("Item No.", "Bin Code", "Location Code", "Variant Code", "Unit of Measure Code");
        WarehouseEntry.SETRANGE("Location Code", L_LocCode);
        WarehouseEntry.SETRANGE("Bin Code", "Bin Code");
        WarehouseEntry.SETRANGE("Item No.", "Item No.");
        WarehouseEntry.SETRANGE("Variant Code", "Variant Code");
        WarehouseEntry.SETRANGE("Unit of Measure Code", "Unit of Measure Code");
        WarehouseEntry.CALCSUMS(Quantity);
        BinQuantity := WarehouseEntry.Quantity;
        CLEAR(WarehouseEntry1);
        WarehouseEntry1.COPYFILTERS(WarehouseEntry);
        IF WarehouseEntry1.FINDLAST THEN
            RecieptDate := WarehouseEntry1."Registering Date";
        CurrPage.UPDATE(FALSE);
    end;

    [Scope('Internal')]
    procedure GetPostingDate(L_PostDate: Date; L_LocationCode: Code[10])
    begin
        G_LocationCode := L_LocationCode;
        SETRANGE("Location Code", G_LocationCode);
        CurrPage.UPDATE(FALSE);
    end;
}

