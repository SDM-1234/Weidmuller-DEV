query 50000 "Sales Segment Report"
{
    QueryType = Normal;

    elements
    {
        dataitem(Customer; Customer)
        {
            column(CustNo; "No.")
            {
            }
            dataitem(SalesInvHdr; "Sales Invoice Header")
            {
                DataItemLink = "Sell-to Customer No." = Customer."No.";
                SqlJoinType = InnerJoin;
                filter(posting_date; "Posting Date")
                {

                }
                dataitem(SalesInvLine; "Sales Invoice Line")
                {
                    DataItemLink = "Document No." = SalesInvHdr."No.";
                    DataItemTableFilter = Type = const(Item);
                    SqlJoinType = InnerJoin;
                    column(Amount; Amount)
                    {
                        Method = Sum;
                    }
                    dataitem(Detailed_GST_Ledger_Entry; "Detailed GST Ledger Entry")
                    {
                        DataItemLink = "Document No." = SalesInvHdr."No.",
                                       "Document Line No." = SalesInvLine."Line No.",
                                       "Source No." = Customer."No.";
                        SqlJoinType = InnerJoin;
                        column(GSTAmount; "GST Amount")
                        {
                            Method = Sum;
                            ReverseSign = true;
                        }
                    }
                }
            }
        }
    }
    trigger OnBeforeOpen()
    begin

    end;
}