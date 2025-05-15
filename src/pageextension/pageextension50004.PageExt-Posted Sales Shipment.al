pageextension 50004 pageextension50004 extends "Posted Sales Shipment"
{
    actions
    {
        addafter("Action 50")
        {
            action("Packing List")
            {
                Image = "report";
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    PackingList: Report "50004";
                begin
                    SalesShptHeader.RESET;
                    SalesShptHeader.SETRANGE(SalesShptHeader."No.", "No.");
                    IF SalesShptHeader.FINDFIRST THEN BEGIN
                        PackingList.SETTABLEVIEW(SalesShptHeader);
                        PackingList.RUN;
                    END;

                    /*
                    InvtPick.SETRANGE(InvtPick."Source No.","No.");
                    IF InvtPick.FINDFIRST THEN BEGIN
                      PackingList.SETTABLEVIEW(InvtPick);
                      PackingList.RUN;
                    END;
                    */

                end;
            }
        }
    }
}

