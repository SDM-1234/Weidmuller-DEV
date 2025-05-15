pageextension 50087 pageextension50087 extends "Whse. Receipt Subform"
{
    layout
    {
        addafter("Control 22")
        {
            field("EAN No."; "EAN No.")
            {
            }
        }
        addafter("Control 20")
        {
            field("Line No."; "Line No.")
            {
            }
        }
        addafter("Control 34")
        {
            field("Total No of Boxes"; "Total No of Boxes")
            {
            }
        }
    }

    local procedure "*****SE-E859****"()
    begin
    end;

    procedure UpdateByEAN(var WarehouseReceiptHeader1: Record "7316")
    begin
        IF WarehouseReceiptHeader1."EAN No." <> '' THEN
            SETFILTER("EAN No.", '%1', WarehouseReceiptHeader1."EAN No.")
        ELSE
            SETRANGE("EAN No.");
        CurrPage.UPDATE;
    end;
}

