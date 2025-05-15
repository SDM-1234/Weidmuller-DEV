codeunit 50006 "Sales Price Workflow Response"
{

    trigger OnRun()
    begin
    end;

    var
        WorkflowManagement: Codeunit "1501";
        WorkflowEventHandling: Codeunit "1520";
        SalesPriceSendForApprovalEventDescTxt: Label 'Approval of a Sales Price document is requested.';
        SalesPriceApprovalRequestCancelEventDescTxt: Label 'An approval request for a Sales Price is canceled.';
        WorkflowResponseHandling: Codeunit "1521";

    [Scope('Internal')]
    procedure RunWorkflowOnSendSalesPriceForApprovalCode(): Code[128]
    begin
        EXIT(UPPERCASE('RunWorkflowOnSendSalesPriceForApproval'));
    end;

    [Scope('Internal')]
    procedure RunWorkflowOnCancelSalesPriceForApprovalCode(): Code[128]
    begin
        EXIT(UPPERCASE('RunWorkflowOnCancelSalesPriceForApproval'));
    end;

    [EventSubscriber(ObjectType::Codeunit, 50005, 'OnSendSalesPriceForApprovalRequest', '', false, false)]
    local procedure RunWorkflowOnSendSalesPriceForApproval(var SalesPrice: Record "7002")
    begin
        WorkflowManagement.HandleEvent(RunWorkflowOnSendSalesPriceForApprovalCode, SalesPrice);
    end;

    [EventSubscriber(ObjectType::Codeunit, 50005, 'OnCancelSalesPriceForApprovalRequest', '', false, false)]
    local procedure RunWorkflowOnCancelSalesPriceForApproval(var SalesPrice: Record "7002")
    begin
        WorkflowManagement.HandleEvent(RunWorkflowOnCancelSalesPriceForApprovalCode, SalesPrice);
    end;

    [EventSubscriber(ObjectType::Codeunit, 1520, 'OnAddWorkflowEventsToLibrary', '', false, false)]
    local procedure AddSalesPriceWorkflowEventToLibrary()
    begin
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnSendSalesPriceForApprovalCode, DATABASE::"Sales Price",
                                                  SalesPriceSendForApprovalEventDescTxt, 0, FALSE);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnCancelSalesPriceForApprovalCode, DATABASE::"Sales Price",
                                                  SalesPriceApprovalRequestCancelEventDescTxt, 0, FALSE);
    end;

    [EventSubscriber(ObjectType::Codeunit, 1520, 'OnAddWorkflowEventPredecessorsToLibrary', '', false, false)]
    local procedure OnAddSalesPriceWorkflowEventPredecessorsToLibrary(EventFunctionName: Code[128])
    begin
        CASE EventFunctionName OF
            RunWorkflowOnCancelSalesPriceForApprovalCode():
                WorkflowEventHandling.AddEventPredecessor(RunWorkflowOnCancelSalesPriceForApprovalCode(), RunWorkflowOnSendSalesPriceForApprovalCode());
            WorkflowEventHandling.RunWorkflowOnApproveApprovalRequestCode():
                WorkflowEventHandling.AddEventPredecessor(WorkflowEventHandling.RunWorkflowOnApproveApprovalRequestCode(), RunWorkflowOnSendSalesPriceForApprovalCode());
            WorkflowEventHandling.RunWorkflowOnRejectApprovalRequestCode():
                WorkflowEventHandling.AddEventPredecessor(WorkflowEventHandling.RunWorkflowOnRejectApprovalRequestCode(), RunWorkflowOnSendSalesPriceForApprovalCode());
            WorkflowEventHandling.RunWorkflowOnDelegateApprovalRequestCode():
                WorkflowEventHandling.AddEventPredecessor(WorkflowEventHandling.RunWorkflowOnDelegateApprovalRequestCode(), RunWorkflowOnSendSalesPriceForApprovalCode());
        END;
    end;

    [EventSubscriber(ObjectType::Codeunit, 1521, 'OnAddWorkflowResponsePredecessorsToLibrary', '', false, false)]
    local procedure OnSalesPriceWorkflowResponsePredecessorsToLibrary(ResponseFunctionName: Code[128])
    begin
        CASE ResponseFunctionName OF
            WorkflowResponseHandling.SetStatusToPendingApprovalCode():
                WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.SetStatusToPendingApprovalCode(), RunWorkflowOnSendSalesPriceForApprovalCode());
            WorkflowResponseHandling.SendApprovalRequestForApprovalCode():
                WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.SendApprovalRequestForApprovalCode(), RunWorkflowOnSendSalesPriceForApprovalCode());
            WorkflowResponseHandling.CancelAllApprovalRequestsCode():
                WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.CancelAllApprovalRequestsCode(), RunWorkflowOnCancelSalesPriceForApprovalCode());
            WorkflowResponseHandling.OpenDocumentCode():
                WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.OpenDocumentCode(), RunWorkflowOnCancelSalesPriceForApprovalCode());
            WorkflowResponseHandling.ReleaseDocumentCode():
                WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.ReleaseDocumentCode(), RunWorkflowOnSendSalesPriceForApprovalCode());
            WorkflowResponseHandling.RejectAllApprovalRequestsCode():
                WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.RejectAllApprovalRequestsCode(), RunWorkflowOnSendSalesPriceForApprovalCode());

        END;
    end;

    [EventSubscriber(ObjectType::Codeunit, 1535, 'OnSetStatusToPendingApproval', '', false, false)]
    local procedure OnSetSalesPriceStatusToPendingApproval(RecRef: RecordRef; var Variant: Variant; var IsHandled: Boolean)
    var
        SalesPrice: Record "7002";
    begin
        CASE RecRef.NUMBER() OF
            DATABASE::"Sales Price":
                BEGIN
                    RecRef.SETTABLE(SalesPrice);
                    SalesPrice.VALIDATE(Status, SalesPrice.Status::"Pending for Approval");
                    SalesPrice.MODIFY(TRUE);
                    Variant := SalesPrice;
                    IsHandled := TRUE;
                END;
        END;
    end;

    [EventSubscriber(ObjectType::Codeunit, 1521, 'OnOpenDocument', '', false, false)]
    local procedure OnOpenSalesPriceDocument(RecRef: RecordRef; var IsHandled: Boolean)
    var
        SalesPrice: Record "7002";
    begin
        CASE RecRef.NUMBER() OF
            DATABASE::"Sales Price":
                BEGIN
                    RecRef.SETTABLE(SalesPrice);
                    SalesPrice.VALIDATE(Status, SalesPrice.Status::Open);
                    SalesPrice.MODIFY(TRUE);
                    IsHandled := TRUE;
                END;
        END;
    end;

    [EventSubscriber(ObjectType::Codeunit, 1521, 'OnReleaseDocument', '', false, false)]
    local procedure OnReleaseSalesPriceDocument(RecRef: RecordRef; var IsHandled: Boolean)
    var
        SalesPrice: Record "7002";
        SalesPriceManagement: Codeunit "50007";
    begin
        CASE RecRef.NUMBER() OF
            DATABASE::"Sales Price":
                BEGIN
                    RecRef.SETTABLE(SalesPrice);
                    SalesPrice.VALIDATE(Status, SalesPrice.Status::Released);
                    SalesPrice.MODIFY(TRUE);
                    IsHandled := TRUE;
                    SalesPriceManagement.UpDateQuoteAndOrderPrice(SalesPrice);
                END;
        END;
    end;
}

