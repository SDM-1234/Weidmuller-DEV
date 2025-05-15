codeunit 50090 "Record Deletion Mgt."
{
    // **************************************************************************************************************************
    // Created and Designed by Olof Simren 2014
    // Downloaded from olofsimren.com
    // 
    // For illustration only, without warranty, free to use as you want.
    // **************************************************************************************************************************


    trigger OnRun()
    begin
    end;

    var
        Text0001: Label 'Delete Records?';
        Text0002: Label 'Deleting Records!\Table: #1#######';
        Text0003: Label 'Check Table Relations?';
        Text0004: Label 'Checking Relations Between Records!\Table: #1#######';
        Text0005: Label '%1 => %2 = ''%3'' does not exist in the ''%4'' table';

    [Scope('Internal')]
    procedure InsertUpdateTables()
    var
        "Object": Record "2000000001";
        RecordDeletionTable: Record "50090";
    begin
        Object.SETRANGE(Type, Object.Type::Table);
        IF Object.FINDSET THEN
            REPEAT
                RecordDeletionTable.INIT;
                RecordDeletionTable."Table ID" := Object.ID;
                RecordDeletionTable.Company := COMPANYNAME;
                IF RecordDeletionTable.INSERT THEN;
            UNTIL Object.NEXT = 0;
    end;

    [Scope('Internal')]
    procedure SuggestRecordsToDelete()
    begin
        SetSuggestedTable(DATABASE::"Action Message Entry");
        SetSuggestedTable(DATABASE::"Analysis View Budget Entry");
        SetSuggestedTable(DATABASE::"Analysis View Entry");
        SetSuggestedTable(DATABASE::"Analysis View");
        SetSuggestedTable(DATABASE::"Approval Comment Line");
        SetSuggestedTable(DATABASE::"Approval Entry");
        SetSuggestedTable(DATABASE::"Assemble-to-Order Link");
        SetSuggestedTable(DATABASE::"Assembly Comment Line");
        SetSuggestedTable(DATABASE::"Assembly Header");
        SetSuggestedTable(DATABASE::"Assembly Line");
        SetSuggestedTable(DATABASE::"Avg. Cost Adjmt. Entry Point");
        SetSuggestedTable(DATABASE::"Bank Acc. Reconciliation Line");
        SetSuggestedTable(DATABASE::"Bank Acc. Reconciliation");
        SetSuggestedTable(DATABASE::"Bank Account Ledger Entry");
        SetSuggestedTable(DATABASE::"Bank Account Ledger Entry");
        SetSuggestedTable(DATABASE::"Bank Account Statement Line");
        SetSuggestedTable(DATABASE::"Bank Account Statement");
        SetSuggestedTable(DATABASE::"Bank Stmt Multiple Match Line");
        SetSuggestedTable(DATABASE::"Campaign Entry");
        SetSuggestedTable(DATABASE::"Capacity Ledger Entry");
        SetSuggestedTable(DATABASE::"Cash Flow Manual Revenue");
        SetSuggestedTable(DATABASE::"Cash Flow Manual Expense");
        SetSuggestedTable(DATABASE::"Cash Flow Forecast Entry");
        SetSuggestedTable(DATABASE::"Cash Flow Worksheet Line");
        SetSuggestedTable(DATABASE::"Certificate of Supply");
        SetSuggestedTable(DATABASE::"Change Log Entry");
        SetSuggestedTable(DATABASE::"Check Ledger Entry");
        SetSuggestedTable(DATABASE::"Comment Line");
        SetSuggestedTable(DATABASE::"Contract Change Log");
        SetSuggestedTable(DATABASE::"Contract Gain/Loss Entry");
        SetSuggestedTable(DATABASE::"Contract/Service Discount");
        SetSuggestedTable(DATABASE::"Cost Budget Entry");
        SetSuggestedTable(DATABASE::"Cost Budget Register");
        SetSuggestedTable(DATABASE::"Cost Entry");
        SetSuggestedTable(DATABASE::"Cost Journal Line");
        SetSuggestedTable(DATABASE::"Cost Register");
        SetSuggestedTable(DATABASE::"Credit Trans Re-export History");
        SetSuggestedTable(DATABASE::"Credit Transfer Entry");
        SetSuggestedTable(DATABASE::"Credit Transfer Register");
        SetSuggestedTable(DATABASE::"Cust. Ledger Entry");
        SetSuggestedTable(DATABASE::"Date Compr. Register");
        SetSuggestedTable(DATABASE::"Detailed Cust. Ledg. Entry");
        SetSuggestedTable(DATABASE::"Detailed Vendor Ledg. Entry");
        SetSuggestedTable(DATABASE::"Dimension Set Entry");
        SetSuggestedTable(DATABASE::"Dimension Set Tree Node");
        SetSuggestedTable(DATABASE::"Direct Debit Collection Entry");
        SetSuggestedTable(DATABASE::"Direct Debit Collection");
        SetSuggestedTable(DATABASE::"DO Payment Trans. Log Entry");
        SetSuggestedTable(DATABASE::"Document Entry");
        SetSuggestedTable(DATABASE::"Email Item");
        SetSuggestedTable(DATABASE::"Employee Absence");
        SetSuggestedTable(DATABASE::"Error Buffer");
        SetSuggestedTable(DATABASE::"Exch. Rate Adjmt. Reg.");
        SetSuggestedTable(DATABASE::"FA G/L Posting Buffer");
        SetSuggestedTable(DATABASE::"FA Ledger Entry");
        SetSuggestedTable(DATABASE::"FA Register");
        SetSuggestedTable(DATABASE::"Filed Contract Line");
        SetSuggestedTable(DATABASE::"Filed Service Contract Header");
        SetSuggestedTable(DATABASE::"Fin. Charge Comment Line");
        SetSuggestedTable(DATABASE::"Finance Charge Memo Header");
        SetSuggestedTable(DATABASE::"Finance Charge Memo Line");
        SetSuggestedTable(DATABASE::"G/L - Item Ledger Relation");
        SetSuggestedTable(DATABASE::"G/L Budget Entry");
        SetSuggestedTable(DATABASE::"G/L Budget Name");
        SetSuggestedTable(DATABASE::"G/L Entry - VAT Entry Link");
        SetSuggestedTable(DATABASE::"G/L Entry");
        SetSuggestedTable(DATABASE::"G/L Register");
        SetSuggestedTable(DATABASE::"Gen. Jnl. Allocation");
        SetSuggestedTable(DATABASE::"Gen. Journal Line");
        SetSuggestedTable(DATABASE::"Handled IC Inbox Jnl. Line");
        SetSuggestedTable(DATABASE::"Handled IC Inbox Purch. Header");
        SetSuggestedTable(DATABASE::"Handled IC Inbox Purch. Line");
        SetSuggestedTable(DATABASE::"Handled IC Inbox Sales Header");
        SetSuggestedTable(DATABASE::"Handled IC Inbox Sales Line");
        SetSuggestedTable(DATABASE::"Handled IC Inbox Trans.");
        SetSuggestedTable(DATABASE::"Handled IC Outbox Jnl. Line");
        SetSuggestedTable(DATABASE::"Handled IC Outbox Purch. Hdr");
        SetSuggestedTable(DATABASE::"Handled IC Outbox Purch. Line");
        SetSuggestedTable(DATABASE::"Handled IC Outbox Sales Header");
        SetSuggestedTable(DATABASE::"Handled IC Outbox Sales Line");
        SetSuggestedTable(DATABASE::"Handled IC Outbox Trans.");
        SetSuggestedTable(DATABASE::"IC Comment Line");
        SetSuggestedTable(DATABASE::"IC Document Dimension");
        SetSuggestedTable(DATABASE::"IC Inbox Jnl. Line");
        SetSuggestedTable(DATABASE::"IC Inbox Purchase Header");
        SetSuggestedTable(DATABASE::"IC Inbox Purchase Line");
        SetSuggestedTable(DATABASE::"IC Inbox Sales Header");
        SetSuggestedTable(DATABASE::"IC Inbox Sales Line");
        SetSuggestedTable(DATABASE::"IC Inbox Transaction");
        SetSuggestedTable(DATABASE::"IC Inbox/Outbox Jnl. Line Dim.");
        SetSuggestedTable(DATABASE::"IC Outbox Jnl. Line");
        SetSuggestedTable(DATABASE::"IC Outbox Purchase Header");
        SetSuggestedTable(DATABASE::"IC Outbox Purchase Line");
        SetSuggestedTable(DATABASE::"IC Outbox Sales Header");
        SetSuggestedTable(DATABASE::"IC Outbox Sales Line");
        SetSuggestedTable(DATABASE::"IC Outbox Transaction");
        SetSuggestedTable(DATABASE::"Incoming Document");
        SetSuggestedTable(DATABASE::"Ins. Coverage Ledger Entry");
        SetSuggestedTable(DATABASE::"Insurance Register");
        SetSuggestedTable(DATABASE::"Inter. Log Entry Comment Line");
        SetSuggestedTable(DATABASE::"Interaction Log Entry");
        SetSuggestedTable(DATABASE::"Internal Movement Header");
        SetSuggestedTable(DATABASE::"Internal Movement Line");
        SetSuggestedTable(DATABASE::"Intrastat Jnl. Line");
        SetSuggestedTable(DATABASE::"Inventory Adjmt. Entry (Order)");
        SetSuggestedTable(DATABASE::"Inventory Period Entry");
        SetSuggestedTable(DATABASE::"Inventory Report Entry");
        SetSuggestedTable(DATABASE::"Issued Fin. Charge Memo Header");
        SetSuggestedTable(DATABASE::"Issued Fin. Charge Memo Line");
        SetSuggestedTable(DATABASE::"Issued Reminder Header");
        SetSuggestedTable(DATABASE::"Issued Reminder Line");
        SetSuggestedTable(DATABASE::"Item Analysis View Budg. Entry");
        SetSuggestedTable(DATABASE::"Item Analysis View Entry");
        SetSuggestedTable(DATABASE::"Item Analysis View");
        SetSuggestedTable(DATABASE::"Item Application Entry History");
        SetSuggestedTable(DATABASE::"Item Application Entry");
        SetSuggestedTable(DATABASE::"Item Budget Entry");
        SetSuggestedTable(DATABASE::"Item Charge Assignment (Purch)");
        SetSuggestedTable(DATABASE::"Item Charge Assignment (Sales)");
        SetSuggestedTable(DATABASE::"Item Entry Relation");
        SetSuggestedTable(DATABASE::"Item Journal Line");
        SetSuggestedTable(DATABASE::"Item Ledger Entry");
        SetSuggestedTable(DATABASE::"Item Register");
        SetSuggestedTable(DATABASE::"Item Tracking Comment");
        SetSuggestedTable(DATABASE::"Job Entry No.");
        SetSuggestedTable(DATABASE::"Job G/L Account Price");
        SetSuggestedTable(DATABASE::"Job Item Price");
        SetSuggestedTable(DATABASE::"Job Journal Line");
        SetSuggestedTable(DATABASE::"Job Ledger Entry");
        SetSuggestedTable(DATABASE::"Job Planning Line Invoice");
        SetSuggestedTable(DATABASE::"Job Planning Line");
        SetSuggestedTable(DATABASE::"Job Queue Log Entry");
        SetSuggestedTable(DATABASE::"Job Register");
        SetSuggestedTable(DATABASE::"Job Resource Price");
        SetSuggestedTable(DATABASE::"Job Task Dimension");
        SetSuggestedTable(DATABASE::"Job Task");
        SetSuggestedTable(DATABASE::"Job Task");
        SetSuggestedTable(DATABASE::"Job Usage Link");
        SetSuggestedTable(DATABASE::"Job WIP Entry");
        SetSuggestedTable(DATABASE::"Job WIP G/L Entry");
        SetSuggestedTable(DATABASE::"Job WIP Total");
        SetSuggestedTable(DATABASE::"Job WIP Warning");
        SetSuggestedTable(DATABASE::"Loaner Entry");
        SetSuggestedTable(DATABASE::"Lot No. Information");
        SetSuggestedTable(DATABASE::"Maintenance Ledger Entry");
        SetSuggestedTable(DATABASE::"Maintenance Registration");
        SetSuggestedTable(DATABASE::"Opportunity Entry");
        SetSuggestedTable(DATABASE::"Order Promising Line");
        SetSuggestedTable(DATABASE::"Order Tracking Entry");
        SetSuggestedTable(DATABASE::"Overdue Approval Entry");
        SetSuggestedTable(DATABASE::"Payable Vendor Ledger Entry");
        SetSuggestedTable(DATABASE::"Payment Application Proposal");
        SetSuggestedTable(DATABASE::"Payment Export Data");
        SetSuggestedTable(DATABASE::"Payment Jnl. Export Error Text");
        SetSuggestedTable(DATABASE::"Payment Matching Details");
        SetSuggestedTable(DATABASE::"Phys. Inventory Ledger Entry");
        SetSuggestedTable(DATABASE::"Planning Assignment");
        SetSuggestedTable(DATABASE::"Planning Component");
        SetSuggestedTable(DATABASE::"Planning Error Log");
        SetSuggestedTable(DATABASE::"Planning Routing Line");
        SetSuggestedTable(DATABASE::"Post Value Entry to G/L");
        SetSuggestedTable(DATABASE::"Posted Approval Comment Line");
        SetSuggestedTable(DATABASE::"Posted Approval Entry");
        SetSuggestedTable(DATABASE::"Posted Assemble-to-Order Link");
        SetSuggestedTable(DATABASE::"Posted Assembly Header");
        SetSuggestedTable(DATABASE::"Posted Assembly Line");
        SetSuggestedTable(DATABASE::"Posted Invt. Pick Header");
        SetSuggestedTable(DATABASE::"Posted Invt. Pick Line");
        SetSuggestedTable(DATABASE::"Posted Invt. Put-away Header");
        SetSuggestedTable(DATABASE::"Posted Invt. Put-away Line");
        SetSuggestedTable(DATABASE::"Posted Payment Recon. Hdr");
        SetSuggestedTable(DATABASE::"Posted Payment Recon. Line");
        SetSuggestedTable(DATABASE::"Posted Whse. Receipt Header");
        SetSuggestedTable(DATABASE::"Posted Whse. Receipt Line");
        SetSuggestedTable(DATABASE::"Posted Whse. Shipment Header");
        SetSuggestedTable(DATABASE::"Posted Whse. Shipment Line");
        SetSuggestedTable(DATABASE::"Data Exch. Field");
        SetSuggestedTable(DATABASE::"Data Exch.");
        SetSuggestedTable(DATABASE::"Prod. Order Capacity Need");
        SetSuggestedTable(DATABASE::"Prod. Order Comment Line");
        SetSuggestedTable(DATABASE::"Prod. Order Comp. Cmt Line");
        SetSuggestedTable(DATABASE::"Prod. Order Component");
        SetSuggestedTable(DATABASE::"Prod. Order Line");
        SetSuggestedTable(DATABASE::"Prod. Order Routing Line");
        SetSuggestedTable(DATABASE::"Prod. Order Routing Personnel");
        SetSuggestedTable(DATABASE::"Prod. Order Routing Tool");
        SetSuggestedTable(DATABASE::"Prod. Order Rtng Comment Line");
        SetSuggestedTable(DATABASE::"Prod. Order Rtng Qlty Meas.");
        SetSuggestedTable(DATABASE::"Production Forecast Entry");
        SetSuggestedTable(DATABASE::"Production Order");
        SetSuggestedTable(DATABASE::"Purch. Comment Line Archive");
        SetSuggestedTable(DATABASE::"Purch. Comment Line");
        SetSuggestedTable(DATABASE::"Purch. Cr. Memo Hdr.");
        SetSuggestedTable(DATABASE::"Purch. Cr. Memo Line");
        SetSuggestedTable(DATABASE::"Purch. Inv. Header");
        SetSuggestedTable(DATABASE::"Purch. Inv. Line");
        SetSuggestedTable(DATABASE::"Purch. Rcpt. Header");
        SetSuggestedTable(DATABASE::"Purch. Rcpt. Line");
        SetSuggestedTable(DATABASE::"Purchase Header Archive");
        SetSuggestedTable(DATABASE::"Purchase Header");
        SetSuggestedTable(DATABASE::"Purchase Line Archive");
        SetSuggestedTable(DATABASE::"Purchase Line");
        SetSuggestedTable(DATABASE::"Registered Invt. Movement Hdr.");
        SetSuggestedTable(DATABASE::"Registered Invt. Movement Line");
        SetSuggestedTable(DATABASE::"Registered Whse. Activity Hdr.");
        SetSuggestedTable(DATABASE::"Registered Whse. Activity Line");
        SetSuggestedTable(DATABASE::"Reminder Comment Line");
        SetSuggestedTable(DATABASE::"Reminder Header");
        SetSuggestedTable(DATABASE::"Reminder Line");
        SetSuggestedTable(DATABASE::"Reminder/Fin. Charge Entry");
        SetSuggestedTable(DATABASE::"Requisition Line");
        SetSuggestedTable(DATABASE::"Res. Capacity Entry");
        SetSuggestedTable(DATABASE::"Res. Journal Line");
        SetSuggestedTable(DATABASE::"Res. Ledger Entry");
        SetSuggestedTable(DATABASE::"Reservation Entry");
        SetSuggestedTable(DATABASE::"Resource Register");
        SetSuggestedTable(DATABASE::"Return Receipt Header");
        SetSuggestedTable(DATABASE::"Return Receipt Line");
        SetSuggestedTable(DATABASE::"Return Shipment Header");
        SetSuggestedTable(DATABASE::"Return Shipment Line");
        SetSuggestedTable(DATABASE::"Returns-Related Document");
        SetSuggestedTable(DATABASE::"Reversal Entry");
        SetSuggestedTable(DATABASE::"Rounding Residual Buffer");
        SetSuggestedTable(DATABASE::"Sales Comment Line Archive");
        SetSuggestedTable(DATABASE::"Sales Comment Line");
        SetSuggestedTable(DATABASE::"Sales Cr.Memo Header");
        SetSuggestedTable(DATABASE::"Sales Cr.Memo Line");
        SetSuggestedTable(DATABASE::"Sales Header Archive");
        SetSuggestedTable(DATABASE::"Sales Header");
        SetSuggestedTable(DATABASE::"Sales Invoice Header");
        SetSuggestedTable(DATABASE::"Sales Invoice Line");
        SetSuggestedTable(DATABASE::"Sales Line Archive");
        SetSuggestedTable(DATABASE::"Sales Line");
        SetSuggestedTable(DATABASE::"Sales Planning Line");
        SetSuggestedTable(DATABASE::"Sales Shipment Header");
        SetSuggestedTable(DATABASE::"Sales Shipment Line");
        SetSuggestedTable(DATABASE::"Segment Criteria Line");
        SetSuggestedTable(DATABASE::"Segment Header");
        SetSuggestedTable(DATABASE::"Segment History");
        SetSuggestedTable(DATABASE::"Segment Interaction Language");
        SetSuggestedTable(DATABASE::"Segment Line");
        SetSuggestedTable(DATABASE::"Serial No. Information");
        SetSuggestedTable(DATABASE::"Service Comment Line");
        SetSuggestedTable(DATABASE::"Service Contract Header");
        SetSuggestedTable(DATABASE::"Service Contract Line");
        SetSuggestedTable(DATABASE::"Service Cr.Memo Header");
        SetSuggestedTable(DATABASE::"Service Cr.Memo Line");
        SetSuggestedTable(DATABASE::"Service Document Log");
        SetSuggestedTable(DATABASE::"Service Document Register");
        SetSuggestedTable(DATABASE::"Service E-Mail Queue");
        SetSuggestedTable(DATABASE::"Service Header");
        SetSuggestedTable(DATABASE::"Service Invoice Header");
        SetSuggestedTable(DATABASE::"Service Invoice Line");
        SetSuggestedTable(DATABASE::"Service Item Component");
        SetSuggestedTable(DATABASE::"Service Item Line");
        SetSuggestedTable(DATABASE::"Service Item Log");
        SetSuggestedTable(DATABASE::"Service Item");
        SetSuggestedTable(DATABASE::"Service Ledger Entry");
        SetSuggestedTable(DATABASE::"Service Line Price Adjmt.");
        SetSuggestedTable(DATABASE::"Service Line");
        SetSuggestedTable(DATABASE::"Service Order Allocation");
        SetSuggestedTable(DATABASE::"Service Register");
        SetSuggestedTable(DATABASE::"Service Shipment Header");
        SetSuggestedTable(DATABASE::"Service Shipment Item Line");
        SetSuggestedTable(DATABASE::"Service Shipment Line");
        SetSuggestedTable(DATABASE::"Time Sheet Cmt. Line Archive");
        SetSuggestedTable(DATABASE::"Time Sheet Comment Line");
        SetSuggestedTable(DATABASE::"Time Sheet Detail Archive");
        SetSuggestedTable(DATABASE::"Time Sheet Detail");
        SetSuggestedTable(DATABASE::"Time Sheet Header Archive");
        SetSuggestedTable(DATABASE::"Time Sheet Header");
        SetSuggestedTable(DATABASE::"Time Sheet Line Archive");
        SetSuggestedTable(DATABASE::"Time Sheet Line");
        SetSuggestedTable(DATABASE::"Time Sheet Posting Entry");
        SetSuggestedTable(DATABASE::"To-do");
        SetSuggestedTable(DATABASE::"Tracking Specification");
        SetSuggestedTable(DATABASE::"Transfer Header");
        SetSuggestedTable(DATABASE::"Transfer Line");
        SetSuggestedTable(DATABASE::"Transfer Receipt Header");
        SetSuggestedTable(DATABASE::"Transfer Receipt Line");
        SetSuggestedTable(DATABASE::"Transfer Shipment Header");
        SetSuggestedTable(DATABASE::"Transfer Shipment Line");
        SetSuggestedTable(DATABASE::"Unplanned Demand");
        SetSuggestedTable(DATABASE::"Untracked Planning Element");
        SetSuggestedTable(DATABASE::"Value Entry Relation");
        SetSuggestedTable(DATABASE::"Value Entry");
        SetSuggestedTable(DATABASE::"VAT Entry");
        SetSuggestedTable(DATABASE::"VAT Rate Change Log Entry");
        SetSuggestedTable(DATABASE::"VAT Report Header");
        SetSuggestedTable(DATABASE::"VAT Report Line");
        SetSuggestedTable(DATABASE::"VAT Report Line Relation");
        SetSuggestedTable(DATABASE::"VAT Report Error Log");
        SetSuggestedTable(DATABASE::"Vendor Ledger Entry");
        SetSuggestedTable(DATABASE::"Warehouse Activity Header");
        SetSuggestedTable(DATABASE::"Warehouse Activity Line");
        SetSuggestedTable(DATABASE::"Warehouse Entry");
        SetSuggestedTable(DATABASE::"Warehouse Journal Line");
        SetSuggestedTable(DATABASE::"Warehouse Receipt Header");
        SetSuggestedTable(DATABASE::"Warehouse Receipt Line");
        SetSuggestedTable(DATABASE::"Warehouse Register");
        SetSuggestedTable(DATABASE::"Warehouse Request");
        SetSuggestedTable(DATABASE::"Warehouse Shipment Header");
        SetSuggestedTable(DATABASE::"Warehouse Shipment Line");
        SetSuggestedTable(DATABASE::"Warranty Ledger Entry");
        SetSuggestedTable(DATABASE::"Whse. Internal Pick Header");
        SetSuggestedTable(DATABASE::"Whse. Internal Pick Line");
        SetSuggestedTable(DATABASE::"Whse. Internal Put-away Header");
        SetSuggestedTable(DATABASE::"Whse. Internal Put-away Line");
        SetSuggestedTable(DATABASE::"Whse. Item Entry Relation");
        SetSuggestedTable(DATABASE::"Whse. Item Tracking Line");
        SetSuggestedTable(DATABASE::"Whse. Pick Request");
        SetSuggestedTable(DATABASE::"Whse. Put-away Request");
        SetSuggestedTable(DATABASE::"Whse. Worksheet Line");
        SetSuggestedTable(DATABASE::Attachment);
        SetSuggestedTable(DATABASE::Attendee);
        SetSuggestedTable(DATABASE::Job);
        SetSuggestedTable(DATABASE::Opportunity);
    end;

    [Scope('Internal')]
    procedure ClearRecordsToDelete()
    var
        RecordDeletionTable: Record "50090";
    begin
        RecordDeletionTable.MODIFYALL("Delete Records", FALSE);
    end;

    [Scope('Internal')]
    procedure DeleteRecords()
    var
        Window: Dialog;
        RecRef: RecordRef;
        RecordDeletionTable: Record "50090";
        RecordDelTableRelError: Record "50091";
    begin
        IF NOT CONFIRM(Text0001, FALSE) THEN
            EXIT;

        Window.OPEN(Text0002);

        IF RecordDeletionTable.FINDSET THEN
            REPEAT
                IF RecordDeletionTable."Delete Records" THEN BEGIN
                    Window.UPDATE(1, FORMAT(RecordDeletionTable."Table ID"));
                    RecRef.OPEN(RecordDeletionTable."Table ID");
                    RecRef.DELETEALL;
                    RecRef.CLOSE;
                    RecordDelTableRelError.SETRANGE("Table ID", RecordDeletionTable."Table ID");
                    RecordDelTableRelError.DELETEALL;
                END;
            UNTIL RecordDeletionTable.NEXT = 0;

        Window.CLOSE;
    end;

    [Scope('Internal')]
    procedure CheckTableRelations()
    var
        Window: Dialog;
        RecordDeletionTable: Record "50090";
        RecordDelTableRelError: Record "50091";
        RecRef: RecordRef;
        "Field": Record "2000000041";
        FieldRef: FieldRef;
        RecRef2: RecordRef;
        FieldRef2: FieldRef;
        Field2: Record "2000000041";
        EntryNo: Integer;
        "Key": Record "2000000063";
        SkipCheck: Boolean;
    begin
        IF NOT CONFIRM(Text0003, FALSE) THEN
            EXIT;

        Window.OPEN(Text0004);

        RecordDelTableRelError.DELETEALL;

        IF RecordDeletionTable.FINDSET THEN
            REPEAT
                Window.UPDATE(1, FORMAT(RecordDeletionTable."Table ID"));
                RecRef.OPEN(RecordDeletionTable."Table ID");
                IF RecRef.FINDSET THEN
                    REPEAT
                        Field.SETRANGE(TableNo, RecordDeletionTable."Table ID");
                        Field.SETRANGE(Class, Field.Class::Normal);
                        Field.SETFILTER(RelationTableNo, '<>0');
                        IF Field.FINDSET THEN
                            REPEAT
                                FieldRef := RecRef.FIELD(Field."No.");
                                IF (FORMAT(FieldRef.VALUE) <> '') AND (FORMAT(FieldRef.VALUE) <> '0') THEN BEGIN
                                    RecRef2.OPEN(Field.RelationTableNo);
                                    SkipCheck := FALSE;
                                    IF Field.RelationFieldNo <> 0 THEN BEGIN
                                        FieldRef2 := RecRef2.FIELD(Field.RelationFieldNo)
                                    END ELSE BEGIN
                                        Key.GET(Field.RelationTableNo, 1);  // PK
                                        Field2.SETRANGE(TableNo, Field.RelationTableNo);
                                        Field2.SETFILTER(FieldName, COPYSTR(Key.Key, 1, 30));
                                        IF Field2.FINDFIRST THEN // No Match if Dual PK
                                            FieldRef2 := RecRef2.FIELD(Field2."No.")
                                        ELSE
                                            SkipCheck := TRUE;
                                    END;
                                    IF (FieldRef.TYPE = FieldRef2.TYPE) AND (FieldRef.LENGTH = FieldRef2.LENGTH) AND (NOT SkipCheck) THEN BEGIN
                                        FieldRef2.SETRANGE(FieldRef.VALUE);
                                        IF NOT RecRef2.FINDFIRST THEN BEGIN
                                            RecordDelTableRelError.SETRANGE("Table ID", RecRef.NUMBER);
                                            IF RecordDelTableRelError.FINDLAST THEN
                                                EntryNo := RecordDelTableRelError."Entry No." + 1
                                            ELSE
                                                EntryNo := 1;
                                            RecordDelTableRelError.INIT;
                                            RecordDelTableRelError."Table ID" := RecRef.NUMBER;
                                            RecordDelTableRelError."Entry No." := EntryNo;
                                            RecordDelTableRelError."Field No." := FieldRef.NUMBER;
                                            RecordDelTableRelError.Error := COPYSTR(STRSUBSTNO(Text0005, FORMAT(RecRef.GETPOSITION), FORMAT(FieldRef2.NAME), FORMAT(FieldRef.VALUE), FORMAT(RecRef2.NAME)), 1, 250);
                                            RecordDelTableRelError.INSERT;
                                        END;
                                    END;
                                    RecRef2.CLOSE;
                                END;
                            UNTIL Field.NEXT = 0;
                    UNTIL RecRef.NEXT = 0;
                RecRef.CLOSE;
            UNTIL RecordDeletionTable.NEXT = 0;

        Window.CLOSE;
    end;

    [Scope('Internal')]
    procedure ViewRecords(RecordDeletionTable: Record "50090")
    begin
        HYPERLINK(GETURL(CLIENTTYPE::Current, COMPANYNAME, OBJECTTYPE::Table, RecordDeletionTable."Table ID"));
    end;

    [Scope('Internal')]
    procedure SetSuggestedTable(TableID: Integer)
    var
        RecordDeletionTable: Record "50090";
    begin
        IF RecordDeletionTable.GET(TableID) THEN BEGIN
            RecordDeletionTable."Delete Records" := TRUE;
            RecordDeletionTable.MODIFY;
        END;
    end;
}

