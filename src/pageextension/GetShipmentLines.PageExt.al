pageextension 50083 GetShipmentLines extends "Get Shipment Lines"
{
    layout
    {
        addafter(Control1)
        {
            field("Order No."; rec."Order No.")
            {
                ToolTip = 'Specifies the value of the Order No. field.';
                ApplicationArea = All;
            }
        }
    }
}

