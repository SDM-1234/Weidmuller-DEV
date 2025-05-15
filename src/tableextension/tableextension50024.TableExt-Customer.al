tableextension 50024 tableextension50024 extends Customer
{
    fields
    {

        //Unsupported feature: Code Modification on "Name(Field 2).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        IF ("Search Name" = UPPERCASE(xRec.Name)) OR ("Search Name" = '') THEN
          "Search Name" := Name;
        IF Name <> xRec.Name THEN
          UpdatePartyName;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        #1..4

        //ZT0207 06.05.2020
        //++
        IF "E-Mail" = '' THEN
          ERROR('Kindly enter Customer mail');
        //--
        */
        //end;


        //Unsupported feature: Code Insertion on ""Customer Posting Group"(Field 21)".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //begin
        /*
        IF "Customer Posting Group" = 'LOCAL' THEN
          "Currency Code" := 'INR';


        */
        //end;


        //Unsupported feature: Code Insertion on ""Currency Code"(Field 22)".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //begin
        /*
        //ZE.RSF.373
        IF ("Customer Posting Group" = 'LOCAL') OR ("Customer Posting Group" = 'EMPLOYEE') THEN
          TESTFIELD("Currency Code",'INR');

        IF "Currency Code" = 'INR' THEN
          TESTFIELD("Customer Posting Group",'LOCAL|EMPOYEE')
        //ZE.RSF.373
        */
        //end;


        //Unsupported feature: Code Insertion on ""E-Mail"(Field 102)".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //begin
        /*
        //ZT0207 15.05.2020
        //++
        MailManagement.CheckValidEmailAddress("E-Mail");
        //--
        */
        //end;
        field(50000; "No. of Industry Segments"; Integer)
        {
            CalcFormula = Count ("Industry Segment" WHERE (Customer No.=FIELD(No.)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50001;"Invoice Print Check";Boolean)
        {
            DataClassification = ToBeClassified;
            Description = 'E963 To Restrict Multiple Sales Shpmnt Selection from Sales Invoice';
        }
        field(50002;Freight;Boolean)
        {
            DataClassification = ToBeClassified;
            Description = 'SE_E969';
        }
        field(50003;"Freight GL Account";Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'SE_E969';
            TableRelation = "G/L Account" WHERE (Direct Posting=CONST(Yes),
                                                 Account Type=CONST(Posting),
                                                 Blocked=CONST(No));
        }
    }


    //Unsupported feature: Code Modification on "CheckBlockedCustOnDocs(PROCEDURE 5)".

    //procedure CheckBlockedCustOnDocs();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        WITH Cust2 DO BEGIN
          IF "Privacy Blocked" THEN
            CustPrivacyBlockedErrorMessage(Cust2,Transaction);

          IF ((Blocked = Blocked::All) OR
              ((Blocked = Blocked::Invoice) AND (DocType IN [DocType::Quote,DocType::Order,DocType::Invoice,DocType::"Blanket Order"])) OR
              ((Blocked = Blocked::Ship) AND (DocType IN [DocType::Quote,DocType::Order,DocType::"Blanket Order"]) AND
               (NOT Transaction)) OR
              ((Blocked = Blocked::Ship) AND (DocType IN [DocType::Quote,DocType::Order,DocType::Invoice,DocType::"Blanket Order"]) AND
               Shipment AND Transaction))
          THEN
            CustBlockedErrorMessage(Cust2,Transaction);
        END;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        //SE-E859.s
        #1..5
              ((Blocked = Blocked::Invoice) AND (DocType IN [DocType::Quote,DocType::Order,DocType::Invoice,DocType::"Blanket Order"]) AND (NOT SetBlockParameterFromDocsValue)) OR
              ((Blocked = Blocked::Ship) AND (DocType IN [DocType::Quote,DocType::Order,DocType::"Blanket Order"]) AND
               (NOT Transaction) AND (NOT SetBlockParameterFromDocsValue)) OR
              ((Blocked = Blocked::Ship) AND (DocType IN [DocType::Quote,DocType::Order,DocType::Invoice,DocType::"Blanket Order"]) AND
               Shipment AND Transaction) AND (NOT SetBlockParameterFromDocsValue))
          THEN
            CustBlockedErrorMessage(Cust2,Transaction);
         END;
        //SE-E859.e
        */
    //end;


    //Unsupported feature: Code Modification on "CheckBlockedCustOnJnls(PROCEDURE 7)".

    //procedure CheckBlockedCustOnJnls();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        WITH Cust2 DO BEGIN
          IF "Privacy Blocked" THEN
            CustPrivacyBlockedErrorMessage(Cust2,Transaction);

          IF (Blocked = Blocked::All) OR
             ((Blocked = Blocked::Invoice) AND (DocType IN [DocType::Invoice,DocType::" "]))
          THEN
            CustBlockedErrorMessage(Cust2,Transaction)
        END;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..5
             ((Blocked = Blocked::Invoice) AND (DocType IN [DocType::Invoice]))//,DocType::" " //ZE.RSF.540|627

        #7..9
        */
    //end;

    local procedure "****SE-E859******"()
    begin
    end;

    procedure SetBlockParameterFromDocs()
    begin
        SetBlockParameterFromDocsValue := TRUE;
    end;

    var
        SetBlockParameterFromDocsValue: Boolean;

    var
        MailManagement: Codeunit "9520";
}

