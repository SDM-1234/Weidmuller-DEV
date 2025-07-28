codeunit 50005 "Purchase Subscriber"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Purch.-Post", OnInsertReceiptLineOnBeforeCreatePostedRcptLine, '', false, false)]
    local procedure "Purch.-Post_OnInsertReceiptLineOnBeforeCreatePostedRcptLine"(var PurchRcptLine: Record "Purch. Rcpt. Line"; var WarehouseReceiptLine: Record "Warehouse Receipt Line"; PostedWhseReceiptHeader: Record "Posted Whse. Receipt Header")
    begin
        PurchRcptLine.Weight := WarehouseReceiptLine.Weight;
        PurchRcptLine."Total No of Boxes" := WarehouseReceiptLine."Total No of Boxes";
    end;



}