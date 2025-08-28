codeunit 50015 TransferOrderApprovalMgt
{

    [IntegrationEvent(false, false)]
    PROCEDURE OnSendRequestforApproval(VAR TransferHeader: Record "Transfer Header");
    begin
    end;


    [IntegrationEvent(false, false)]
    procedure OnCancelRequestForApproval(Var TransferHeader: Record "Transfer Header")
    begin
    end;


}
