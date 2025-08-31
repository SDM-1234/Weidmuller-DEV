codeunit 50018 "Phy Invt Approval Mgmt"
{

    [IntegrationEvent(false, false)]
    PROCEDURE OnSendRequestforApproval(VAR ItemJnlLine: Record "Item Journal Line");
    begin
    end;


    [IntegrationEvent(false, false)]
    procedure OnCancelRequestForApproval(VAR ItemJnlLine: Record "Item Journal Line")
    begin
    end;

    [EventSubscriber(ObjectType::Table, Database::"Item Journal Line", OnBeforeModifyEvent, '', false, false)]
    local procedure ItemJnlLine_OnBeforeModifyEvent(var Rec: Record "Item Journal Line"; var xRec: Record "Item Journal Line"; RunTrigger: Boolean)
    var
        RecordRestriction: Codeunit "Record Restriction Mgt.";
    begin
        RecordRestriction.CheckRecordHasUsageRestrictions(Rec);
    end;

    [EventSubscriber(ObjectType::Table, Database::"Item Journal Line", OnBeforeDeleteEvent, '', false, false)]
    local procedure ItemJnlLine_OnBeforeDeleteEvent(RunTrigger: Boolean; var Rec: Record "Item Journal Line")
    var
        RecordRestriction: Codeunit "Record Restriction Mgt.";
    begin
        RecordRestriction.CheckRecordHasUsageRestrictions(Rec);
    end;

}
