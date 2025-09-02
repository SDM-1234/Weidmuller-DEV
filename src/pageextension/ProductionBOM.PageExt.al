pageextension 50026 ProductionBOM extends "Production BOM"
{
    layout
    {

    }
    actions
    {

        addlast("F&unctions")
        {

            group("Request Approval")
            {
                Caption = 'Request Approval';
                Image = SendApprovalRequest;
                action(SendApprovalRequest)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Send A&pproval Request';
                    //Enabled = not OpenApprovalEntriesExist and CanRequestApprovalForFlow;
                    Image = SendApprovalRequest;
                    ToolTip = 'Request approval of the document.';

                    trigger OnAction()
                    var
                        ProdBOMApprovalsMgmt: Codeunit "ProdBOM Approval Mgmt";
                    begin
                        //if ProdBOMApprovalsMgmt.CheckSalesApprovalPossible(Rec) then
                        ProdBOMApprovalsMgmt.OnSendRequestforApproval(Rec);
                    end;
                }
                action(CancelApprovalRequest)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Cancel Approval Re&quest';
                    //Enabled = CanCancelApprovalForRecord or CanCancelApprovalForFlow;
                    Image = CancelApprovalRequest;
                    ToolTip = 'Cancel the approval request.';

                    trigger OnAction()
                    var
                        ProdBOMApprovalsMgmt: Codeunit "ProdBOM Approval Mgmt";
                        WorkflowWebhookMgt: Codeunit "Workflow Webhook Management";
                    begin
                        ProdBOMApprovalsMgmt.OnCancelRequestForApproval(Rec);
                        WorkflowWebhookMgt.FindAndCancel(Rec.RecordId);
                    end;
                }
            }
        }
    }
}