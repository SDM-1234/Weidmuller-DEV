codeunit 50091 Jtest
{
    Subtype = Test;

    trigger OnRun()
    begin


        /*Item.SETRANGE("Purch. Unit of Measure",'');
        IF Item.FINDSET THEN REPEAT
        Item."Purch. Unit of Measure" := Item."Base Unit of Measure";
        Item.MODIFY;
        Count := Count+1;
        UNTIL Item.NEXT = 0;
        
        MESSAGE(FORMAT(Count));
        */

        /*
        Item.RESET;
        Item.SETRANGE(Description, '');
        IF Item.FINDSET THEN REPEAT
          Item.DELETE;
        
        UNTIL Item.NEXT = 0;
        */


        Count := 1;
        IF PurchasePrice.FINDSET THEN
            REPEAT
                IF (PurchasePrice."Item No." = "OldItemNo.") AND (PurchasePrice."Vendor No." = OldVendorNo) THEN BEGIN
                    Count := Count + 1;

                    PurchasePrice2.RESET;
                    PurchasePrice2.SETRANGE("Item No.", "OldItemNo.");
                    PurchasePrice2.SETRANGE("Vendor No.", OldVendorNo);
                    IF PurchasePrice2.FINDFIRST THEN BEGIN
                        IF PurchasePrice2."Minimum Quantity" = 0 THEN BEGIN
                            PurchasePrice2.DELETE;
                            Counter += 1;
                        END;
                    END;

                END ELSE BEGIN
                    Count := 1;
                END;

                "OldItemNo." := PurchasePrice."Item No.";
                OldVendorNo := PurchasePrice."Vendor No.";

            UNTIL PurchasePrice.NEXT = 0;

        MESSAGE(FORMAT(Counter));

    end;

    var
        Item: Record "27";
        "Digit Count": Integer;
        "Count": Integer;
        PurchasePrice: Record "7012";
        PurchasePrice2: Record "7012";
        "OldItemNo.": Code[20];
        OldVendorNo: Code[20];
        Counter: Integer;
}

