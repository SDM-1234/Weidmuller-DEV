tableextension 50011 tableextension50011 extends "Purch. Cr. Memo Line"
{
    fields
    {
        field(50070; "Buy-from Vendor Name"; Text[50])
        {
            CalcFormula = Lookup (Vendor.Name WHERE (No.=FIELD(Buy-from Vendor No.)));
            Caption = 'Buy-from Vendor Name';
            Description = 'ZT0207';
            FieldClass = FlowField;
        }
    }
}

