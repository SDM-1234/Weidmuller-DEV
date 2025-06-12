tableextension 50005 SalesCrMemoLine extends "Sales Cr.Memo Line"
{
    fields
    {
        field(50070; "Bill-to Customer Name"; Text[100])
        {
            CalcFormula = Lookup(Customer.Name WHERE("No." = FIELD("Bill-to Customer No.")));
            Caption = 'Bill-to Customer Name';
            Description = 'ZT0207';
            FieldClass = FlowField;
        }
    }
}

