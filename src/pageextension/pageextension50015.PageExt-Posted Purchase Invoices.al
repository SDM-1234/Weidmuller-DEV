pageextension 50015 pageextension50015 extends "Posted Purchase Invoices"
{
    layout
    {
        addafter("Control 35")
        {
            field("Currency Factor"; "Currency Factor")
            {
            }
        }
        addafter("Control 13")
        {
            field("Amount(LCY)"; AmountLCY)
            {
                Caption = 'Amount(LCY)';
            }
        }
        addafter("Control 1102601011")
        {
            field("Vendor Invoice No."; "Vendor Invoice No.")
            {
            }
        }
    }

    var
        AmountLCY: Decimal;


        //Unsupported feature: Code Insertion on "OnAfterGetRecord".

        //trigger OnAfterGetRecord()
        //begin
        /*
        //ZE_LIJO 08.08.2019
        //++
        CALCFIELDS(Amount);
        IF "Currency Factor"<>0 THEN
          AmountLCY:=(1/"Currency Factor")*Amount
        ELSE
          AmountLCY:=Amount;
        //--
        */
        //end;
}

