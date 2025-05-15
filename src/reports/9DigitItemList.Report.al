report 50016 "9 Digit Item List"
{
    DefaultLayout = RDLC;
    RDLCLayout = './9DigitItemList.rdlc';

    dataset
    {
        dataitem(DataItem1000000000; Table27)
        {
            column(No_Item; Item."No.")
            {
            }
            column(Description_Item; Item.Description)
            {
            }

            trigger OnAfterGetRecord()
            begin
                "Digit Count" := STRLEN(Item."No.");

                IF "Digit Count" <> 8 THEN
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

    var
        "Digit Count": Integer;
}

