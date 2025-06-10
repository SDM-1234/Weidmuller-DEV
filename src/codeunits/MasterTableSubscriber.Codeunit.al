codeunit 50000 "Master Table Subscriber"
{
    trigger OnRun()
    begin

    end;

    [EventSubscriber(ObjectType::Table, Database::Customer, OnBeforeCheckBlockedCust, '', false, false)]
    local procedure Customer_OnBeforeCheckBlockedCust(Customer: Record Customer; Source: Option; DocType: Option; Shipment: Boolean; Transaction: Boolean; var IsHandled: Boolean)
    var
        DocTypeEnum: Enum "Sales Document Type";
    begin
        DocTypeEnum := Enum::"Sales Document Type".FromInteger(DocType);
        case Source of
            1:
                begin
                    if Customer."Privacy Blocked" then
                        Customer.CustPrivacyBlockedErrorMessage(Customer, Transaction);

                    if ((Customer.Blocked = Customer.Blocked::All) or
                        ((Customer.Blocked = Customer.Blocked::Invoice) and
                         (DocTypeEnum in [DocTypeEnum::Quote, DocTypeEnum::Order, DocTypeEnum::Invoice, DocTypeEnum::"Blanket Order"])) or
                        ((Customer.Blocked = Customer.Blocked::Ship) and (DocTypeEnum in [DocTypeEnum::Quote, DocTypeEnum::Order, DocTypeEnum::"Blanket Order"]) and
                         (not Transaction) AND (NOT Customer.GetBlockParameterFromDocs())) or
                        ((Customer.Blocked = Customer.Blocked::Ship) and (DocTypeEnum in [DocTypeEnum::Quote, DocTypeEnum::Order, DocTypeEnum::Invoice, DocTypeEnum::"Blanket Order"]) and
                         Shipment and Transaction) AND (NOT Customer.GetBlockParameterFromDocs()))
                    then
                        Customer.CustBlockedErrorMessage(Customer, Transaction);
                end;
            0:
                begin
                    if Customer."Privacy Blocked" then
                        Customer.CustPrivacyBlockedErrorMessage(Customer, Transaction);

                    if (Customer.Blocked = Customer.Blocked::All) or
                       ((Customer.Blocked = Customer.Blocked::Invoice) and (DocTypeEnum in [DocTypeEnum::Invoice))
                    then
                        Customer.CustBlockedErrorMessage(Customer, Transaction)
                end;
        end;
        IsHandled := true;
    end;

}