page 50017 "Sales Register -GST Audit"
{
    AutoSplitKey = true;
    Caption = 'Sales Register -GST Audit';
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    LinksAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = Table113;
    SourceTableView = WHERE (Type = FILTER (<> ' '));

    layout
    {
        area(content)
        {
            repeater()
            {
                field("Document No."; "Document No.")
                {
                    Caption = 'Invoice No.';
                }
                field("Posting Date"; "Posting Date")
                {
                }
                field(CustomerNo; "Bill-to Customer No.")
                {
                    Caption = 'Customer No.';
                }
                field(CustomerName; "Bill-to Customer Name")
                {
                    Caption = 'Customer Name';
                }
                field(Type; Type)
                {
                }
                field("No."; "No.")
                {
                }
                field("Cross-Reference No."; "Cross-Reference No.")
                {
                    Visible = false;
                }
                field("IC Partner Code"; "IC Partner Code")
                {
                    Visible = false;
                }
                field("Variant Code"; "Variant Code")
                {
                    Visible = false;
                }
                field(Description; Description)
                {
                }
                field("Return Reason Code"; "Return Reason Code")
                {
                    Visible = false;
                }
                field(Quantity; Quantity)
                {
                    BlankZero = true;
                }
                field("Unit of Measure Code"; "Unit of Measure Code")
                {
                }
                field("Unit of Measure"; "Unit of Measure")
                {
                    Visible = false;
                }
                field("Unit Cost (LCY)"; "Unit Cost (LCY)")
                {
                    Visible = false;
                }
                field("OC No"; "OC No")
                {
                }
                field("Unit Price"; "Unit Price")
                {
                    BlankZero = true;
                }
                field("Line Amount"; "Line Amount")
                {
                    BlankZero = true;
                }
                field("Line Discount %"; "Line Discount %")
                {
                    BlankZero = true;
                }
                field("Line Discount Amount"; "Line Discount Amount")
                {
                    Visible = false;
                }
                field("Allow Invoice Disc."; "Allow Invoice Disc.")
                {
                    Visible = false;
                }
                field("Job No."; "Job No.")
                {
                    Visible = false;
                }
                field("Appl.-to Item Entry"; "Appl.-to Item Entry")
                {
                    Visible = false;
                }
                field("Deferral Code"; "Deferral Code")
                {
                }
                field("Shortcut Dimension 1 Code"; "Shortcut Dimension 1 Code")
                {
                    Visible = false;
                }
                field("Location Code"; "Location Code")
                {
                }
                field("Shortcut Dimension 2 Code"; "Shortcut Dimension 2 Code")
                {
                    Visible = false;
                }
                field("GST Jurisdiction Type"; "GST Jurisdiction Type")
                {
                }
                field("GST Place of Supply"; "GST Place of Supply")
                {
                }
                field("GST Group Code"; "GST Group Code")
                {
                }
                field("GST Group Type"; "GST Group Type")
                {
                }
                field("GST Base Amount"; "GST Base Amount")
                {
                }
                field("GST %"; "GST %")
                {
                }
                field("Total GST Amount"; "Total GST Amount")
                {
                }
            }
            group()
            {
                Enabled = false;
                Visible = false;
                group()
                {
                    field("Invoice Discount Amount"; TotalSalesInvoiceHeader."Invoice Discount Amount")
                    {
                        AutoFormatExpression = TotalSalesInvoiceHeader."Currency Code";
                        AutoFormatType = 1;
                        Caption = 'Invoice Discount Amount';
                        Editable = false;
                    }
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("&Line")
            {
                Caption = '&Line';
                Image = Line;
                action(Dimensions)
                {
                    AccessByPermission = TableData 348 = R;
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    ShortCutKey = 'Shift+Ctrl+D';

                    trigger OnAction()
                    begin
                        ShowDimensions;
                    end;
                }
                action(Comments)
                {
                    Caption = 'Co&mments';
                    Image = ViewComments;

                    trigger OnAction()
                    begin
                        ShowLineComments;
                    end;
                }
                action(ItemTrackingEntries)
                {
                    Caption = 'Item &Tracking Entries';
                    Image = ItemTrackingLedger;

                    trigger OnAction()
                    begin
                        ShowItemTrackingLines;
                    end;
                }
                action(ItemShipmentLines)
                {
                    Caption = 'Item Shipment &Lines';
                    Image = ShipmentLines;

                    trigger OnAction()
                    begin
                        IF NOT (Type IN [Type::Item, Type::"Charge (Item)"]) THEN
                            TESTFIELD(Type);
                        ShowItemShipmentLines;
                    end;
                }
                action(DeferralSchedule)
                {
                    Caption = 'Deferral Schedule';
                    Image = PaymentPeriod;

                    trigger OnAction()
                    begin
                        ShowDeferrals;
                    end;
                }
                action("Str&ucture Details")
                {
                    Caption = 'Str&ucture Details';
                    Image = Hierarchy;

                    trigger OnAction()
                    begin
                        ShowStrDetailsForm;
                    end;
                }
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        IF TotalSalesInvoiceHeader.GET("Document No.") THEN
            TotalSalesInvoiceHeader.CALCFIELDS("Invoice Discount Amount");
    end;

    trigger OnAfterGetRecord()
    begin
        Customer.RESET;
        Customer.SETFILTER("No.", "Bill-to Customer No.");
    end;

    var
        TotalSalesInvoiceHeader: Record "112";
        DocumentTotals: Codeunit "57";
        Customer: Record "18";

    [Scope('Internal')]
    procedure ShowStrDetailsForm()
    var
        SalesInvHeader: Record "112";
        StrOrderLineDetails: Record "13798";
        StrOrderLineDetailsForm: Page "16309";
    begin
        StrOrderLineDetails.RESET;
        SalesInvHeader.GET("Document No.");
        StrOrderLineDetails.SETCURRENTKEY("Invoice No.", Type, "Item No.");
        StrOrderLineDetails.SETRANGE("Invoice No.", SalesInvHeader."No.");
        StrOrderLineDetails.SETRANGE(Type, StrOrderLineDetails.Type::Sale);
        StrOrderLineDetails.SETRANGE("Item No.", "No.");
        StrOrderLineDetails.SETRANGE("Line No.", "Line No.");
        StrOrderLineDetailsForm.SETTABLEVIEW(StrOrderLineDetails);
        StrOrderLineDetailsForm.RUNMODAL;
    end;

    [Scope('Internal')]
    procedure ShowStrOrderDetailsPITForm()
    begin
        ShowStrOrderDetailsPIT;
    end;
}

