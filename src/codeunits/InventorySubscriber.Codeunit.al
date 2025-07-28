codeunit 50006 "Inventory Subscriber"
{
    trigger OnRun()
    begin

    end;

    var
        G_SalesLine: Record "Sales Line";
        Item: Record Item;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Item-Check Avail.", OnSalesLineCheckOnAfterSalesLineShowWarning, '', false, false)]
    local procedure "Item-Check Avail._OnSalesLineCheckOnAfterSalesLineShowWarning"(var SalesLine: Record "Sales Line"; var Rollback: Boolean)
    var
        ItemCheckAvail: Codeunit "Item-Check Avail.";
    begin
        IF ItemCheckAvail.SalesLineShowWarning(SalesLine) AND (NOT Rollback) THEN
            SetCurrSalesLine(SalesLine);
    end;

    LOCAL PROCEDURE SetCurrSalesLine(SalesLine: Record "Sales Line");
    VAR
        SalesHeader: Record "Sales Header";
    BEGIN
        SalesLine.TESTFIELD("Document No.");
        SalesHeader.GET(SalesLine."Document Type", SalesLine."Document No.");
        IF (SalesLine."Document Type" = SalesLine."Document Type"::Order) AND (SalesHeader."Posting Date" <> 0D) THEN
            IF SalesLine.Type = SalesLine.Type::Item THEN BEGIN
                GetItem(SalesLine);
                SalesLine.VALIDATE("Confirm Shipping Date", CALCDATE(Item."Lead Time Calculation", SalesHeader."Posting Date"));
            END;
        G_SalesLine := SalesLine;
    END;

    PROCEDURE GetCurrSalesLine(VAR L_SalesLine: Record "Sales Line");
    BEGIN
        L_SalesLine."Confirm Shipping Date" := G_SalesLine."Confirm Shipping Date";
    END;

    LOCAL PROCEDURE GetItem(SalesLine1: Record "Sales Line");
    BEGIN
        SalesLine1.TESTFIELD("No.");
        IF SalesLine1."No." <> Item."No." THEN
            Item.GET(SalesLine1."No.");
    END;
}