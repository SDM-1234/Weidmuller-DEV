tableextension 50004 SalesInvoiceLine extends "Sales Invoice Line"
{
    fields
    {
        field(50017; "OC No"; Code[20])
        {
            Description = '//SE-E859';
        }
        field(50070; "Bill-to Customer Name"; Text[100])
        {
            CalcFormula = Lookup(Customer.Name WHERE("No." = FIELD("Bill-to Customer No.")));
            Caption = 'Bill-to Customer Name';
            Description = 'ZT0207';
            FieldClass = FlowField;
        }
    }
}

