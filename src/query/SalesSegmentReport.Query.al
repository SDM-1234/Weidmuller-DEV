query 50000 "Sales Segment Report"
{
    QueryType = Normal;

    elements
    {
        dataitem(SalesInvHdr; "Sales Invoice Header")
        {
            filter(posting_date; "Posting Date")
            {

            }
            dataitem(SalesSegment; "Sales Segment")
            {
                DataItemLink = "Posted Sales Invoice No." = SalesInvHdr."No.";
                SqlJoinType = InnerJoin;
                column(industry_group_code; "Industry Group Code")
                {

                }
                column(Amount; Amount)
                {
                    Method = Sum;
                }
            }
        }
    }
    trigger OnBeforeOpen()
    begin

    end;
}