pageextension 50022 TransferOrder extends "Transfer Order"
{
    layout
    {
        addafter(Status)
        {
            field("Approval Status"; Rec."Approval Status")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Approval Status field.', Comment = '%';
            }
        }
    }
    actions
    {
        addafter("Re&lease")
        {
            action("Send for Approval")
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                Image = SendApprovalRequest;
                ToolTip = 'Executes the Send for Approval action.';

                trigger OnAction()
                var
                    PriceAppMgt: Codeunit "Price Approval Mgmt";
                begin
                    //PriceAppMgt.OnSendTOforApproval(Rec);
                end;
            }
        }
    }
}
