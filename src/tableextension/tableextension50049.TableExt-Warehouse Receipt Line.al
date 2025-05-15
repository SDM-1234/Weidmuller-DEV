tableextension 50049 tableextension50049 extends "Warehouse Receipt Line"
{
    fields
    {
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
        field(50001; "Total No of Boxes"; Integer)
        {
            Description = 'SE-E859';
        }
    }
    keys
    {
        key(Key1; "EAN No.")
        {
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

    var
        Text029: Label 'Your EAN number is not valid. Its is more than 13.';
        Text030: Label 'Your EAN number is not valid. Its is less than 13.';
        Text031: Label 'Your EAN number is Already Existing.';
}

