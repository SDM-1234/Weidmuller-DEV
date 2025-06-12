tableextension 50031 SalesHeader extends "Sales Header"
{
    fields
    {

        modify("Transaction Type")
        {
            trigger OnAfterValidate()
            var
            //SalesPriceManagement: Codeunit "50007";
            begin
                //SalesPriceManagement.ConfirmTransactionType(Rec, xRec);//1065
            end;
        }


        modify("External Document No.")
        {
            trigger OnBeforeValidate()
            var
                SalesHeader: Record "Sales Header";
                i: Integer;
                SONo: array[10] of Code[20];
            begin


                SalesHeader.SETRANGE("Document Type", SalesHeader."Document Type"::Order);
                SalesHeader.SETRANGE("External Document No.", "External Document No.");
                i := 1;
                IF SalesHeader.FindSet() THEN
                    REPEAT
                        SONo[i] := SalesHeader."No.";
                        i += 1;
                    UNTIL SalesHeader.NEXT() = 0;
                IF i > 1 THEN
                    MESSAGE('Customer PO is already available with %1 %2 %3 OC', SONo[1], SONo[2], SONo[3]);

                IF ("Document Type" IN ["Document Type"::Quote, "Document Type"::Order]) AND
                  NOT ("External Document No." = xRec."External Document No.") THEN
                    UpdatePoNo();

            end;
        }
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
        key(SK1; "Sell-to Customer No.", "External Document No.")
        {
        }
    }



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
    begin
        IF NOT SalesLinesExist() THEN
            EXIT;
        SalesLine.RESET();
        SalesLine.SETRANGE("Document Type", "Document Type");
        SalesLine.SETRANGE("Document No.", "No.");
        IF SalesLine.FINDSET() THEN
            REPEAT
                SalesLine."PO No." := "External Document No.";
                SalesLine.MODIFY();
            UNTIL SalesLine.NEXT() = 0;
    end;

}

