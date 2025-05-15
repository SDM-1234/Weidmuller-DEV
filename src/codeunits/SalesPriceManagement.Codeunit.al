codeunit 50007 "Sales Price Management"
{

    trigger OnRun()
    begin
    end;

    [Scope('Internal')]
    procedure ApprovalProcessMandatory(SalesHeader: Record "36")
    var
        UserSetup: Record "91";
    begin
        UserSetup.GET(USERID);
        IF UserSetup."Update Pricing" THEN
            EXIT;

        IF SalesHeader.Status = SalesHeader.Status::Released THEN
            EXIT;
        IF SalesHeader."Document Type" IN [SalesHeader."Document Type"::Quote, SalesHeader."Document Type"::Order] THEN BEGIN
            IF SpecialPrice(SalesHeader."Transaction Type") THEN
                ERROR('Sales %1 %2 is must be approve through the workflow process.', SalesHeader."Document Type", SalesHeader."No.");

        END;
    end;

    [Scope('Internal')]
    procedure SpecialPrice("Code": Code[20]): Boolean
    var
        TransactionType: Record "258";
    begin
        IF TransactionType.GET(Code) THEN;

        EXIT(TransactionType."Special Price");
    end;

    local procedure SpecialPricingValidation(SalesHeader: Record "36")
    var
        UserSetup: Record "91";
    begin
        UserSetup.GET(USERID);
        IF UserSetup."Update Pricing" THEN
            EXIT;

        IF NOT SpecialPrice(SalesHeader."Transaction Type") THEN
            EXIT;

        ERROR('You do not have permission to change the special pricing transaction type.');
    end;

    [Scope('Internal')]
    procedure ConfirmTransactionType(var SalesHeader: Record "36"; xRec: Record "36")
    begin
        WITH SalesHeader DO BEGIN
            IF "Document Type" IN ["Document Type"::Order, "Document Type"::Quote] THEN BEGIN
                SpecialPricingValidation(xRec);
                IF SpecialPrice("Transaction Type") THEN BEGIN
                    TESTFIELD(Status, Status::Open);
                    IF CONFIRM('Do you want to confirm this transaction with Special Pricing ?', TRUE, FALSE) THEN
                        UpdateSalesLineUnitPrice(SalesHeader)
                    ELSE
                        RevertBackTransactionType(SalesHeader, xRec);
                END ELSE BEGIN
                    IF CONFIRM('Do you want to confirm to confirm that this transaction is NOT with Special Pricing ?', TRUE, FALSE) THEN
                        RecalculateSalesPrice(SalesHeader)
                    ELSE
                        RevertBackTransactionType(SalesHeader, xRec);
                END;
            END;
        END;
    end;

    local procedure RecalculateSalesPrice(SalesHeader: Record "36")
    var
        SalesLine: Record "37";
    begin
        SalesLine.RESET;
        SalesLine.SETRANGE("Document Type", SalesHeader."Document Type");
        SalesLine.SETRANGE("Document No.", SalesHeader."No.");
        SalesLine.SETFILTER(Type, '%1', SalesLine.Type::Item);
        SalesLine.SETFILTER("No.", '<>%1', '');
        IF SalesLine.FINDSET(TRUE, FALSE) THEN
            REPEAT
                SalesLine."Unit Price" := 0;
                SalesLine.VALIDATE(Quantity);
                SalesLine.MODIFY(TRUE);
            UNTIL SalesLine.NEXT = 0;
    end;

    local procedure UpdateSalesLineUnitPrice(SalesHeader: Record "36")
    var
        SalesLine: Record "37";
    begin
        SalesLine.SETCURRENTKEY("Document Type", "Document No.");
        SalesLine.SETRANGE("Document Type", SalesHeader."Document Type");
        SalesLine.SETRANGE("Document No.", SalesHeader."No.");
        SalesLine.SETFILTER("Unit Price", '<>%1', 0);
        IF SalesLine.FINDSET(TRUE, FALSE) THEN
            REPEAT
                SalesLine.VALIDATE("Unit Price", 0);
                SalesLine.MODIFY(TRUE);
            UNTIL SalesLine.NEXT = 0;
    end;

    local procedure RevertBackTransactionType(var Rec: Record "36"; xRec: Record "36")
    begin
        Rec."Transaction Type" := xRec."Transaction Type";
    end;

    [Scope('Internal')]
    procedure UnitPriceChangeValidation(SalesLine: Record "37")
    var
        SalesHeader: Record "36";
        UserSetup: Record "91";
    begin
        IF SalesLine."Document Type" IN [SalesLine."Document Type"::Order, SalesLine."Document Type"::Quote] THEN BEGIN
            //IF SalesLine."Unit Price" = 0 THEN
            // EXIT;
            UserSetup.GET(USERID);
            IF UserSetup."Update Pricing" THEN
                EXIT;
            SalesHeader.GET(SalesLine."Document Type", SalesLine."Document No.");
            IF NOT SpecialPrice(SalesHeader."Transaction Type") THEN
                ERROR('Unit Price is not editable for non Special Pricing scenarios');
        END;
    end;

    [TryFunction]
    [Scope('Internal')]
    procedure UpdateMoQ(var Rec: Record "7002")
    var
        Item: Record "27";
    begin

        IF NOT Item.GET(Rec."Item No.") THEN
            EXIT;
        IF Item."Minimum Order Quantity" <> 0 THEN
            Rec."Minimum Quantity" := Item."Order Multiple" //Rec."Minimum Quantity" := Item."Minimum Order Quantity"
        ELSE
            Rec.TESTFIELD("Minimum Quantity");

        IF Rec.Status = Rec.Status::Released THEN
            Rec.VALIDATE(Status, Rec.Status::Open);
        IF Rec.Status = Rec.Status::"Pending for Approval" THEN
            Rec.TESTFIELD(Status, Rec.Status::Open);
    end;

    [Scope('Internal')]
    procedure UpDateQuoteAndOrderPrice(SalesPrice: Record "7002")
    var
        SalesHeader: Record "36";
        SalesLine: Record "37";
        PriceCalcMgt: Codeunit "7000";
    begin
        // WITH SalesLine DO BEGIN
        //  RESET;
        //  SETCURRENTKEY("Document Type","Document No.","No.");
        //  SETFILTER("Document Type",'%1|%2',"Document Type"::Quote,"Document Type"::Order);
        //  SETRANGE(Type,Type::Item);
        //  SETRANGE("No.",SalesPrice."Item No.");
        //  IF FINDSET THEN
        //    REPEAT
        //      GetSalesHeader(SalesHeader,SalesLine);
        //      IF (SalesHeader.Status = SalesHeader.Status::Open) AND (NOT SpecialPrice(SalesHeader."Transaction Type")) THEN BEGIN
        //        SalesLine.VALIDATE("Unit Price" ,0);//SalesLine."Unit Price" := 0;
        //        //SalesLine.VALIDATE(Quantity);
        //        SalesLine.MODIFY(TRUE);
        //      END;
        //    UNTIL NEXT = 0;
        // END;
    end;

    local procedure GetSalesHeader(var SalesHeader: Record "36"; SalesLine: Record "37")
    var
        IsReleased: Boolean;
        ReleaseSalesDoc: Codeunit "414";
    begin
        // IF (SalesLine."Document Type" <> SalesHeader."Document Type") OR (SalesLine."Document No." <> SalesHeader."No.") THEN BEGIN
        //  IF (IsReleased) AND (NOT SpecialPrice(SalesHeader."Transaction Type")) THEN
        //    ReleaseSalesDoc.PerformManualRelease(SalesHeader);
        //  SalesHeader.GET(SalesLine."Document Type",SalesLine."Document No.");
        //  IsReleased := SalesHeader.Status = SalesHeader.Status::Released;
        //  IF IsReleased THEN
        //    ReleaseSalesDoc.PerformManualReopen(SalesHeader);
        // END;
    end;

    [EventSubscriber(ObjectType::Table, 7002, 'OnAfterModifyEvent', '', false, false)]
    local procedure OnSalesStatusReOpenUpdateUnitPrice(var Rec: Record "7002"; var xRec: Record "7002"; RunTrigger: Boolean)
    begin
        // IF (Rec.Status = Rec.Status::Open) AND (xRec.Status = xRec.Status::Released)THEN
        //    UpDateQuoteAndOrderPrice(Rec);
    end;
}

