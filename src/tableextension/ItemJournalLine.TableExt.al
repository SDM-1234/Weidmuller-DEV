tableextension 50055 tableextension50055 extends "Item Journal Line"
{
    fields
    {
        field(50000; "EAN No."; Code[13])
        {
            Description = 'SE-SE859';

            trigger OnValidate()
            begin
                //SE-E859.s
                IF "EAN No." <> xRec."EAN No." THEN
                    CheckIsValidEANandUpdateItem("EAN No.");
                //SE-E859.e
            end;
        }
    }

    local procedure "*****SE-E859*****"()
    begin
    end;

    local procedure CheckIsValidEANandUpdateItem(L_EAN_No: Code[13])
    var
        L_Item: Record "27";
    begin
        IF STRLEN(L_EAN_No) > 13 THEN
            ERROR(Text0029);
        IF STRLEN(L_EAN_No) < 13 THEN
            ERROR(Text0030);
        L_Item.RESET;
        L_Item.SETCURRENTKEY("EAN No.");
        L_Item.SETRANGE("EAN No.", L_EAN_No);
        IF L_Item.FINDFIRST THEN
            VALIDATE("Item No.", L_Item."No.");
    end;

    var
        Text0029: Label 'Your EAN number is not valid. Its is more than 13.';
        Text0030: Label 'Your EAN number is not valid. Its is less than 13.';
}

