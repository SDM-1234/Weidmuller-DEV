pageextension 50104 pageextension50104 extends "Acc. Payables Activities"
{
    layout
    {
        addafter("Control 7")
        {
            cuegroup("My User Tasks")
            {
                Caption = 'My User Tasks';
                field("Pending Tasks"; "Pending Tasks")
                {
                    Caption = 'Pending User Tasks';
                    DrillDownPageID = "User Task List";
                    Image = Checklist;
                    ToolTip = 'Specifies the number of pending tasks that are assigned to you.';
                }
            }
        }
    }
}

