codeunit 50151 "Price Approval Mgmt"
{
    trigger OnRun()
    begin

    end;


    /// <summary>
    /// OnSendRequestForApproval.
    /// </summary>
    /// <param name="Var Youtube">Record "Price List Header".</param>
    [IntegrationEvent(false, false)]
    procedure OnSendRequestForApproval(Var PriceHeader: Record "Price List Header")
    begin
    end;

    /// <summary>
    /// OnCancelRequestForApproval.
    /// </summary>
    /// <param name="Var PriceHeader">Record "Price List Header".</param>
    [IntegrationEvent(false, false)]
    procedure OnCancelRequestForApproval(Var PriceHeader: Record "Price List Header")
    begin
    end;

}