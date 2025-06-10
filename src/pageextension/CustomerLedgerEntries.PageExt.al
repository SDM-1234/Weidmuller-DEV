pageextension 50036 pageextension50036 extends "Customer Ledger Entries"
{
    layout
    {
        addafter("Control 8")
        {
            field("Customer Name"; CustName)
            {
            }
        }
    }

    var
        Cust: Record "18";
        CustName: Text[50];


        //Unsupported feature: Code Modification on "OnAfterGetRecord".

        //trigger OnAfterGetRecord()
        //>>>> ORIGINAL CODE:
        //begin
        /*
        StyleTxt := SetStyle;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        StyleTxt := SetStyle;
        CLEAR(CustName);
        Cust.GET("Customer No.");
        CustName := Cust.Name;
        */
        //end;
}

