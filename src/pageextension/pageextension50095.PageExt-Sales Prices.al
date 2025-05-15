pageextension 50095 pageextension50095 extends "Sales Prices"
{
    layout
    {
        addafter("Control 46")
        {
            field(Status; Status)
            {
            }
        }
    }
    actions
    {
        addafter(CopyPrices)
        {
            group(Approvals)
            {
                action("Send Approval Request")
                {
                    Caption = 'Send Approval Request';
                    Enabled = NOT OpenApprovalEntriesExist;
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction()
                    var
                        SalesPrice: Record "7002";
                    begin
                        //SalesPriceWorkflowMgt.OnSendSalesPriceForApprovalRequest(Rec);//1065
                        UserCheck;//1065
                        GetCurrentlySelectedLines(SalesPrice);
                        SalesPriceWorkflowMgt.TrySendSalesPriceLineApprovalRequests(SalesPrice);//1065
                    end;
                }
                action("Cancel Approval Request")
                {
                    Caption = 'Cancel Approval Request';
                    Enabled = OpenApprovalEntriesExist;
                    Image = Cancel;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction()
                    var
                        SalesPrice: Record "7002";
                    begin
                        //SalesPriceWorkflowMgt.OnCancelSalesPriceForApprovalRequest(Rec);//1065
                        UserCheck;//1065
                        GetCurrentlySelectedLines(SalesPrice);
                        SalesPriceWorkflowMgt.TryCancelSalesPriceLineApprovalRequests(SalesPrice);//1065
                    end;
                }
                action("Approval Entries")
                {
                    Image = Approvals;
                    Promoted = true;
                    PromotedCategory = Category4;

                    trigger OnAction()
                    begin
                        UserCheck;
                        ApprovalsMgmt.OpenApprovalEntriesPage(RECORDID);//1065
                    end;
                }
                action(ReOpen)
                {
                    Image = ReOpen;
                    Promoted = true;
                    PromotedCategory = Category5;

                    trigger OnAction()
                    var
                        SalesPrice: Record "7002";
                    begin
                        UserCheck;//1065
                        CurrPage.SETSELECTIONFILTER(SalesPrice);//1065
                        SalesPriceWorkflowMgt.ReOpenSalesPrice(SalesPrice);//1065
                    end;
                }
            }
        }
    }

    var
        OpenApprovalEntriesExist: Boolean;
        SalesPriceWorkflowMgt: Codeunit "50005";
        ApprovalsMgmt: Codeunit "1535";


        //Unsupported feature: Code Insertion on "OnAfterGetRecord".

        //trigger OnAfterGetRecord()
        //begin
        /*
        OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(RECORDID);//1065
        */
        //end;


        //Unsupported feature: Code Insertion on "OnDeleteRecord".

        //trigger OnDeleteRecord(): Boolean
        //begin
        /*
        UserCheck(); //ZT0207 09.09.2020
        */
        //end;


        //Unsupported feature: Code Insertion on "OnInsertRecord".

        //trigger OnInsertRecord(BelowxRec: Boolean): Boolean
        //begin
        /*
        UserCheck(); //ZT0207 09.09.2020
        */
        //end;


        //Unsupported feature: Code Insertion on "OnModifyRecord".

        //trigger OnModifyRecord(): Boolean
        //begin
        /*
        UserCheck(); //ZT0207 09.09.2020
        */
        //end;

    local procedure UserCheck()
    var
        UserSetup: Record "91";
    begin
        /*
        //IF (COMPANYNAME='PreGOLIVE') THEN BEGIN
          IF GUIALLOWED THEN BEGIN
            UserSetup.RESET;
            UserSetup.SETFILTER("User ID",USERID);
            IF UserSetup.FINDFIRST THEN BEGIN
             IF NOT UserSetup."Update Pricing"=TRUE THEN
               ERROR('Pricing update is not enabled for user ID:%1',USERID);
            END ELSE
              ERROR('Pricing update is not enabled for user ID:%1',USERID);
          END;
        //END;
        */
        //>> 1065
        IF GUIALLOWED THEN BEGIN
            UserSetup.GET(USERID);
            IF NOT UserSetup."Update Pricing" = TRUE THEN
                ERROR('Pricing update is not enabled for user ID:%1', USERID);
        END;
        //<< 1065

    end;

    local procedure "---1065---"()
    begin
    end;

    local procedure GetCurrentlySelectedLines(var SalesPrice: Record "7002"): Boolean
    begin
        CurrPage.SETSELECTIONFILTER(SalesPrice);
        EXIT(SalesPrice.FINDSET);
    end;
}

