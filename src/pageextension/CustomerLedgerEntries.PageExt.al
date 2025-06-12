pageextension 50036 CustomerLedgerEntries extends "Customer Ledger Entries"
{
    layout
    {
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

