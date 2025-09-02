pageextension 50057 SalesOrderSubform extends "Sales Order Subform"
{
    layout
    {
        modify("No.")
        {
            Caption = 'Article No';
            ToolTip = 'Specifies the article number of the item.';
            ApplicationArea = All;
        }
        addafter("No.")
        {
            field(Inventory; InventoryStock)
            {
                Caption = 'Inventory';
                Editable = false;
                ToolTip = 'Specifies the inventory of the item.';
                ApplicationArea = All;
            }
        }
        addafter("IC Partner Code")
        {
            field(Status; Rec.Status)
            {
                Caption = 'Status';
                ToolTip = 'Specifies the status of the sales order line.';
                ApplicationArea = All;
            }
            field("Payment Terms Code"; Rec."Payment Terms Code")
            {
                Caption = 'Payment Terms Code';
                ToolTip = 'Specifies the payment terms code for the sales order line.';
                ApplicationArea = All;
            }
        }
        modify("Unit Price")
        {
            Caption = 'Unit Price';
            ToolTip = 'Specifies the unit price of the item.';
            ApplicationArea = All;
            Editable = IsEdiableUnitPrice;
        }
        modify("Line Amount")
        {
            Caption = 'Line Amount';
            ToolTip = 'Specifies the total amount of the sales order line.';
            ApplicationArea = All;
            Editable = false;
        }
        addlast(Control1)
        {
            field("Profit %"; Rec."Profit %")
            {
                Caption = 'Profit %';
                ToolTip = 'Specifies the profit percentage for the sales order line.';
                ApplicationArea = All;
            }
            field("Confirm Shipping Date"; Rec."Confirm Shipping Date")
            {
                Caption = 'Confirm Shipping Date';
                ToolTip = 'Specifies the date when the shipping is confirmed.';
                ApplicationArea = All;
            }
            field("PO No."; Rec."PO No.")
            {
                Caption = 'PO No.';
                ToolTip = 'Specifies the purchase order number for the sales order.';
                ApplicationArea = All;
            }
        }
    }

    var
        Item: Record Item;
        SH: Record "Sales Header";
        SalesPriceManagement: Codeunit "Sales Price Management";
        IsEdiableUnitPrice: Boolean;
        InventoryStock: Decimal;


    trigger OnAfterGetRecord()
    begin
        CLEAR(InventoryStock);
        IF Item.GET(Rec."No.") THEN BEGIN
            Item.CALCFIELDS(Inventory);
            InventoryStock := Item.Inventory;
        END;
        IF NOT SH.GET(Rec."Document Type", Rec."Document No.") THEN
            IsEdiableUnitPrice := FALSE
        ELSE
            IsEdiableUnitPrice := SalesPriceManagement.SpecialPrice(SH."Transaction Type");
    end;
}

