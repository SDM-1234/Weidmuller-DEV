tableextension 50003 SalesInvoiceHeader extends "Sales Invoice Header"
{
    fields
    {

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

