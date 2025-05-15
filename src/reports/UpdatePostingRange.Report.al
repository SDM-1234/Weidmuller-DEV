report 50025 "Update Posting Range"
{
    DefaultLayout = RDLC;
    RDLCLayout = './UpdatePostingRange.rdlc';

    dataset
    {
        dataitem(DataItem1000000000; Table91)
        {

            trigger OnAfterGetRecord()
            begin
                "User Setup"."Allow Posting From" := 090122D;
                "User Setup".MODIFY;
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

