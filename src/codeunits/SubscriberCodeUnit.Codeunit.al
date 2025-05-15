codeunit 50004 "Subscriber CodeUnit"
{

    trigger OnRun()
    begin
    end;

    [EventSubscriber(ObjectType::Codeunit, 1535, 'OnApproveApprovalRequest', '', false, false)]
    local procedure OnApproveApprovalRequest_CU1535(var ApprovalEntry: Record "454")
    var
        RequeststoApprove: Page "654";
    begin
        //ZE_SIDD 31.10.2022
        //++
        ApprovalEntry.CALCFIELDS("Pending Approvals");
        IF ApprovalEntry."Pending Approvals" = 0 THEN
            RequeststoApprove.CustomerUnblock(ApprovalEntry);
        //--
    end;
}

