pageextension 50068 pageextension50068 extends "Purchase Invoice"
{
    layout
    {
        modify("Control 1102601000")
        {
            Visible = false;
        }
        modify("Control 115")
        {
            Visible = false;
        }
        modify("Control 5")
        {
            Visible = false;
        }
        modify("Control 15")
        {
            Visible = false;
        }
        modify("Control 91")
        {
            Visible = false;
        }
        modify("Control 108")
        {
            Visible = false;
        }
        modify("Control 138")
        {
            Visible = false;
        }
        modify("Control 1500014")
        {
            Visible = false;
        }
        modify("Control 1500010")
        {
            Visible = false;
        }
        modify("Control 1500012")
        {
            Visible = false;
        }
        modify("Control 1500029")
        {
            Visible = false;
        }
        modify("Transit Document2")
        {
            Visible = false;
        }
        modify("Control 1500040")
        {
            Visible = false;
        }
        modify("Control 1500036")
        {
            Visible = false;
        }
        modify("Control 1500034")
        {
            Visible = false;
        }
        modify("Control 1500035")
        {
            Visible = false;
        }
        modify("Control 1500039")
        {
            Visible = false;
        }
        modify("Control 1500045")
        {
            Visible = false;
        }
        modify("Control 1500052")
        {
            Visible = false;
        }
        modify("Control 1500022")
        {
            Visible = false;
        }
        modify("Control 1500005")
        {
            Visible = false;
        }
        modify("Control 1500021")
        {
            Visible = false;
        }
        modify("Control 1500018")
        {
            Visible = false;
        }
        modify("Control 1500019")
        {
            Visible = false;
        }
        addafter("Control 118")
        {
            field("Your Reference"; "Your Reference")
            {
            }
        }
    }
    actions
    {


        //Unsupported feature: Code Modification on "SendApprovalRequest(Action 142).OnAction".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        IF ApprovalsMgmt.CheckPurchaseApprovalsWorkflowEnabled(Rec) THEN
          ApprovalsMgmt.OnSendPurchaseDocForApproval(Rec);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        CheckAttachment(Rec);//ZE.SAGAR
        IF ApprovalsMgmt.CheckPurchaseApprovalsWorkflowEnabled(Rec) THEN
          ApprovalsMgmt.OnSendPurchaseDocForApproval(Rec);
        */
        //end;
    }
}

