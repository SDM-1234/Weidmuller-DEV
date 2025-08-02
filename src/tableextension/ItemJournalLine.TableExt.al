tableextension 50012 ItemJournalLine extends "Item Journal Line"
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


    local procedure CheckIsValidEANandUpdateItem(L_EAN_No: Code[13])
    var
        L_Item: Record Item;
    begin
        IF STRLEN(L_EAN_No) > 13 THEN
            ERROR(Text0029Lbl);
        IF STRLEN(L_EAN_No) < 13 THEN
            ERROR(Text0030Lbl);
        L_Item.RESET();
        L_Item.SETCURRENTKEY("EAN No.");
        L_Item.SETRANGE("EAN No.", L_EAN_No);
        IF L_Item.FINDFIRST() THEN
            VALIDATE("Item No.", L_Item."No.");
    end;

    var
        Text0029Lbl: Label 'Your EAN number is not valid. Its is more than 13.';
        Text0030Lbl: Label 'Your EAN number is not valid. Its is less than 13.';
}

