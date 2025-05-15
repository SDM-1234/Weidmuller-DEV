page 50001 "Record Deletion"
{
    // **************************************************************************************************************************
    // Created and Designed by Olof Simren 2014
    // Downloaded from olofsimren.com
    // 
    // For illustration only, without warranty, free to use as you want.
    // **************************************************************************************************************************

    InsertAllowed = false;
    PageType = List;
    SourceTable = Table50090;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Table ID"; "Table ID")
                {
                }
                field("Table Name"; "Table Name")
                {
                }
                field("No. of Records"; "No. of Records")
                {
                }
                field("No. of Table Relation Errors"; "No. of Table Relation Errors")
                {
                }
                field("Delete Records"; "Delete Records")
                {
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("F&unctions")
            {
                Caption = 'F&unctions';
                Image = "Action";
                action("Insert/Update Tables")
                {
                    Caption = 'Insert/Update Tables';
                    Image = Refresh;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction()
                    var
                        RecordDeletionMgt: Codeunit "50090";
                    begin
                        RecordDeletionMgt.InsertUpdateTables;
                    end;
                }
                action("Suggest Records to Delete")
                {
                    Caption = 'Suggest Records to Delete';
                    Image = Suggest;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction()
                    var
                        RecordDeletionMgt: Codeunit "50090";
                    begin
                        RecordDeletionMgt.SuggestRecordsToDelete;
                    end;
                }
                action("Clear Records to Delete")
                {
                    Caption = 'Clear Records to Delete';
                    Image = ClearLog;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction()
                    var
                        RecordDeletionMgt: Codeunit "50090";
                    begin
                        RecordDeletionMgt.ClearRecordsToDelete;
                    end;
                }
                action("Delete Records")
                {
                    Caption = 'Delete Records';
                    Image = Delete;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction()
                    var
                        RecordDeletionMgt: Codeunit "50090";
                    begin
                        RecordDeletionMgt.DeleteRecords;
                    end;
                }
                action("Check Table Relations")
                {
                    Caption = 'Check Table Relations';
                    Image = Relationship;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction()
                    var
                        RecordDeletionMgt: Codeunit "50090";
                    begin
                        RecordDeletionMgt.CheckTableRelations;
                    end;
                }
                action("View Records")
                {
                    Caption = 'View Records';
                    Image = "Table";
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction()
                    var
                        RecordDeletionMgt: Codeunit "50090";
                    begin
                        RecordDeletionMgt.ViewRecords(Rec);
                    end;
                }
            }
        }
    }
}

