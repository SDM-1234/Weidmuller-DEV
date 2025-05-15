pageextension 50103 pageextension50103 extends "Account Manager Activities"
{
    layout
    {
        addafter("Control 2")
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


    //Unsupported feature: Code Modification on "OnOpenPage".

    //trigger OnOpenPage()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    RESET;
    IF NOT GET THEN BEGIN
      INIT;
      INSERT;
    END;

    SETFILTER("Due Date Filter",'<=%1',WORKDATE);
    SETFILTER("Overdue Date Filter",'<%1',WORKDATE);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..8
    SETFILTER("User ID Filter",USERID);
    */
    //end;
}

