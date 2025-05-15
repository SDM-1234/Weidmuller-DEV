tableextension 50001 tableextension50001 extends "Sales Shipment Header"
{
    fields
    {

        //Unsupported feature: Property Modification (Editable) on ""Currency Code"(Field 32)".

        field(50000; "Package No."; Code[20])
        {
        }
        field(50001; "Total No of Boxes"; Integer)
        {
            Description = 'SE-E859';
        }
        field(50005; "WarehouseShip No."; Code[20])
        {
            Description = 'SE-E859';
        }
    }
}

