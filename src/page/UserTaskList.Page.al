page 1170 "User Task List"
{
    Caption = 'User Tasks';
    CardPageID = "User Task Card";
    DelayedInsert = true;
    DeleteAllowed = true;
    Editable = true;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    RefreshOnActivate = true;
    SourceTable = Table1170;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Title; Title)
                {
                    ToolTip = 'Specifies the title of the task.';
                }
                field("Due DateTime"; "Due DateTime")
                {
                    StyleExpr = StyleTxt;
                    ToolTip = 'Specifies when the task must be completed.';
                }
                field(Priority; Priority)
                {
                    ToolTip = 'Specifies the priority of the task.';
                }
                field("Percent Complete"; "Percent Complete")
                {
                    StyleExpr = StyleTxt;
                    ToolTip = 'Specifies the progress of the task.';
                }
                field("Assigned To User Name"; "Assigned To User Name")
                {
                    ToolTip = 'Specifies who the task is assigned to.';
                }
                field("Created DateTime"; "Created DateTime")
                {
                    ToolTip = 'Specifies when the task was created.';
                    Visible = false;
                }
                field("Completed DateTime"; "Completed DateTime")
                {
                    ToolTip = 'Specifies when the task was completed.';
                    Visible = false;
                }
                field("Start DateTime"; "Start DateTime")
                {
                    ToolTip = 'Specifies when the task must start.';
                    Visible = false;
                }
                field("Created By User Name"; "Created By User Name")
                {
                    ToolTip = 'Specifies who created the task.';
                    Visible = false;
                }
                field("Completed By User Name"; "Completed By User Name")
                {
                    ToolTip = 'Specifies who completed the task.';
                    Visible = false;
                }
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Mark Complete")
            {
                Caption = 'Mark as Completed';
                Image = CheckList;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Indicate that the task is completed. The % Complete field is set to 100.';

                trigger OnAction()
                var
                    UserTask: Record "1170";
                begin
                    CurrPage.SETSELECTIONFILTER(UserTask);
                    IF UserTask.FINDSET(TRUE) THEN
                        REPEAT
                            UserTask.SetCompleted;
                            UserTask.MODIFY;
                        UNTIL UserTask.NEXT = 0;
                end;
            }
            action("Go To Task Item")
            {
                Caption = 'Go To Task Item';
                Image = Navigate;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Open the page or report that is associated with this task.';

                trigger OnAction()
                begin
                    RunReportOrPageLink;
                end;
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        StyleTxt := SetStyle;
    end;

    var
        StyleTxt: Text;

    [Scope('Internal')]
    procedure SetFiltersForUserTasksCue()
    var
        OriginalFilterGroup: Integer;
    begin
        OriginalFilterGroup := FILTERGROUP;
        FILTERGROUP(25);
        SETFILTER("Percent Complete", '<>100');
        SETRANGE("Assigned To", USERSECURITYID);
        FILTERGROUP(OriginalFilterGroup);
    end;

    local procedure RunReportOrPageLink()
    var
        AllObjWithCaption: Record "2000000058";
    begin
        IF ("Object Type" = 0) OR ("Object ID" = 0) THEN
            EXIT;
        IF "Object Type" = AllObjWithCaption."Object Type"::Page THEN
            PAGE.RUN("Object ID")
        ELSE
            REPORT.RUN("Object ID");
    end;

    [Scope('Internal')]
    procedure SetComplete()
    begin
        SetCompleted;
        MODIFY;
    end;
}

