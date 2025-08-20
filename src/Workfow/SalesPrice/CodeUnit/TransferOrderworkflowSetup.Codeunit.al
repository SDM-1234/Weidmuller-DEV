// codeunit 50013 "Transfer Order workflow Setup"
// {
//     trigger OnRun()
//     begin

//     end;


//     [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Setup", 'OnAddWorkflowCategoriesToLibrary', '', true, true)]
//     local procedure OnAddWorkflowCategoriesToLibrary()
//     begin
//         workflowsetup.InsertWorkflowCategory(workflowCategoryCodeLbl, workflowCategoryDescLbl);
//     end;

//     [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Setup", 'OnAfterInsertApprovalsTableRelations', '', false, false)]
//     local procedure OnAfterInsertApprovalsTableRelations()
//     begin
//         workflowsetup.InsertTableRelation(Database::"Transfer Header", 0, DATABASE::"Approval Entry", approvalEntry.FieldNo("Record ID to Approve"));
//     end;

//     [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Setup", 'OnInsertWorkflowTemplates', '', true, true)]
//     local procedure OnInsertWorkflowTemplates()
//     begin
//         InsertTransferOrderTemplate()
//     end;

//     procedure InsertTransferOrderTemplate()
//     var
//         workflow: record Workflow;
//     begin
//         workflowsetup.InsertWorkflowTemplate(workflow, WorkflowTemplateCodeLbl, WorkflowTemplateDescLbl, workflowCategoryCodeLbl);
//         InsertTransferOrderApprovalWorkFlowDetails(workflow);
//         workflowsetup.MarkWorkflowAsTemplate(workflow);
//     end;

//     procedure InsertTransferOrderApprovalWorkFlowDetails(var workflow: record Workflow)
//     var
//         TransferHeader: record "Transfer Header";
//         WorkflowStepArgument: Record "Workflow Step Argument";
//         workflowEventHandling: Codeunit "Price Workflow Evt Handling";
//         BlankDateFormula: DateFormula;

//     begin
//         workflowsetup.InitWorkflowStepArgument(WorkflowStepArgument, WorkflowStepArgument."Approver Type"::Approver, WorkflowStepArgument."Approver Limit Type"::"Direct Approver", 0, '', BlankDateFormula, true);


//         workflowsetup.InsertDocApprovalWorkflowSteps(workflow, BuildYoutubeTypeConditions(TransferHeader."Approval Status"::Created), workflowEventHandling.RunWorkflowOnSendPriceForApprovalCode(),
//         BuildYoutubeTypeConditions(TransferHeader."Approval Status"::), workflowEventHandling.RunWorkflowOnCancelPriceForApprovalCode(), WorkflowStepArgument, true);
//     end;

//     local procedure BuildYoutubeTypeConditions(Status: Enum Status): Text

//     var
//         TransferHeader: record "Transfer Header";
//     begin
//         TransferHeader.SetRange(Status, Status);
//         exit(StrSubstNo(WorkFlowCondLbl, workflowsetup.Encode((TransferHeader.GetView(false)))));
//     end;


//     var
//         approvalEntry: Record "Approval Entry";
//         workflowsetup: Codeunit "Workflow Setup";
//         WorkflowTemplateCodeLbl: TextConst ENU = 'PriceWF';
//         WorkflowTemplateDescLbl: TextConst ENU = 'Price Workflow Template';
//         workflowCategoryCodeLbl: TextConst ENU = 'Weidmuller';
//         workflowCategoryDescLbl: TextConst ENU = 'Weidmuller Workflow Category';
//         WorkFlowCondLbl: label '<?xml version="1.0" encoding="utf-8" standalone="yes"?><ReportParameters><DataItems><DataItem name="Price Header">%1</DataItem></DataItems></ReportParameters>', Locked = true;

// }