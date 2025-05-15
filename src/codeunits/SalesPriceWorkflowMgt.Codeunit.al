codeunit 50005 "Sales Price Workflow Mgt"
{

    trigger OnRun()
    begin
    end;

    var
        NoSalesPricePriceWorkfloeEnabledErr: Label 'This record is not supported by related Sales Price approval workflow.';
        WorkFlowMgt: Codeunit "1501";
        SalesPriceWorkflowResponse: Codeunit "50006";
        ApprovalsMgmt: Codeunit "1535";
        NoApprovalsSentMsg: Label 'No approval requests have been sent, either because they are already sent or because related workflows do not support the sales price.';
        PendingApprovalForSelectedLinesMsg: Label 'Approval requests have been sent.';
        PendingApprovalForSomeSelectedLinesMsg: Label 'Approval requests have been sent.\\Requests for some journal lines were not sent, either because they are already sent or because related workflows do not support the sales price.';
        ApprovalReqCanceledForSelectedLinesMsg: Label 'The approval request for the selected record has been canceled.';

    [IntegrationEvent(false, false)]
    [Scope('Internal')]
    procedure OnSendSalesPriceForApprovalRequest(var SalesPrice: Record "7002")
    begin
    end;

    [IntegrationEvent(false, false)]
    [Scope('Internal')]
    procedure OnCancelSalesPriceForApprovalRequest(var SalesPrice: Record "7002")
    begin
    end;

    [Scope('Internal')]
    procedure CheckSalesPriceApprovalWorkflowEnabled(var SalesPrice: Record "7002"): Boolean
    begin
        IF NOT IsSalesPriceApprovalWorkflowEnabled(SalesPrice) THEN
            ERROR(NoSalesPricePriceWorkfloeEnabledErr);

        EXIT(TRUE);
    end;

    local procedure IsSalesPriceApprovalWorkflowEnabled(var SalesPrice: Record "7002"): Boolean
    begin
        EXIT(WorkFlowMgt.CanExecuteWorkflow(SalesPrice, SalesPriceWorkflowResponse.RunWorkflowOnSendSalesPriceForApprovalCode));
    end;

    [EventSubscriber(ObjectType::Codeunit, 1535, 'OnAfterPopulateApprovalEntryArgument', '', false, false)]
    local procedure OnSalesPricePopulateApprovalEntryArgument(var RecRef: RecordRef; var ApprovalEntryArgument: Record "454")
    var
        SalesPrice: Record "7002";
    begin
        CASE RecRef.NUMBER OF
            DATABASE::"Sales Price":
                BEGIN
                    RecRef.SETTABLE(SalesPrice);
                    ApprovalEntryArgument."Document No." := SalesPrice."Item No.";
                END;
        END;
    end;

    [EventSubscriber(ObjectType::Table, 7002, 'OnBeforeDeleteEvent', '', false, false)]
    local procedure OnBeforeDeleteSalesPriceRecord(var Rec: Record "7002"; RunTrigger: Boolean)
    begin
        /*
        IF Rec.Status <> Rec.Status::Open THEN
          Rec.TESTFIELD(Status,Rec.Status::Open);
        
        */

    end;

    [EventSubscriber(ObjectType::Table, 7002, 'OnBeforeRenameEvent', '', false, false)]
    local procedure OnBeforeRenameSalesPriceRecord(var Rec: Record "7002"; var xRec: Record "7002"; RunTrigger: Boolean)
    begin
        IF Rec.Status <> Rec.Status::Open THEN
            Rec.TESTFIELD(Status, Rec.Status::Open);
    end;

    [Scope('Internal')]
    procedure ReOpenSalesPrice(var SalesPrice: Record "7002")
    begin
        SalesPrice.SETFILTER(Status, '%1', SalesPrice.Status::Released);
        IF SalesPrice.FINDSET THEN
            REPEAT
                //SalesPrice.VALIDATE(Status,SalesPrice.Status::Open);
                SalesPrice.Status := SalesPrice.Status::Open;
                SalesPrice.MODIFY;
            UNTIL SalesPrice.NEXT = 0;
    end;

    [Scope('Internal')]
    procedure TrySendSalesPriceLineApprovalRequests(var SalesPrice: Record "7002")
    var
        LinesSent: Integer;
    begin
        IF SalesPrice.COUNT = 1 THEN
            CheckSalesPriceApprovalWorkflowEnabled(SalesPrice);

        REPEAT
            IF WorkFlowMgt.CanExecuteWorkflow(SalesPrice,
                 SalesPriceWorkflowResponse.RunWorkflowOnSendSalesPriceForApprovalCode) AND
               NOT ApprovalsMgmt.HasOpenApprovalEntries(SalesPrice.RECORDID)
            THEN BEGIN
                OnSendSalesPriceForApprovalRequest(SalesPrice);
                LinesSent += 1;
            END;
        UNTIL SalesPrice.NEXT = 0;

        CASE LinesSent OF
            0:
                MESSAGE(NoApprovalsSentMsg);
            SalesPrice.COUNT:
                MESSAGE(PendingApprovalForSelectedLinesMsg);
            ELSE
                MESSAGE(PendingApprovalForSomeSelectedLinesMsg);
        END;
    end;

    [Scope('Internal')]
    procedure TryCancelSalesPriceLineApprovalRequests(var SalesPrice: Record "7002")
    begin
        REPEAT
            IF ApprovalsMgmt.HasOpenApprovalEntries(SalesPrice.RECORDID) THEN
                OnCancelSalesPriceForApprovalRequest(SalesPrice);
        UNTIL SalesPrice.NEXT = 0;
        MESSAGE(ApprovalReqCanceledForSelectedLinesMsg);
    end;
}

