report 50028 "Update Sales Line"
{
    DefaultLayout = RDLC;
    RDLCLayout = './UpdateSalesLine.rdlc';

    dataset
    {
        dataitem(DataItem1000000000; Table2000000026)
        {
            DataItemTableView = WHERE (Number = CONST (1));

            trigger OnAfterGetRecord()
            begin
                SalesLine.SETRANGE("Document Type", SalesLine."Document Type"::Order);
                IF SalesLine.FINDFIRST THEN
                    REPEAT
                        SalesHeader.GET(SalesLine."Document Type", SalesLine."Document No.");
                        SalesLine.Status := SalesHeader.Status;
                        SalesLine."Payment Terms Code" := SalesHeader."Payment Terms Code";
                        SalesLine.MODIFY;

                    UNTIL SalesLine.NEXT = 0;
            end;
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
    }

    var
        SalesLine: Record "37";
        SalesHeader: Record "36";
}

