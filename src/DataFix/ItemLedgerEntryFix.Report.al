report 50116 "Item Ledger Entry Fix"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    ProcessingOnly = true;
    Permissions = TableData "Item Ledger Entry" = RM;
    Caption = 'Item Ledger Entry Fix';


    dataset
    {
        dataitem(ile; "Item Ledger Entry")
        {
            RequestFilterFields = "Entry No.";
            DataItemTableView = SORTING("Entry No.");
            trigger OnPreDataItem()
            begin
                if ile.GetFilter("Entry No.") = '' then
                    Error('Please set a filter on "Entry No." to limit the number of records to process.');
            end;

            trigger OnAfterGetRecord()
            begin
                ile."Invoiced Quantity" := 0;
                ile."Completely Invoiced" := false;
                ile."Last Invoice Date" := 0D;
                ile.Modify();
            end;

            trigger OnPostDataItem()
            begin
                MESSAGE('Item ledger entries are fixed');
            end;
        }
    }

    requestpage
    {
        AboutTitle = 'Teaching tip title';
        AboutText = 'Teaching tip content';
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                }
            }
        }
    }
}