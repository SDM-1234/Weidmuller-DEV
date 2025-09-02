codeunit 50157 "ProdBom Workflow Response"
{
    trigger OnRun()
    begin

    end;


    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Response Handling", 'OnOpenDocument', '', false, false)]
    local procedure OnOpenDocument(var Handled: Boolean; RecRef: RecordRef)
    Var
        ProdBOMHeader: record "Production BOM Header";
    begin
        case
             RecRef.Number of
            DATABASE::"Transfer Header":
                BEGIN
                    RecRef.SetTable(ProdBOMHeader);
                    ProdBOMHeader.Validate("Status", ProdBOMHeader."Status"::"Under Development");
                    ProdBOMHeader.Modify(true);
                    Handled := true;
                END;

        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Response Handling", 'OnReleaseDocument', '', false, false)]
    local procedure OnReleaseDocument(var Handled: Boolean; RecRef: RecordRef)
    Var
        ProdBOMHeader: record "Production BOM Header";
    begin
        case
             RecRef.Number of
            DATABASE::"Transfer Header":
                BEGIN
                    RecRef.SetTable(ProdBOMHeader);
                    ProdBOMHeader.Validate("Status", ProdBOMHeader."Status"::Certified);
                    ProdBOMHeader.Modify(true);
                    Handled := true;
                END;

        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnSetStatusToPendingApproval', '', false, false)]
    local procedure OnSetStatusToPendingApproval(var IsHandled: Boolean; var Variant: Variant; RecRef: RecordRef)
    var
        ProdBOMHeader: record "Production BOM Header";
    begin
        case
             RecRef.Number of
            DATABASE::"Transfer Header":
                BEGIN
                    RecRef.SetTable(ProdBOMHeader);
                    ProdBOMHeader.Validate("Status", ProdBOMHeader."Status"::"Pending Approval");
                    ProdBOMHeader.Modify(true);
                    IsHandled := true;
                END;
        end;
    end;


    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Response Handling", 'OnAddWorkflowResponsePredecessorsToLibrary', '', false, false)]
    local procedure OnAddWorkflowResponsePredecessorsToLibrary(ResponseFunctionName: Code[128])
    begin
        case ResponseFunctionName of
            workflowResponseHandling.SetStatusToPendingApprovalCode():
                workflowResponseHandling.AddResponsePredecessor(workflowResponseHandling.SetStatusToPendingApprovalCode(), workflowHandling.RunWorkflowOnSendPriceForApprovalCode());
            workflowResponseHandling.CancelAllApprovalRequestsCode():
                workflowResponseHandling.AddResponsePredecessor(workflowResponseHandling.CancelAllApprovalRequestsCode(), workflowHandling.RunWorkflowOnCancelPriceForApprovalCode());
            workflowResponseHandling.OpenDocumentCode():
                workflowResponseHandling.AddResponsePredecessor(workflowResponseHandling.OpenDocumentCode(), workflowHandling.RunWorkflowOnSendPriceForApprovalCode());
        end

    end;

    var
        workflowResponseHandling: Codeunit "Workflow Response Handling";
        workflowHandling: Codeunit "Price Workflow Evt Handling";
}