tableextension 50009 tableextension50009 extends "Purch. Inv. Line"
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

