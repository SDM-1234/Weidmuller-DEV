report 1170 "User Task Utility"
{
    Caption = 'User Task Utility';
    ProcessingOnly = true;

    dataset
    {
        dataitem(DataItem1; Table1170)
        {
            RequestFilterFields = "Completed DateTime", "Assigned To", "Created By";

            trigger OnAfterGetRecord()
            begin
                DELETE;
            end;

            trigger OnPreDataItem()
            var
                Filters: Text;
            begin
                Filters := GETFILTERS;

                IF Filters = '' THEN BEGIN
                    MESSAGE(NoFilterMsg);
                    CurrReport.QUIT;
                END;
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
        NoFilterMsg: Label 'No user tasks were deleted. To specify the user tasks that must be deleted, set the relevant filters.';
}

