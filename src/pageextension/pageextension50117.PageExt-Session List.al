pageextension 50117 pageextension50117 extends "Session List"
{
    actions
    {
        addafter("Debug Next Session")
        {
            action(KillSession)
            {
                Caption = 'Kill Session';

                trigger OnAction()
                begin
                    IF CONFIRM(Text50000, FALSE) THEN
                        STOPSESSION("Session ID");

                    CurrPage.UPDATE;
                end;
            }
        }
    }

    var
        Text50000: Label 'Do you Want to Close the Session?';
}

