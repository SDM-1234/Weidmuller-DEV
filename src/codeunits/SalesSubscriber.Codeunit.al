codeunit 50100 SalesSubscriber
{

    [EventSubscriber(ObjectType::Table, Database::"Sales Shipment Line", OnBeforeCodeInsertInvLineFromShptLine, '', false, false)]
    local procedure OnBeforeCodeInsertInvLineFromShptLine_WM(var SalesLine: Record "Sales Line"; var SalesShipmentLine: Record "Sales Shipment Line")
    begin
        SalesLine."OC No" := SalesShipmentLine."Order No.";
    end;

    [EventSubscriber(ObjectType::Table, Database::Customer, 'OnBeforeCheckBlockedCust', '', false, false)]
    local procedure OnBeforeCheckBlockedCust_WM(var IsHandled: Boolean; Customer: Record Customer; DocType: Option; Shipment: Boolean; Transaction: Boolean)
    var
        SingleInstanceCU: Codeunit "Single Instance CU";
    begin
        IsHandled := true;
        IF Customer."Privacy Blocked" THEN
            Customer.CustPrivacyBlockedErrorMessage(Customer, Transaction);

        IF ((Customer.Blocked = Customer.Blocked::All) OR
            ((Customer.Blocked = Customer.Blocked::Invoice) AND (DocType IN [0, 1, 2, 4]) AND (NOT SingleInstanceCU.GetBlockParameterFromDocs())) OR
            ((Customer.Blocked = Customer.Blocked::Ship) AND (DocType IN [0, 1, 4]) AND
             (NOT Transaction) AND (NOT SingleInstanceCU.GetBlockParameterFromDocs())) OR
            ((Customer.Blocked = Customer.Blocked::Ship) AND (DocType IN [0, 1, 2, 4]) AND
             Shipment AND Transaction) AND (NOT SingleInstanceCU.GetBlockParameterFromDocs()))
        THEN
            Customer.CustBlockedErrorMessage(Customer, Transaction);
    end;

    [EventSubscriber(ObjectType::Table, Database::"Sales Header", OnValidatePostingDateOnBeforeAssignDocumentDate, '', false, false)]
    local procedure OnValidatePostingDateOnBeforeAssignDocumentDate_WM(var SalesHeader: Record "Sales Header"; var IsHandled: Boolean)
    begin
        IsHandled := true;
        IF SalesHeader."Incoming Document Entry No." = 0 THEN
            SalesHeader.VALIDATE("Document Date", SalesHeader."Posting Date");
        IF (SalesHeader."Incoming Document Entry No." = 0) AND (SalesHeader."Document Type" <> SalesHeader."Document Type"::Order) THEN
            SalesHeader.VALIDATE("Document Date", SalesHeader."Posting Date");
    end;


    [EventSubscriber(ObjectType::Table, Database::"Sales Line", OnAfterCopyFromItem, '', false, false)]
    local procedure OnAfterCopyFromItem_WM(var SalesLine: Record "Sales Line"; xSalesLine: Record "Sales Line"; Item: Record Item)
    var
        SalesHeader: Record "Sales Header";
    begin
        SalesHeader.Get(SalesLine."Document Type", SalesLine."Document No.");
        IF SalesHeader."Document Type" = SalesHeader."Document Type"::Quote THEN
            IF SalesHeader."Sell-to Customer No." <> '' THEN
                IF SalesLine."No." <> xSalesLine."No." THEN
                    IF SalesLine."No." <> '' THEN
                        SalesLine.UpdateLatestUnitPrice(SalesHeader)
                    ELSE BEGIN
                        SalesLine."Latest UnitPrice" := 0;
                        CLEAR(SalesLine."Latest Invoice Date");
                    END;
    END;

    [EventSubscriber(ObjectType::Table, Database::"Sales Line", OnUpdateAmountsOnAfterCalcLineAmount, '', false, false)]
    local procedure OnUpdateAmountsOnAfterCalcLineAmount_WM(var LineAmount: Decimal; sender: Record "Sales Line"; var SalesLine: Record "Sales Line")

    var
        Currency: Record Currency;
    begin
        Currency.Get(SalesLine."Currency Code");
        IF SalesLine."Line Amount" <> ROUND(SalesLine.Quantity * SalesLine."Unit Price", Currency."Amount Rounding Precision") - SalesLine."Line Discount Amount" THEN BEGIN
            SalesLine."Line Amount" := ROUND(SalesLine.Quantity * SalesLine."Unit Price", Currency."Amount Rounding Precision") - SalesLine."Line Discount Amount";//Se-E859
            SalesLine."Line Amount" := (SalesLine.Quantity * SalesLine."Unit Price") - SalesLine."Line Discount Amount";
            SalesLine."VAT Difference" := 0;
            //SalesLine.LineAmountChanged := TRUE;
        END;
    end;

    [EventSubscriber(ObjectType::Table, Database::"Sales Line", OnCheckItemAvailableOnBeforeSalesLineCheck, '', false, false)]
    local procedure OnCheckItemAvailableOnBeforeSalesLineCheck_WM(var SalesLine: Record "Sales Line")
    var
        ItemCheckAvail: COdeunit "Item-Check Avail.";
    begin
        if ItemCheckAvail.SalesLineCheck(SalesLine) then
            ItemCheckAvail.RaiseUpdateInterruptedError()
        //else
        //  ItemCheckAvail.GetCurrSalesLine(SalesLine);//SE-E859

        //OnCheckItemAvailableOnBeforeSalesLineCheck(Rec, CalledByFieldNo, CurrFieldNo, xRec, IsHandled);

    end;

    [EventSubscriber(ObjectType::Table, Database::"To-do", OnBeforeValidateEvent, "Contact No.", true, true)]
    local procedure OnBeforeValidateEvent_ContactNo(CurrFieldNo: Integer; var Rec: Record "To-do"; var xRec: Record "To-do")
    var
        Cont: Record Contact;
    begin
        IF Cont.GET(Rec."Contact No.") THEN
            IF Rec."Salesperson Code" = '' THEN
                Rec."Salesperson Code" := Cont."Salesperson Code";
    end;

    [EventSubscriber(ObjectType::Page, Page::"Apply Customer Entries", OnPostDirectApplicationBeforeApply, '', false, false)]
    local procedure "Apply Customer Entries_OnPostDirectApplicationBeforeApply"(GLSetup: Record "General Ledger Setup"; var NewApplyUnapplyParameters: Record "Apply Unapply Parameters" temporary)
    var
        RecCust: Record Customer;
    begin
        if NewApplyUnapplyParameters."Account Type" <> NewApplyUnapplyParameters."Account Type"::Customer then
            exit;
        IF NOT RecCust.GET(NewApplyUnapplyParameters."Account No.") THEN
            EXIT;
        IF NOT NewApplyUnapplyParameters.UpdateBackBlocked THEN BEGIN
            IF RecCust.Blocked <> RecCust.Blocked::Invoice THEN
                EXIT;
            IF (NewApplyUnapplyParameters."Document Type" = NewApplyUnapplyParameters."Document Type"::" ") THEN BEGIN
                RecCust.Blocked := RecCust.Blocked::" ";
                RecCust.MODIFY(TRUE);
                NewApplyUnapplyParameters.UpdateBackBlocked := TRUE;
            END;
        END;
    END;

    [EventSubscriber(ObjectType::Page, Page::"Apply Customer Entries", OnPostDirectApplicationOnAfterApply, '', false, false)]
    local procedure "Apply Customer Entries_OnPostDirectApplicationOnAfterApply"(var CustLedgerEntry: Record "Cust. Ledger Entry"; var NewApplyUnapplyParameters: Record "Apply Unapply Parameters" temporary; PreviewMode: Boolean; Applied: Boolean)
    var
        RecCust: Record Customer;
    begin
        IF NewApplyUnapplyParameters.UpdateBackBlocked THEN BEGIN
            RecCust.Blocked := Reccust.Blocked::Invoice;
            RecCust.MODIFY(TRUE);
        END;
    end;



}