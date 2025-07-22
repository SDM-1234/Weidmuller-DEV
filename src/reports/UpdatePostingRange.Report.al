report 50025 "Update Posting Range"
{
    DefaultLayout = RDLC;
    RDLCLayout = './UpdatePostingRange.rdlc';
    ApplicationArea = All;

    dataset
    {
        dataitem("User Setup"; "User Setup")
        {

            trigger OnAfterGetRecord()
            begin
                "User Setup"."Allow Posting From" := 20220901D;
                "User Setup".MODIFY();
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

