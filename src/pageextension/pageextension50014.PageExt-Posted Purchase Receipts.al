pageextension 50014 pageextension50014 extends "Posted Purchase Receipts"
{
    actions
    {
        addafter("Action 17")
        {
            group()
            {
                action("Goods Receipt Note")
                {
                    Image = "report";
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction()
                    var
                        GoodsReceiptNote: Report "50006";
                        L_PurchRcptHeader: Record "120";
                    begin
                        //ZE_LIJO 25.06.2019
                        //<<
                        CurrPage.SETSELECTIONFILTER(Rec);
                        PurchRcptHdr.RESET;
                        PurchRcptHdr.COPY(Rec);
                        CLEAR(Rec);
                        REPORT.RUN(50021, TRUE, FALSE, PurchRcptHdr);
                        //>>
                    end;
                }
            }
        }
    }

    var
        PurchRcptHdr: Record "120";
}

