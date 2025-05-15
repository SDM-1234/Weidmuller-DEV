tableextension 50032 tableextension50032 extends "Sales Line"
{
    fields
    {

        //Unsupported feature: Property Insertion (DecimalPlaces) on ""Line Amount"(Field 103)".


        //Unsupported feature: Property Insertion (Editable) on ""Line Amount"(Field 103)".


        //Unsupported feature: Code Modification on ""No."(Field 6).OnValidate".

        //trigger "(Field 6)()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        TestJobPlanningLine;
        TestStatusOpen;
        CheckItemAvailable(FIELDNO("No."));
        #4..124
                Reserve := SalesHeader.Reserve
              ELSE
                Reserve := Item.Reserve;
              "Unit of Measure Code" := Item."Sales Unit of Measure";
              UpdateGSTPlaceOfSupply(Item."HSN/SAC Code",Item."GST Group Code",Item.Exempted);
              VALIDATE("Price Inclusive of Tax",Item."Price Inclusive of Tax");
              InitDeferralCode;
            END;
          Type::Resource:
            BEGIN
        #135..217
        GetStandardDeduction(SalesHeader);
        "Assessable Value" := Item."Assessable Value" * "Qty. per Unit of Measure" ;
        "Invoice Type" := SalesHeader."Invoice Type";
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        #1..127
             //SE-E859.s
              IF SalesHeader."Document Type"= SalesHeader."Document Type"::Quote THEN BEGIN
                IF SalesHeader."Sell-to Customer No." <> '' THEN
                 IF "No." <> xRec."No." THEN
                   IF "No." <> '' THEN
                    UpdateLatestUnitPrice
                   ELSE BEGIN
                     "Latest UnitPrice" := 0;
                     CLEAR("Latest Invoice Date");
                   END;
              END;
              //SE-E859.e

        #128..131
              IF "Document Type" IN ["Document Type"::Quote,"Document Type"::Order] THEN BEGIN
                IF Item.Notification THEN BEGIN
                 MESSAGE(SpecialInstMsg);
                 Notification := Item.Notification;
                END;
              END;
        #132..220
        //SE-E859.s
        UpdateConfirmShipDate;
        //SE-E859.e
        */
        //end;


        //Unsupported feature: Code Modification on "Quantity(Field 15).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        TestJobPlanningLine;
        TestStatusOpen;

        #4..114

        CALCFIELDS("Reserved Qty. (Base)");
        VALIDATE("Reserved Qty. (Base)");
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        //SE-E859.s
        IF "Document Type" IN ["Document Type"::Order,"Document Type"::Quote] THEN BEGIN
         IF Type=Type::Item THEN BEGIN
          GetItem;
          IF (xRec.Quantity <> Quantity)  THEN
           IF (Item."Order Multiple" <> 0) AND (Quantity >=Item."Order Multiple") THEN BEGIN
            IF (Quantity MOD Item."Order Multiple") <> 0 THEN
             FIELDERROR(Quantity,STRSUBSTNO(Text061,Item."Order Multiple"));
           END ELSE
             FIELDERROR(Quantity,STRSUBSTNO(Text061,Item."Order Multiple"));
         END;
        END;
        //SE-E859.e

        #1..117
        */
        //end;


        //Unsupported feature: Code Modification on ""Unit Price"(Field 22).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        TestJobPlanningLine;
        IF NOT "Price Inclusive of Tax" THEN
          TestStatusOpen;
        VALIDATE("Line Discount %");
        ChkQtyUpdatioAfterDDPLA;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        //>> 1065
        IF ((Rec."Unit Price" > 0) AND (xRec."Unit Price" <> 0)) AND (Rec.Quantity = xRec.Quantity)  THEN
          SalesPriceManagement.UnitPriceChangeValidation(Rec);
        //<< 1065
        #1..5
        */
        //end;


        //Unsupported feature: Code Modification on ""Line Amount"(Field 103).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        TESTFIELD(Type);
        TESTFIELD(Quantity);
        TESTFIELD("Unit Price");
        GetSalesHeader;
        "Line Amount" := ROUND("Line Amount",Currency."Amount Rounding Precision");
        VALIDATE(
          "Line Discount Amount",ROUND(Quantity * "Unit Price",Currency."Amount Rounding Precision") - "Line Amount");
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        #1..4
        //"Line Amount" := ROUND("Line Amount",Currency."Amount Rounding Precision");
        VALIDATE(
          "Line Discount Amount",ROUND(Quantity * "Unit Price",Currency."Amount Rounding Precision") - "Line Amount");
        */
        //end;
        field(50000; "Package No."; Code[20])
        {
        }
        field(50001; Weight; Decimal)
        {
        }
        field(50002; "Confirm Shipping Date"; Date)
        {
            Description = 'SE-E859';
        }
        field(50003; Notification; Boolean)
        {
            Description = 'SE-E859';
        }
        field(50004; "PO No."; Code[35])
        {
            Caption = 'External Document No.';
            Description = 'SE-E859';
        }
        field(50005; "Customer Name"; Text[50])
        {
            CalcFormula = Min (Customer.Name WHERE (No.=FIELD(Sell-to Customer No.)));
            FieldClass = FlowField;
        }
        field(50015;"Latest UnitPrice";Decimal)
        {
            Description = '//SE-E859';
            Editable = false;
        }
        field(50016;"Latest Invoice Date";Date)
        {
            Description = '//SE-E859';
            Editable = false;
        }
        field(50017;"OC No";Code[20])
        {
            Description = '//SE-E859';
        }
        field(50080;MOQ;Decimal)
        {
            CalcFormula = Lookup(Item."Minimum Order Quantity" WHERE (No.=FIELD(No.)));
            Description = 'ZE_LIJO';
            FieldClass = FlowField;
        }
        field(50081;Status;Option)
        {
            DataClassification = ToBeClassified;
            Editable = false;
            OptionCaption = 'Open,Released,Pending Approval,Pending Prepayment';
            OptionMembers = Open,Released,"Pending Approval","Pending Prepayment";
        }
        field(50082;"Payment Terms Code";Code[10])
        {
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
    }


    //Unsupported feature: Code Insertion (VariableCollection) on "OnInsert".

    //trigger (Variable: SalesHeader2)()
    //Parameters and return type have not been exported.
    //begin
        /*
        */
    //end;


    //Unsupported feature: Code Modification on "OnInsert".

    //trigger OnInsert()
    //>>>> ORIGINAL CODE:
    //begin
        /*
        TestStatusOpen;
        GetSalesHeader;
        IF SalesHeader."Free Supply" THEN
        #4..6
          SalesHeader.TESTFIELD("Export or Deemed Export",FALSE);
        END;

        IF Quantity <> 0 THEN
          ReserveSalesLine.VerifyQuantity(Rec,xRec);
        LOCKTABLE;
        #13..15
            ERROR(Text056,SalesHeader."Shipping Advice");
        IF ("Deferral Code" <> '') AND (GetDeferralAmount <> 0) THEN
          UpdateDeferralAmounts;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..9
        IF SalesHeader2.GET("Document Type","Document No.") THEN;
        Status := SalesHeader2.Status;
        "Payment Terms Code" := SalesHeader2."Payment Terms Code";

        "PO No." := SalesHeader."PO No.";
        #10..18
        */
    //end;


    //Unsupported feature: Code Modification on "UpdateAmounts(PROCEDURE 3)".

    //procedure UpdateAmounts();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        IF Type = Type::" " THEN
          EXIT;
        GetSalesHeader;
        #4..8
          LineAmountChanged := TRUE;
        END;
        IF "Line Amount" <> ROUND(Quantity * "Unit Price",Currency."Amount Rounding Precision") - "Line Discount Amount" THEN BEGIN
          "Line Amount" := ROUND(Quantity * "Unit Price",Currency."Amount Rounding Precision") - "Line Discount Amount";
          "VAT Difference" := 0;
          LineAmountChanged := TRUE;
        END;
        #16..75
          UpdateDeferralAmounts;
          LineAmountChanged := FALSE;
        END;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..11
          //"Line Amount" := ROUND(Quantity * "Unit Price",Currency."Amount Rounding Precision") - "Line Discount Amount";//Se-E859
          "Line Amount" := (Quantity * "Unit Price") - "Line Discount Amount";
        #13..78
        */
    //end;


    //Unsupported feature: Code Modification on "CheckItemAvailable(PROCEDURE 4)".

    //procedure CheckItemAvailable();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        IF Reserve = Reserve::Always THEN
          EXIT;

        #4..16
           NOT (Nonstock OR "Special Order")
        THEN BEGIN
          IF ItemCheckAvail.SalesLineCheck(Rec) THEN
            ItemCheckAvail.RaiseUpdateInterruptedError;
        END;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..19
            ItemCheckAvail.RaiseUpdateInterruptedError
          ELSE
           ItemCheckAvail.GetCurrSalesLine(Rec);//SE-E859
        END;
        */
    //end;

    local procedure "*****SE-E859********"()
    begin
    end;

    local procedure UpdateConfirmShipDate()
    begin
        IF "Document Type"= "Document Type"::Quote THEN BEGIN
         IF Type = Type::Item THEN BEGIN
          IF (SalesHeader."Posting Date"<> 0D) THEN BEGIN
           GetItem;
           VALIDATE("Confirm Shipping Date",CALCDATE(Item."Lead Time Calculation",SalesHeader."Posting Date"));
          END ELSE
           VALIDATE("Confirm Shipping Date",WORKDATE);
         END;
        END ELSE
         IF "Document Type"= "Document Type"::Order THEN
          IF Type = Type::Item THEN
           VALIDATE("Confirm Shipping Date",WORKDATE);
    end;

    local procedure UpdateLatestUnitPrice()
    var
        ItemLedgerEntry: Record "32";
    begin
        ItemLedgerEntry.RESET;
        ItemLedgerEntry.SETCURRENTKEY("Document Type","Source Type","Source No.","Item No.");
        ItemLedgerEntry.SETRANGE("Document Type",ItemLedgerEntry."Document Type"::"Sales Shipment");
        ItemLedgerEntry.SETRANGE("Source Type",ItemLedgerEntry."Source Type"::Customer);
        ItemLedgerEntry.SETRANGE("Source No.",SalesHeader."Sell-to Customer No.");
        ItemLedgerEntry.SETRANGE("Item No.","No.");
        IF ItemLedgerEntry.FINDLAST THEN BEGIN
          ItemLedgerEntry.CALCFIELDS("Sales Amount (Actual)");
          IF ABS(ItemLedgerEntry.Quantity) <> 0 THEN
           "Latest UnitPrice" := (ItemLedgerEntry."Sales Amount (Actual)"/ ABS(ItemLedgerEntry.Quantity))
          ELSE
           "Latest UnitPrice" := 0;
          "Latest Invoice Date" := ItemLedgerEntry."Posting Date";
        END;
    end;

    var
        SalesHeader2: Record "36";

    var
        Text061: Label 'must be Multiple of %1';

    var
        SpecialInstMsg: Label 'Special Instruction';

    var
        SalesPriceManagement: Codeunit "50007";
}

