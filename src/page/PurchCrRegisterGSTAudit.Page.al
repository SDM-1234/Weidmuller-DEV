page 50020 "Purch. Cr. Register -GST Audit"
{
    AutoSplitKey = true;
    Caption = 'Purch. Cr. Register -GST Audit';
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    LinksAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = Table125;
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
                field("Buy-from Vendor No."; "Buy-from Vendor No.")
                {
                    Caption = 'Vendor No.';
                }
                field("Buy-from Vendor Name"; "Buy-from Vendor Name")
                {
                    Caption = 'Vendor Name';
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
                field("Direct Unit Cost"; "Direct Unit Cost")
                {
                    BlankZero = true;
                }
                field("Indirect Cost %"; "Indirect Cost %")
                {
                    Visible = false;
                }
                field("Unit Cost (LCY)"; "Unit Cost (LCY)")
                {
                    Visible = false;
                }
                field("Unit Price (LCY)"; "Unit Price (LCY)")
                {
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
                field("GST Jurisdiction Type"; "GST Jurisdiction Type")
                {
                }
                field("GST Credit"; "GST Credit")
                {
                    Editable = false;
                    Visible = false;
                }
                field("GST Group Code"; "GST Group Code")
                {
                    Editable = false;
                    Visible = false;
                }
                field("GST Group Type"; "GST Group Type")
                {
                    Visible = false;
                }
                field("HSN/SAC Code"; "HSN/SAC Code")
                {
                    Editable = false;
                    Visible = false;
                }
                field("GST Base Amount"; "GST Base Amount")
                {
                    Visible = false;
                }
                field("Total GST Amount"; "Total GST Amount")
                {
                    Visible = false;
                }
                field("Job No."; "Job No.")
                {
                    Visible = false;
                }
                field("Prod. Order No."; "Prod. Order No.")
                {
                    Visible = false;
                }
                field("Insurance No."; "Insurance No.")
                {
                    Visible = false;
                }
                field("Budgeted FA No."; "Budgeted FA No.")
                {
                    Visible = false;
                }
                field("FA Posting Type"; "FA Posting Type")
                {
                    Visible = false;
                }
                field("Depr. until FA Posting Date"; "Depr. until FA Posting Date")
                {
                    Visible = false;
                }
                field("Depreciation Book Code"; "Depreciation Book Code")
                {
                    Visible = false;
                }
                field("Depr. Acquisition Cost"; "Depr. Acquisition Cost")
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
                action(ItemReturnShipmentLines)
                {
                    AccessByPermission = TableData 6650 = R;
                    Caption = 'Item Return Shipment &Lines';

                    trigger OnAction()
                    begin
                        IF NOT (Type IN [Type::Item, Type::"Charge (Item)"]) THEN
                            TESTFIELD(Type);
                        ShowItemReturnShptLines;
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
                action(DeferralSchedule)
                {
                    Caption = 'Deferral Schedule';
                    Image = PaymentPeriod;

                    trigger OnAction()
                    begin
                        ShowDeferrals;
                    end;
                }
            }
        }
    }

    [Scope('Internal')]
    procedure ShowStrDetailsForm()
    var
        StrOrderLineDetails: Record "13798";
        PurchCrMemoHeader: Record "124";
        StrOrderLineDetailsForm: Page "16309";
    begin
        StrOrderLineDetails.RESET;
        PurchCrMemoHeader.GET("Document No.");
        StrOrderLineDetails.SETCURRENTKEY("Invoice No.", Type, "Item No.");
        StrOrderLineDetails.SETRANGE("Invoice No.", PurchCrMemoHeader."No.");
        StrOrderLineDetails.SETRANGE(Type, StrOrderLineDetails.Type::Purchase);
        StrOrderLineDetails.SETRANGE("Item No.", "No.");
        StrOrderLineDetails.SETRANGE("Line No.", "Line No.");
        StrOrderLineDetailsForm.SETTABLEVIEW(StrOrderLineDetails);
        StrOrderLineDetailsForm.RUNMODAL;
    end;
}

