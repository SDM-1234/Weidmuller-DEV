page 50019 "Sales Cr. Register -GST Audit"
{
    AutoSplitKey = true;
    Caption = 'Sales Cr. Register -GST Audit';
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    LinksAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = Table115;
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
                field("Bill-to Customer No."; "Bill-to Customer No.")
                {
                    Caption = 'Customer No.';
                }
                field("Bill-to Customer Name"; "Bill-to Customer Name")
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
                field("MRP Price"; "MRP Price")
                {
                    Visible = false;
                }
                field(MRP; MRP)
                {
                    Visible = false;
                }
                field("Abatement %"; "Abatement %")
                {
                    Visible = false;
                }
                field("PIT Structure"; "PIT Structure")
                {
                    Visible = false;
                }
                field("Price Inclusive of Tax"; "Price Inclusive of Tax")
                {
                    Visible = false;
                }
                field("Unit Price Incl. of Tax"; "Unit Price Incl. of Tax")
                {
                    Visible = false;
                }
                field("Return Reason Code"; "Return Reason Code")
                {
                }
                field(Quantity; Quantity)
                {
                    BlankZero = true;
                    Visible = true;
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
                field("Appl.-from Item Entry"; "Appl.-from Item Entry")
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
                field("Total GST Amount"; "Total GST Amount")
                {
                }
                field("HSN/SAC Code"; "HSN/SAC Code")
                {
                }
            }
            group()
            {
                Enabled = false;
                Visible = false;
                group()
                {
                    field("Invoice Discount Amount"; TotalSalesCrMemoHeader."Invoice Discount Amount")
                    {
                        AutoFormatExpression = TotalSalesCrMemoHeader."Currency Code";
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
                action(ItemReturnReceiptLines)
                {
                    AccessByPermission = TableData 6650 = R;
                    Caption = 'Item Return Receipt &Lines';

                    trigger OnAction()
                    begin
                        PageShowItemReturnRcptLines;
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

    trigger OnAfterGetRecord()
    begin

        IF TotalSalesCrMemoHeader.GET("Document No.") THEN
            TotalSalesCrMemoHeader.CALCFIELDS("Invoice Discount Amount");
    end;

    var
        TotalSalesCrMemoHeader: Record "114";

    local procedure PageShowItemReturnRcptLines()
    begin
        IF NOT (Type IN [Type::Item, Type::"Charge (Item)"]) THEN
            TESTFIELD(Type);
        ShowItemReturnRcptLines;
    end;

    [Scope('Internal')]
    procedure ShowStrDetailsForm()
    var
        SalesCrHeader: Record "114";
        StrOrderLineDetails: Record "13798";
        StrOrderLineDetailsForm: Page "16309";
    begin
        StrOrderLineDetails.RESET;
        SalesCrHeader.GET("Document No.");
        StrOrderLineDetails.SETCURRENTKEY("Invoice No.", Type, "Item No.");
        StrOrderLineDetails.SETRANGE("Invoice No.", SalesCrHeader."No.");
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

