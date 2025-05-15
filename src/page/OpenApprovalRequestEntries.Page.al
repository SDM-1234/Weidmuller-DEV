page 50016 "Open Approval Request Entries"
{
    Caption = 'Open Approval Request Entries';
    Editable = false;
    PageType = List;
    SourceTable = Table454;
    SourceTableView = SORTING (Entry No.)
                      ORDER(Descending)
                      WHERE (Status = FILTER (Open));

    layout
    {
        area(content)
        {
            repeater()
            {
                field(Overdue; Overdue)
                {
                    Caption = 'Overdue';
                    Editable = false;
                    ToolTip = 'Overdue Entry';
                }
                field("Table ID"; "Table ID")
                {
                    Visible = false;
                }
                field("Document Type"; "Document Type")
                {
                    Visible = false;
                }
                field("Document No."; "Document No.")
                {
                    Visible = false;
                }
                field(RecordIDText; RecordIDText)
                {
                    Caption = 'To Approve';
                }
                field("Sequence No."; "Sequence No.")
                {
                }
                field("Sender ID"; "Sender ID")
                {
                }
                field("Salespers./Purch. Code"; "Salespers./Purch. Code")
                {
                }
                field("Approver ID"; "Approver ID")
                {
                }
                field(Status; Status)
                {
                }
                field("Date-Time Sent for Approval"; "Date-Time Sent for Approval")
                {
                }
                field("Last Date-Time Modified"; "Last Date-Time Modified")
                {
                }
                field("Last Modified By User ID"; "Last Modified By User ID")
                {
                }
                field(Comment; Comment)
                {
                }
                field("Due Date"; "Due Date")
                {
                }
                field("Available Credit Limit (LCY)"; "Available Credit Limit (LCY)")
                {
                }
            }
        }
        area(factboxes)
        {
            systempart(; Links)
            {
                Visible = false;
            }
            systempart(; Notes)
            {
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("&Show")
            {
                Caption = '&Show';
                Image = View;
                action(Record)
                {
                    Caption = 'Record';
                    Image = Document;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction()
                    begin
                        ShowRecord;
                    end;
                }
                action(Comments)
                {
                    Caption = 'Comments';
                    Image = ViewComments;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction()
                    var
                        ApprovalCommentLine: Record "455";
                    begin
                        ApprovalCommentLine.SETRANGE("Table ID", "Table ID");
                        ApprovalCommentLine.SETRANGE("Record ID to Approve", "Record ID to Approve");
                        PAGE.RUN(PAGE::"Approval Comments", ApprovalCommentLine);
                    end;
                }
                action("O&verdue Entries")
                {
                    Caption = 'O&verdue Entries';
                    Image = OverdueEntries;

                    trigger OnAction()
                    begin
                        SETFILTER(Status, '%1|%2', Status::Created, Status::Open);
                        SETFILTER("Due Date", '<%1', TODAY);
                    end;
                }
                action("All Entries")
                {
                    Caption = 'All Entries';
                    Image = Entries;

                    trigger OnAction()
                    begin
                        SETRANGE(Status);
                        SETRANGE("Due Date");
                    end;
                }
            }
        }
        area(processing)
        {
            action("&Delegate")
            {
                Caption = '&Delegate';
                Image = Delegate;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    ApprovalEntry: Record "454";
                    ApprovalsMgmt: Codeunit "1535";
                begin
                    CurrPage.SETSELECTIONFILTER(ApprovalEntry);
                    ApprovalsMgmt.DelegateApprovalRequests(ApprovalEntry)
                end;
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        Overdue := Overdue::" ";
        IF FormatField(Rec) THEN
            Overdue := Overdue::Yes;

        RecordIDText := FORMAT("Record ID to Approve", 0, 1);
    end;

    trigger OnOpenPage()
    begin
        IF Usersetup.GET(USERID) THEN
            IF NOT Usersetup."Approval Administrator" THEN BEGIN
                FILTERGROUP(2);
                SETCURRENTKEY("Sender ID");
                SETFILTER("Sender ID", '=%1', Usersetup."User ID");
                FILTERGROUP(0);
            END;

        SETRANGE(Status);
        SETRANGE("Due Date");
    end;

    var
        Usersetup: Record "91";
        Overdue: Option Yes," ";
        RecordIDText: Text;

    local procedure FormatField(Rec: Record "454"): Boolean
    begin
        IF Status IN [Status::Created, Status::Open] THEN BEGIN
            IF Rec."Due Date" < TODAY THEN
                EXIT(TRUE);

            EXIT(FALSE);
        END;
    end;
}

