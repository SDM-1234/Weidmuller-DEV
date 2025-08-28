codeunit 50016 "Transfer Workflow Evt Handling"

{
    trigger OnRun()
    begin

    end;

    procedure RunWorkflowOnSendTransferForApprovalCode(): code[128]
    begin
        exit('RUNWORKFLOWONSENDTRANSFERFORAPPROVAL')
    end;

    procedure RunWorkflowOnCancelTransferForApprovalCode(): code[128]
    begin
        exit('RUNWORKFLOWONCANCELTRANSFERFORAPPROVAL')
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Event Handling", 'OnAddWorkflowEventsToLibrary', '', true, true)]
    local procedure OnAddWorkflowEventsToLibrary()
    begin
        workflowEventHandling.AddEventToLibrary(RunWorkflowOnSendTransferForApprovalCode(), DATABASE::"Transfer Header", TransferSendApprovalLbl, 0, false);
        workflowEventHandling.AddEventToLibrary(RunWorkflowOnCancelTransferForApprovalCode(), DATABASE::"Transfer Header", TransferCancelApprovalLbl, 0, false);
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Price Approval Mgmt", 'OnSendRequestForApproval', '', false, false)]
    local procedure OnSendRequestForApproval(var TransferHeader: Record "Transfer Header")
    begin
        workflowMgt.HandleEvent(RunWorkflowOnSendTransferForApprovalCode(), TransferHeader);
    end;



    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Price Approval Mgmt", 'OnCancelRequestForApproval', '', false, false)]
    local procedure OnCancelRequestForApproval(var PriceHeader: Record "Price List Header")
    begin

        workflowMgt.HandleEvent(RunWorkflowOnCancelTransferForApprovalCode(), PriceHeader);
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Event Handling", 'OnAddWorkflowEventPredecessorsToLibrary', '', false, false)]
    local procedure OnAddWorkflowEventPredecessorsToLibrary(EventFunctionName: Code[128])
    begin
        case EventFunctionName of
            RunWorkflowOnCancelTransferForApprovalCode():
                workflowEventHandling.AddEventPredecessor(RunWorkflowOnCancelTransferForApprovalCode(), RunWorkflowOnSendTransferForApprovalCode());
            workflowEventHandling.RunWorkflowOnApproveApprovalRequestCode():
                workflowEventHandling.AddEventPredecessor(workflowEventHandling.RunWorkflowOnRejectApprovalRequestCode(), RunWorkflowOnSendTransferForApprovalCode())
        end;
    end;

    procedure isPricepprovalWorkflowEnabled(Var TransferHeader: Record "Transfer Header"): Boolean
    begin
        exit(workflowMgt.CanExecuteWorkflow(TransferHeader, RunWorkflowOnSendTransferForApprovalCode()))
    end;


    procedure IsTransferPendingApproval(Var TransferHeader: Record "Transfer Header"): Boolean
    begin
        exit(isPricepprovalWorkflowEnabled(TransferHeader));
    end;



    procedure CheckInvcomingApprovalWorkFlowEnabled(Var TransferHeader: Record "Transfer Header"): Boolean
    begin
        if not IsTransferPendingApproval(TransferHeader) then
            error(youtubeApprovalExistErr);
        exit(true);
    end;

    var
        workflowMgt: Codeunit "Workflow Management";
        workflowEventHandling: Codeunit "Workflow Event Handling";
        PriceSendApprovalLbl: Label ' Transfer Approval Requested';
        PriceCancelApprovalLbl: Label ' Transfer Approval Cancelled';
        youtubeApprovalExistErr: Label 'No Approval Workflow For This Document';
}