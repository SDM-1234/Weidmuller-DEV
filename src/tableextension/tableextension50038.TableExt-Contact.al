tableextension 50038 tableextension50038 extends Contact
{
    fields
    {

        //Unsupported feature: Code Modification on ""Company No."(Field 5051).OnValidate".

        //trigger "(Field 5051)()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        IF "Company No." = xRec."Company No." THEN
          EXIT;

        #4..36
            ContBusRel.SETCURRENTKEY("Link to Table","No.");
            ContBusRel.SETRANGE("Link to Table",ContBusRel."Link to Table"::Customer);
            ContBusRel.SETRANGE("Contact No.",xRec."Company No.");
            SalesHeader.SETCURRENTKEY("Sell-to Customer No.","External Document No.");
            SalesHeader.SETRANGE("Sell-to Contact No.","No.");
            IF ContBusRel.FINDFIRST THEN
              SalesHeader.SETRANGE("Sell-to Customer No.",ContBusRel."No.")
        #44..76
          IF CurrFieldNo <> 0 THEN
            MODIFY;
        END;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        #1..39
            SalesHeader.SETCURRENTKEY("Sell-to Customer No.","PO No.");
        #41..79
        */
        //end;
        field(50000; "Resigned - Left Company"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }
}

