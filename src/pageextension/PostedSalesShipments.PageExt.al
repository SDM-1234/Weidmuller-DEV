pageextension 50011 pageextension50011 extends "Posted Sales Shipments"
{
    layout
    {
        addafter("Control 1102601010")
        {
            field("Order Date"; "Order Date")
            {
            }
            field("Order No."; "Order No.")
            {
            }
            field("Payment Discount %"; "Payment Discount %")
            {
            }
            field("External Document No."; "External Document No.")
            {
            }
        }
    }
    actions
    {
        addafter("Action 22")
        {
            action("Packing List")
            {
                Image = "report";
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    PackingList: Report "50004";
                begin
                    //ZE_LIJO 25.06.2019
                    //<<
                    CurrPage.SETSELECTIONFILTER(Rec);
                    SalShpHdr.RESET;
                    SalShpHdr.COPY(Rec);
                    CLEAR(Rec);
                    REPORT.RUN(50017, TRUE, FALSE, SalShpHdr);
                    //>>
                end;
            }
        }
    }

    var
        SalShpHdr: Record "110";
}

