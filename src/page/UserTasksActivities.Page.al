page 9078 "User Tasks Activities"
{
    Caption = 'User Tasks Activities';
    PageType = CardPart;
    SourceTable = Table1170;

    layout
    {
        area(content)
        {
            cuegroup("My User Tasks")
            {
                Caption = 'My User Tasks';
                field(VarPendingTasksCount; VarPendingTasksCount)
                {
                    Caption = 'Pending User Tasks';
                    DrillDownPageID = "User Task List";
                    Image = Checklist;
                    ToolTip = 'Specifies the number of pending tasks that are assigned to you.';

                    trigger OnDrillDown()
                    var
                        UserTaskList: Page "1170";
                    begin
                        UserTaskList.SetFiltersForUserTasksCue;
                        UserTaskList.RUN;
                    end;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnOpenPage()
    begin
        SETRANGE("Assigned To", USERSECURITYID);
        SETFILTER("Percent Complete", '<>100');
        VarPendingTasksCount := COUNT;
        RESET;
    end;

    var
        VarPendingTasksCount: Integer;
}

