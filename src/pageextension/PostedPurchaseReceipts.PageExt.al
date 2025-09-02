pageextension 50014 PostedPurchaseReceipts extends "Posted Purchase Receipts"
{
    actions
    {
        addafter("&Print")
        {
            group(GRN)
            {
                action("Goods Receipt Note")
                {
                    Image = Report;
                    Promoted = true;
                    PromotedCategory = Process;
                    ApplicationArea = All;
                    ToolTip = 'Executes the Goods Receipt Note action.';

                    trigger OnAction()
                    var
                        GoodsReceiptNote: Report GoodsReceiptNote;
                        L_PurchRcptHeader: Record "Purch. Rcpt. Header";
                    begin
                        CurrPage.SETSELECTIONFILTER(Rec);
                        PurchRcptHdr.RESET();
                        PurchRcptHdr.COPY(Rec);
                        CLEAR(Rec);
                        REPORT.RUN(50006, TRUE, FALSE, PurchRcptHdr);
                    end;
                }
            }
        }
    }

    var
        PurchRcptHdr: Record "Purch. Rcpt. Header";
}

