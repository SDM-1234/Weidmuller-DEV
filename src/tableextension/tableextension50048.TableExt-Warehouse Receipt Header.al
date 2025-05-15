tableextension 50048 tableextension50048 extends "Warehouse Receipt Header"
{
    fields
    {

        //Unsupported feature: Property Modification (Name) on ""Vendor Shipment No."(Field 13)".

        field(50000; "EAN No."; Code[13])
        {
            Description = 'SE-SE859';

            trigger OnValidate()
            begin
                //SE-E859.s
                IF "EAN No." <> '' THEN
                    CheckIsValidEAN("EAN No.");
                //SE-E859.e
            end;
        }
    }

    local procedure "*****SE-E859*****"()
    begin
    end;

    local procedure CheckIsValidEAN(L_EAN_No: Code[13])
    var
        L_Item: Record "27";
    begin
        IF STRLEN(L_EAN_No) > 13 THEN
            ERROR(Text029);
        IF STRLEN(L_EAN_No) < 13 THEN
            ERROR(Text030);
        L_Item.RESET;
        L_Item.SETCURRENTKEY("EAN No.");
        L_Item.SETRANGE("EAN No.", L_EAN_No);
        IF NOT L_Item.ISEMPTY THEN
            ERROR(Text031);
    end;

    procedure ClearBins()
    var
        WarehouseReceiptLine: Record "7317";
    begin
        WarehouseReceiptLine.RESET;
        WarehouseReceiptLine.SETCURRENTKEY("No.", "Bin Code");
        WarehouseReceiptLine.SETRANGE("No.", "No.");
        WarehouseReceiptLine.SETFILTER("Bin Code", '<>%1', '');
        WarehouseReceiptLine.MODIFYALL("Bin Code", '');
    end;

    var
        Text029: Label 'Your EAN number is not valid. Its is more than 13.';
        Text030: Label 'Your EAN number is not valid. Its is less than 13.';
        Text031: Label 'Your EAN number is Already Existing.';
}

