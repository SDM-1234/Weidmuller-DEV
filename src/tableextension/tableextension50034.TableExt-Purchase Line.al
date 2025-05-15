tableextension 50034 tableextension50034 extends "Purchase Line"
{
    fields
    {

        //Unsupported feature: Property Modification (Editable) on ""GST Group Type"(Field 16602)".


        //Unsupported feature: Property Modification (Editable) on ""GST Jurisdiction Type"(Field 16609)".


        //Unsupported feature: Code Modification on ""No."(Field 6).OnValidate".

        //trigger "(Field 6)()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        TestStatusOpen;
        TESTFIELD("Qty. Rcd. Not Invoiced",0);
        TESTFIELD("Quantity Received",0);
        #4..91
          Exempted := TRUE;
        UpdateLeadTimeFields;
        UpdateDates;

        CASE Type OF
          Type::" ":
        #98..283
          END;
        END;
        "Assessable Value" := Item."Assessable Value" * "Qty. per Unit of Measure" ;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        #1..94
        "Order Address Code" := PurchHeader."Order Address Code";
        "Buy-From GST Registration No" := PurchHeader."Vendor GST Reg. No.";
        #95..286
        */
        //end;


        //Unsupported feature: Code Modification on ""GST Group Code"(Field 16601).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        TestStatusOpen;
        TESTFIELD("Work Tax Nature Of Deduction",'');
        TESTFIELD("Non-GST Line",FALSE);
        #4..22
            TESTFIELD("GST Assessable Value",0);
            END;
        END;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*

        #1..25
        */
        //end;


        //Unsupported feature: Code Modification on ""Custom Duty Amount"(Field 16611).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        GetPurchHeader;
        IF NOT GSTManagement.IsGSTApplicable(PurchHeader.Structure) THEN
          EXIT;
        #4..7
          ERROR(GSTVendorTypeErr,Vendor."GST Vendor Type"::Import,Vendor."GST Vendor Type"::SEZ);
        IF ("GST Group Type" <> "GST Group Type"::Goods) OR (Type = Type::"Charge (Item)") THEN
          TESTFIELD("Custom Duty Amount",0);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*

        #1..10
        */
        //end;
        field(50000; Weight; Decimal)
        {
            Description = 'SE-E859';
        }
        field(50001; "Demand Order No."; Code[20])
        {
            Caption = 'Demand Order No.';
            Description = 'SE-E859';
            Editable = false;
        }
    }
    keys
    {
    }


    //Unsupported feature: Code Modification on "CalculateStructures(PROCEDURE 1280003)".

    //procedure CalculateStructures();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    WITH PurchHeader DO BEGIN
      Currency.Initialize("Currency Code");
      IF "Currency Code" <> '' THEN BEGIN
    #4..335
          PurchHeader."Document Type",PurchHeader."No.",CFactor,Currency."Amount Rounding Precision");
      END;
    END;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*

    #1..338
    */
    //end;


    //Unsupported feature: Code Modification on "UpdateGSTAmounts(PROCEDURE 1500025)".

    //procedure UpdateGSTAmounts();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    IF ("Line No." = 0) OR "Non-GST Line" THEN BEGIN
      VALIDATE("GST Base Amount",0);
      EXIT;
    #4..103
              "Currency Code",PurchHeader1."Currency Factor","Unit Cost",Item,Quantity,"Unit of Measure Code","No.");
      END;
    END;
    IF (PurchHeader1."GST Vendor Type" IN
        [PurchHeader1."GST Vendor Type"::Composite,PurchHeader1."GST Vendor Type"::Exempted]) OR Exempted OR
       PurchHeader1."RCM Exempt"
    THEN
     TotalGST := 0;
    "Total GST Amount" := TotalGST;
    IF GSTBaseAmount <> 0 THEN
      "GST %" := "Total GST Amount" / GSTBaseAmount * 100;
    GLSetup.GET;
    "GST Base Amount" := GSTBaseAmount;
    "GST Jurisdiction Type" := GSTJurisdiction;
    GSTManagement.DeleteGSTCalculationBuffer(TransactionType::Purchase,"Document Type","Document No.","Line No.");
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..106

    #107..110

    #111..118
    */
    //end;
}

