pageextension 50097 pageextension50097 extends "Whse. Shipment Subform"
{
    layout
    {
        addafter("Control 22")
        {
            field("EAN No."; "EAN No.")
            {
            }
        }
    }

    local procedure "*****SE-E859****"()
    begin
    end;

    procedure UpdateByEAN(var WarehouseShipmentHeader1: Record "7320")
    begin
        IF WarehouseShipmentHeader1."EAN No." <> '' THEN
            SETFILTER("EAN No.", '%1', WarehouseShipmentHeader1."EAN No.")
        ELSE
            SETRANGE("EAN No.");
        CurrPage.UPDATE(FALSE);
    end;
}

