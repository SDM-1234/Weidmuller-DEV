pageextension 50091 pageextension50091 extends "Requests to Approve"
{
    actions
    {
        modify(Delegate)
        {
            Visible = false;
            Enabled = false;
        }
    }
    var
        Cust: Record "18";

    procedure CustomerUnblock(ApprovalEntry: Record "454")
    begin
        IF (STRPOS(ApprovalEntry.RecordDetails, 'Customer') = 1) THEN BEGIN
            Cust.RESET;
            Cust.SETFILTER(Cust."No.", COPYSTR(ApprovalEntry.RecordDetails, 11, STRLEN(ApprovalEntry.RecordDetails)));
            IF Cust.FINDFIRST THEN BEGIN
                Cust.Blocked := Cust.Blocked::" ";
                Cust.MODIFY;
            END;
        END;
    end;
}

