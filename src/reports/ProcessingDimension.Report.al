report 50020 "Processing Dimension"
{
    ProcessingOnly = true;
    UseRequestPage = false;

    dataset
    {
        dataitem(DataItem1000000000; Table352)
        {
            DataItemTableView = WHERE (Table ID=FILTER(27),
                                      Dimension Code=FILTER(VALUATION CLASS));

            trigger OnAfterGetRecord()
            begin
                IF ("Default Dimension"."Table ID" = 27 ) AND ("Default Dimension"."Dimension Code"='VALUATION CLASS') THEN
                  DELETE
                ELSE
                  CurrReport.SKIP;
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
}

