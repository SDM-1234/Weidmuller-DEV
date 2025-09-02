codeunit 50011 "Transfer Order Subscriber"
{

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", OnAfterCalcSalesDocAmount, '', false, false)]
    local procedure MyProcedure()
    begin

    end;

}
