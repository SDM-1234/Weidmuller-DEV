tableextension 50003 tableextension50003 extends "Sales Invoice Header"
{
    fields
    {

        //Unsupported feature: Property Modification (Editable) on ""GST Bill-to State Code"(Field 16610)".


        //Unsupported feature: Property Modification (Editable) on ""GST Ship-to State Code"(Field 16611)".

        field(50001; "Total No of Boxes"; Integer)
        {
            Description = 'SE-E859';
        }
        field(50002; "Date of Removal"; Date)
        {
            Description = 'SE-E859';
        }
        field(50003; "Total Weight"; Decimal)
        {
            Description = 'SE-E859';
        }
    }
    keys
    {
    }
}

