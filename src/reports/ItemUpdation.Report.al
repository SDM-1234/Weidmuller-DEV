report 50013 "Item Updation"
{
    // //SE E963

    ProcessingOnly = true;

    dataset
    {
        dataitem(DataItem1000000000; Table27)
        {
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

    trigger OnPreReport()
    begin
        recItem.RESET;
        IF recItem.FINDSET THEN BEGIN
            REPEAT
                recItem.CALCFIELDS(Inventory);
                IF recItem.Inventory < recItem."Safety Stock Quantity" THEN
                    recItem."Inv Below Safety Qty" := TRUE
                ELSE
                    recItem."Inv Below Safety Qty" := FALSE;
                recItem.MODIFY;
            UNTIL recItem.NEXT = 0;
        END;
    end;

    var
        recItem: Record "27";
}

