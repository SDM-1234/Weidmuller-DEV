report 50011 "Customer Updation"
{
    ProcessingOnly = true;
    UseRequestPage = false;

    dataset
    {
        dataitem(DataItem1000000000; Table18)
        {
            DataItemTableView = SORTING (No.)
                                ORDER(Ascending)
                                WHERE (Blocked = FILTER (<> All));

            trigger OnAfterGetRecord()
            begin
                OverDue := Customer.CalcOverdueBalance();
                IF Customer."Credit Limit (LCY)" - OverDue <= 0 THEN BEGIN
                    Customer.Blocked := Customer.Blocked::All;
                    Customer.MODIFY;
                    MESSAGE('%1', Customer."No.");
                END;
            end;

            trigger OnPreDataItem()
            begin
                Customer.SETFILTER(Customer."No.", 'IN00001..IN00010');
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
        OverDue: Decimal;
}

