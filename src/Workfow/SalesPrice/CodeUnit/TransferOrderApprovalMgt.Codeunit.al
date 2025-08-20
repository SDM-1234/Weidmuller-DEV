codeunit 50012 TransferOrderApprovalMgt
{




    [IntegrationEvent(false, false)]
    PROCEDURE OnSendTOforApproval(VAR TransferHeader: Record "Transfer Header");
    begin
    end;


    var
        WFMgt: Codeunit "Workflow Management";
        AppMgmt: Codeunit "Approvals Mgmt.";
        WorkflowEventHandling: Codeunit "Workflow Event Handling";
        WorkflowResponseHandling: Codeunit "Workflow Response Handling";
        SendJobReq: TextConst ENU = 'Approval Request for Transfer Order is requested', ENG = 'Approval Request for Job is requested';
        AppReqJob: TextConst ENU = 'Approval Request for Transfer Order is approved', ENG = 'Approval Request for Job is approved';
        RejReqJob: TextConst ENU = 'Approval Request for Transfer Order is rejected', ENG = 'Approval Request for Job is rejected';
        DelReqJob: TextConst ENU = 'Approval Request for Transfer Order is delegated', ENG = 'Approval Request for Job is delegated';
        SendForPendAppTxt: TextConst ENU = 'Status of Transfer Order changed to Pending approval', ENG = 'Status of Job changed to Pending approval';
        ReleaseJobTxt: TextConst ENU = 'Release Transfer Order', ENG = 'Release Transfer Order';
        ReOpenJobTxt: TextConst ENU = 'ReOpen Transfer Order', ENG = 'ReOpen Transfer Order';






    procedure RunWorkflowOnSendTOApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnApproveTOApproval'))
    end;


}
