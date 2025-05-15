page 1172 "User Task Recurrence"
{
    Caption = 'User Task Recurrence';
    PageType = StandardDialog;

    layout
    {
        area(content)
        {
            field(RecurringStartDate; RecurringStartDate)
            {
                Caption = 'Recurring Start Date';
                NotBlank = true;
                ShowMandatory = true;
                ToolTip = 'Specifies the start date for the recurrence.';
            }
            field(Recurrence; Recurrence)
            {
                Caption = 'Recurrence';
                NotBlank = true;
                ShowMandatory = true;
                ToolTip = 'Specifies the recurrence pattern, such as 20D if the task must recur every 20 days.';
            }
            field(Occurrences; Occurrences)
            {
                Caption = 'Occurrences';
                MaxValue = 99;
                MinValue = 1;
                NotBlank = true;
                ShowMandatory = true;
                ToolTip = 'Specifies the number of occurrences.';
            }
        }
    }

    actions
    {
    }

    trigger OnQueryClosePage(CloseAction: Action): Boolean
    begin
        IF CloseAction IN [ACTION::OK, ACTION::LookupOK] THEN
            UserTask.CreateRecurrence(RecurringStartDate, Recurrence, Occurrences);
    end;

    var
        UserTask: Record "1170";
        Recurrence: DateFormula;
        RecurringStartDate: Date;
        Occurrences: Integer;

    [Scope('Internal')]
    procedure SetInitialData(UserTask2: Record "1170")
    begin
        CLEAR(UserTask);
        UserTask := UserTask2;
        Occurrences := 1;
    end;
}

