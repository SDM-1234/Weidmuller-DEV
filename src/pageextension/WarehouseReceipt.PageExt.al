pageextension 50084 WarehouseReceipt extends "Warehouse Receipt"
{
    layout
    {


        modify("Posting Date")
        {
            trigger OnAfterValidate()
            var
                myInt: Integer;
            begin
                CurrPage."BinContent FactBox".PAGE.GetPostingDate(Rec."Posting Date", Rec."Location Code");

            end;
        }
        addafter("Assignment Date")
        {
            field("EAN No."; Rec."EAN No.")
            {
                ApplicationArea = All;

                trigger OnValidate()
                begin
                    CurrPage.WhseReceiptLines.PAGE.UpdateByEAN(Rec);
                end;
            }
        }
        addafter(Control1900383207)
        {
            part("BinContent FactBox"; 50000)
            {
                Caption = 'BinContent FactBox';
                //Provider = 97;
                //Provider = "97";

                //SubPageLink = ;
                ApplicationArea = All;
            }
        }
        addlast(General)
        {
            field(WhseRecptApprovalStatus; WhseRecptApprovalStatus)
            {
                ApplicationArea = All;
                Caption = 'Approval Status';
                Editable = false;
                Visible = true;
                ToolTip = 'Specifies the approval status for Warehouse Receipt.';
            }
        }
    }
    actions
    {
        addafter(CalculateCrossDock)
        {
            action(ClearBins)
            {
                Caption = 'ClearBins';
                ApplicationArea = All;
                ToolTip = 'Clear all the bins in the warehouse receipt lines.';

                trigger OnAction()
                begin
                    Rec.ClearBins();
                end;
            }
        }
        addafter("&Receipt")
        {
            group("Request Approval")
            {
                Caption = 'Request Approval';
                group(SendApprovalRequest)
                {
                    Caption = 'Send Approval Request';
                    Image = SendApprovalRequest;
                    action(SendApprovalRequestJournalLine)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Selected Journal Lines';
                        Enabled = EnabledWhseRecptWorkflowsExist;
                        Image = SendApprovalRequest;
                        ToolTip = 'Send selected journal lines for approval.';

                        trigger OnAction()
                        var
                            ApprovalsMgmt: Codeunit "Whse Receipt Approval Mgmt";
                        begin
                            ApprovalsMgmt.OnSendRequestforApproval(Rec);
                        end;
                    }
                }
                group(CancelApprovalRequest)
                {
                    Caption = 'Cancel Approval Request';
                    Image = Cancel;
                    action(CancelApprovalRequestJournalLine)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Selected Journal Lines';
                        Enabled = EnabledWhseRecptWorkflowsExist;
                        Image = CancelApprovalRequest;
                        ToolTip = 'Cancel sending selected journal lines for approval.';

                        trigger OnAction()
                        var
                            ApprovalsMgmt: Codeunit "Whse Receipt Approval Mgmt";
                        begin
                            ApprovalsMgmt.OnCancelRequestForApproval(Rec);
                        end;
                    }
                }
            }
            group(Approval)
            {
                Caption = 'Approval';
                action(Approve)
                {
                    ApplicationArea = All;
                    Caption = 'Approve';
                    Image = Approve;
                    ToolTip = 'Approve the requested changes.';
                    Visible = OpenApprovalEntriesExistForCurrUser;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalsMgmt.ApproveRecordApprovalRequest(Rec.RecordId);
                    end;
                }
                action(Reject)
                {
                    ApplicationArea = All;
                    Caption = 'Reject';
                    Image = Reject;
                    ToolTip = 'Reject the approval request.';
                    Visible = OpenApprovalEntriesExistForCurrUser;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalsMgmt.RejectRecordApprovalRequest(Rec.RecordId);
                    end;
                }
                action(Delegate)
                {
                    ApplicationArea = All;
                    Caption = 'Delegate';
                    Image = Delegate;
                    ToolTip = 'Delegate the approval to a substitute approver.';
                    Visible = OpenApprovalEntriesExistForCurrUser;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalsMgmt.DelegateRecordApprovalRequest(Rec.RecordId);
                    end;
                }
            }
        }

        addlast(Promoted)
        {
            group("Category_Request Approval")
            {
                Caption = 'Request Approval';

                group("Category_Send Approval Request")
                {
                    Caption = 'Send Approval Request';
                    actionref(SendApprovalRequestJournalLine_Promoted; SendApprovalRequestJournalLine)
                    {
                    }
                }
                group("Category_Cancel Approval Request")
                {
                    Caption = 'Cancel Approval Request';
                    actionref(CancelApprovalRequestJournalLine_Promoted; CancelApprovalRequestJournalLine)
                    {
                    }
                }
            }
        }
        addlast(Category_Category5)
        {
            actionref(ClearBins_Promoted; ClearBins)
            {
            }
        }
    }

    var
        ApprovalMgmt: Codeunit "Approval Mgt. WM";
        WorkflowManagement: Codeunit "Workflow Management";
        WorkflowEventHandling: Codeunit "WhseRecpt WF Evt Handling";
        WhseRecptApprovalStatus: Text[20];
        EnabledWhseRecptWorkflowsExist: Boolean;
        OpenApprovalEntriesExistForCurrUser: Boolean;

    trigger OnAfterGetCurrRecord()
    var
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    begin
        CurrPage.WhseReceiptLines.PAGE.UpdateByEAN(Rec);
        CurrPage."BinContent FactBox".PAGE.GetPostingDate(Rec."Posting Date", Rec."Location Code");
        OpenApprovalEntriesExistForCurrUser := ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(Rec.RecordId);
        ApprovalMgmt.GetApprovalStatus(Rec, WhseRecptApprovalStatus, EnabledWhseRecptWorkflowsExist);
    end;

    trigger OnAfterGetRecord()
    begin
        ApprovalMgmt.GetApprovalStatus(Rec, WhseRecptApprovalStatus, EnabledWhseRecptWorkflowsExist);
    end;

    trigger OnOpenPage()
    begin
        EnabledWhseRecptWorkflowsExist := WorkflowManagement.EnabledWorkflowExist(DATABASE::"Warehouse Receipt Header", WorkflowEventHandling.RunWorkflowOnSendWhseReceiptForApprovalCode());
    end;

    trigger OnModifyRecord(): Boolean
    var
        ApprovalStatusName: Text[20];
    begin
        ApprovalMgmt.GetApprovalStatus(Rec, ApprovalStatusName, EnabledWhseRecptWorkflowsExist);
        if ApprovalStatusName = 'Approved' then
            Error('You cannot modify an approved warehouse receipt.');
    end;

    trigger OnDeleteRecord(): Boolean
    var
        ApprovalStatusName: Text[20];
    begin
        ApprovalMgmt.GetApprovalStatus(Rec, ApprovalStatusName, EnabledWhseRecptWorkflowsExist);
        if ApprovalStatusName = 'Approved' then
            Error('You cannot delete an approved warehouse receipt.');
    end;
}

