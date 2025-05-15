pageextension 50008 pageextension50008 extends "Posted Purchase Receipt"
{
    layout
    {
        addafter("Control 56")
        {
            field("Entry Point"; "Entry Point")
            {
            }
        }
    }
    actions
    {
        addafter("Action 48")
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
                        L_PurchRcptHeader.RESET;
                        L_PurchRcptHeader.SETRANGE("No.", "No.");
                        GoodsReceiptNote.SETTABLEVIEW(L_PurchRcptHeader);
                        GoodsReceiptNote.RUN;
                    end;
                }
            }
        }
    }
}

