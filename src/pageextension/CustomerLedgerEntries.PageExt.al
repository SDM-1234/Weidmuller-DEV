pageextension 50037 CustomerLedgerEntries extends "Customer Ledger Entries"
{
    layout
    {
        addafter("Customer Name")
        {

            field(CustName; CustName)
            {
                ApplicationArea = All;
            }
        }
    }


    var
        Cust: Record Customer;
        CustName: Text[100];

    trigger OnAfterGetRecord()
    begin
        StyleTxt := Rec.SetStyle();
        CLEAR(CustName);
        Cust.GET(Rec."Customer No.");
        CustName := Cust.Name;

    end;

}

