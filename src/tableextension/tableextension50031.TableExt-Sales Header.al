tableextension 50031 tableextension50031 extends "Sales Header"
{
    fields
    {

        //Unsupported feature: Property Modification (Name) on ""External Document No."(Field 100)".


        //Unsupported feature: Property Modification (Editable) on "Status(Field 120)".


        //Unsupported feature: Code Modification on ""Bill-to Customer No."(Field 4).OnValidate".

        //trigger "(Field 4)()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        TESTFIELD(Status,Status::Open);
        BilltoCustomerNoChanged := xRec."Bill-to Customer No." <> "Bill-to Customer No.";
        GetCust("Bill-to Customer No.");
        #4..68
          END;

        GetCust("Bill-to Customer No.");
        Cust.CheckBlockedCustOnDocs(Cust,"Document Type",FALSE,FALSE);
        Cust.TESTFIELD("Customer Posting Group");
        CheckCrLimit;
        #75..106

        "Bill-to IC Partner Code" := Cust."IC Partner Code";
        "Send IC Document" := ("Bill-to IC Partner Code" <> '') AND ("IC Direction" = "IC Direction"::Outgoing);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        #1..71
        //SE-E859.s
        IF Cust.Blocked IN[Cust.Blocked::Ship,Cust.Blocked::Invoice] THEN
          Cust.SetBlockParameterFromDocs;
        //SE-E859.e
        #72..109
        */
        //end;


        //Unsupported feature: Code Modification on ""Posting Date"(Field 20).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        TestNoSeriesDate(
          "Posting No.","Posting No. Series",
          FIELDCAPTION("Posting No."),FIELDCAPTION("Posting No. Series"));
        #4..7
          "Prepmt. Cr. Memo No.","Prepmt. Cr. Memo No. Series",
          FIELDCAPTION("Prepmt. Cr. Memo No."),FIELDCAPTION("Prepmt. Cr. Memo No. Series"));

        IF "Incoming Document Entry No." = 0 THEN
          VALIDATE("Document Date","Posting Date");

        IF ("Document Type" IN ["Document Type"::Invoice,"Document Type"::"Credit Memo"]) AND
           NOT ("Posting Date" = xRec."Posting Date")
        #16..27
        SynchronizeAsmHeader;
        UpdateSalesLines(FIELDCAPTION("Posting Date"),CurrFieldNo <> 0);
        UpdateGenJnlLInePostingDate;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        #1..10
        //>> ZE.SAGAR T932 26092023
        //IF "Incoming Document Entry No." = 0 THEN
        //VALIDATE("Document Date","Posting Date");
        IF ("Incoming Document Entry No." = 0) AND ("Document Type" <> "Document Type"::Order) THEN
          VALIDATE("Document Date","Posting Date");
        //<< ZE.SAGAR T932 26092023
        #13..30
        */
        //end;


        //Unsupported feature: Code Modification on ""Transaction Type"(Field 76).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        UpdateSalesLines(FIELDCAPTION("Transaction Type"),FALSE);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        UpdateSalesLines(FIELDCAPTION("Transaction Type"),FALSE);
        SalesPriceManagement.ConfirmTransactionType(Rec,xRec);//1065
        */
        //end;


        //Unsupported feature: Code Insertion on ""PO No."(Field 100)".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //begin
        /*
        IF ("Document Type" IN ["Document Type"::Quote,"Document Type"::Order]) AND
           NOT ("PO No." = xRec."PO No.")
        THEN
         UpdatePoNo;
        */
        //end;
        field(50001; "Total No of Boxes"; Integer)
        {
        }
        field(50002; "Date of Removal"; Date)
        {
            Description = 'SE-E859';
        }
        field(50003; "Total Weight"; Decimal)
        {
            Description = 'SE-E859';
        }
        field(50004; "Enquiry No."; Code[20])
        {
            Description = 'SE-E859';
        }
        field(50080; Validity; Date)
        {
            DataClassification = ToBeClassified;
            Description = 'SE_LIJO';
        }
    }
    keys
    {

        //Unsupported feature: Deletion (KeyCollection) on ""Sell-to Customer No.,External Document No."(Key)".

        key(Key1; "Sell-to Customer No.", "PO No.")
        {
        }
    }


    //Unsupported feature: Code Insertion (VariableCollection) on "OnDelete".

    //trigger (Variable: SalesLine2)()
    //Parameters and return type have not been exported.
    //begin
    /*
    */
    //end;


    //Unsupported feature: Code Insertion on "OnModify".

    //trigger OnModify()
    //var
    //SalesLine2: Record "37";
    //begin
    /*

    SalesLine2.SETCURRENTKEY("Document Type","Document No.","Line No.");
    SalesLine2.SETRANGE("Document Type","Document Type");
    SalesLine2.SETRANGE("Document No.","No.");
    IF SalesLine2.FINDFIRST THEN
      REPEAT
        SalesLine2.VALIDATE(Status,Status);
        SalesLine2.VALIDATE("Payment Terms Code","Payment Terms Code");
        SalesLine2.MODIFY;
      UNTIL SalesLine2.NEXT = 0;
    */
    //end;


    //Unsupported feature: Code Modification on "InitSellToCustFromCustomer(PROCEDURE 1500010)".

    //procedure InitSellToCustFromCustomer();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    WITH SalesHeader DO BEGIN
      Cust.CheckBlockedCustOnDocs(Cust,"Document Type",FALSE,FALSE);
      Cust.TESTFIELD("Gen. Bus. Posting Group");
      "Sell-to Customer Template Code" := '';
    #5..31
      CheckShipToCustomer;
      CheckShipToCode;
    END;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    WITH SalesHeader DO BEGIN
      //SE-E859.s
      IF Cust.Blocked IN[Cust.Blocked::Ship,Cust.Blocked::Invoice] THEN
       Cust.SetBlockParameterFromDocs;
      //SE-E859.e
    #2..34
    */
    //end;

    procedure UpdatePoNo()
    var
        SalesHeader: Record "36";
        SONo: array[10] of Code[10];
        i: Integer;
    begin
        SalesHeader.SETRANGE("Document Type", SalesHeader."Document Type"::Order);
        SalesHeader.SETRANGE("PO No.", "PO No.");
        i := 1;
        IF SalesHeader.FINDFIRST THEN
            REPEAT
                SONo[i] := SalesHeader."No.";
                i += 1;
            UNTIL SalesHeader.NEXT = 0;
        IF i > 1 THEN
            MESSAGE('Customer PO is already available with %1 %2 %3 OC', SONo[1], SONo[2], SONo[3]);


        IF NOT SalesLinesExist THEN
            EXIT;
        SalesLine.RESET;
        SalesLine.SETRANGE("Document Type", "Document Type");
        SalesLine.SETRANGE("Document No.", "No.");
        IF SalesLine.FINDSET THEN
            REPEAT
                SalesLine."PO No." := "PO No.";
                SalesLine.MODIFY;
            UNTIL SalesLine.NEXT = 0;
    end;

    var
        SalesLine2: Record "37";

    var
        SalesPriceManagement: Codeunit "50007";
}

