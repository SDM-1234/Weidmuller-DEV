pageextension 50105 pageextension50105 extends "SO Processor Activities"
{
    layout
    {
        addafter("Control 16")
        {
            cuegroup("Safety Stock")
            {
                Caption = 'Safety Stock';
                field("Item Below Safty Qty"; "Item Below Safty Qty")
                {
                    Caption = 'Items - Below Safety Stock';
                }
            }
            cuegroup("For User Task")
            {
                Caption = 'For User Task';
                field("UT Assigned By Me - Completed"; "UT Assigned By Me - Completed")
                {
                }
                field("UT Assigned By Me - Pending"; "UT Assigned By Me - Pending")
                {
                }
                field("UT Assigned To Me - Completed"; "UT Assigned To Me - Completed")
                {
                }
                field("UT Assigned To Me - Pending"; "UT Assigned To Me - Pending")
                {
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
    #4..6
    SetRespCenterFilter;
    SETRANGE("Date Filter",0D,WORKDATE - 1);
    SETFILTER("Date Filter2",'>=%1',WORKDATE);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..9
    SETFILTER("User ID Filter",USERID);
    */
    //end;
}

