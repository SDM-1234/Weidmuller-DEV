tableextension 50057 tableextension50057 extends "Finance Cue"
{
    fields
    {
        field(32; "Pending Tasks"; Integer)
        {
            CalcFormula = Count ("User Task" WHERE (Assigned To User Name=FIELD(User ID Filter),
                                                   Percent Complete=FILTER(<>100)));
            Caption = 'Pending Tasks';
            FieldClass = FlowField;
        }
    }
}

