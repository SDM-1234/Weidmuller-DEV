tableextension 50027 tableextension50027 extends Item
{
    fields
    {

        //Unsupported feature: Code Modification on ""No."(Field 1).OnValidate".

        //trigger "(Field 1)()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        IF "No." <> xRec."No." THEN BEGIN
          GetInvtSetup;
          NoSeriesMgt.TestManual(InvtSetup."Item Nos.");
          "No. Series" := '';
        END;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*

        #1..5
        */
        //end;
        field(50000; "EAN No."; Code[13])
        {
            Description = 'SE-E859';

            trigger OnValidate()
            begin
                //SE-E859.s
                IF "EAN No." <> '' THEN
                    CheckIsValidEAN("EAN No.");
                //SE-E859.e
            end;
        }
        field(50001; "Marketing Status"; Code[20])
        {
            Description = 'SE-E859';
        }
        field(50002; Notification; Boolean)
        {
            Description = 'SE-E859';
        }
        field(50003; "Inv Below Safety Qty"; Boolean)
        {
            DataClassification = ToBeClassified;
            Description = 'SE - -E963';
        }
        field(50004; "Inventory-Nippon"; Decimal)
        {
            CalcFormula = Sum ("Item Ledger Entry".Quantity WHERE (Item No.=FIELD(No.),
                                                                  Global Dimension 1 Code=FIELD(Global Dimension 1 Filter),
                                                                  Global Dimension 2 Code=FIELD(Global Dimension 2 Filter),
                                                                  Location Code=CONST(NIPPON),
                                                                  Drop Shipment=FIELD(Drop Shipment Filter),
                                                                  Variant Code=FIELD(Variant Filter),
                                                                  Lot No.=FIELD(Lot No. Filter),
                                                                  Serial No.=FIELD(Serial No. Filter)));
            Caption = 'Inventory-Nippon';
            Description = 'ZE_LIJO';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50005;"Inventory-Quarantine";Decimal)
        {
            CalcFormula = Sum("Item Ledger Entry".Quantity WHERE (Item No.=FIELD(No.),
                                                                  Global Dimension 1 Code=FIELD(Global Dimension 1 Filter),
                                                                  Global Dimension 2 Code=FIELD(Global Dimension 2 Filter),
                                                                  Location Code=CONST(QR - NE),
                                                                  Drop Shipment=FIELD(Drop Shipment Filter),
                                                                  Variant Code=FIELD(Variant Filter),
                                                                  Lot No.=FIELD(Lot No. Filter),
                                                                  Serial No.=FIELD(Serial No. Filter)));
            Caption = 'Inventory-Quarantine';
            Description = 'ZE_LIJO';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50006;"Item Type";Option)
        {
            Caption = 'Item Type';
            DataClassification = ToBeClassified;
            Description = 'ZE_LIJO';
            OptionCaption = ' ,MRP1,MRP2,Slow moving, Non-moving, Obsolete';
            OptionMembers = " ",MRP1,MRP2,"Slow moving"," Non-moving"," Obsolete";
        }
    }
    keys
    {
        key(Key1;"EAN No.")
        {
        }
    }


    //Unsupported feature: Code Insertion (VariableCollection) on "OnRename".

    //trigger (Variable: ItemUnitofMeasure)()
    //Parameters and return type have not been exported.
    //begin
        /*
        */
    //end;

    local procedure "*****SE-E859*****"()
    begin
    end;

    local procedure CheckIsValidEAN(L_EAN_No: Code[13])
    var
        L_Item: Record "27";
    begin
        IF STRLEN(L_EAN_No) > 13  THEN
          ERROR(Text029);
        IF STRLEN(L_EAN_No) < 13 THEN
          ERROR(Text030);
        
        //ZE_LIJO 02.12.2019
        /*
                  L_Item.RESET;
                  L_Item.SETCURRENTKEY("EAN No.");
                  L_Item.SETRANGE("EAN No.",L_EAN_No);
                  IF NOT L_Item.ISEMPTY THEN
                    ERROR(Text031);
        */

    end;

    var
        ItemUnitofMeasure: Record "5404";

    var
        Text029: Label 'Your EAN number is not valid. Its is more than 13.';
        Text030: Label 'Your EAN number is not valid. Its is less than 13.';
        Text031: Label 'Your EAN number is Already Existing.';
}

