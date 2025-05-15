tableextension 50007 tableextension50007 extends "Purch. Rcpt. Line"
{
    fields
    {
        field(50000; Weight; Decimal)
        {
            Description = 'SE-E859';
        }
        field(50002; "Total No of Boxes"; Integer)
        {
            Description = 'SE-E859';
        }
        field(50003; "Vendor Ship No."; Code[30])
        {
            CalcFormula = Min ("Purch. Rcpt. Header"."Vendor Shipment No." WHERE (No.=FIELD(Document No.)));
            FieldClass = FlowField;
        }
    }
}

