codeunit 50092 CustNameChaneEvent
{

    trigger OnRun()
    begin
    end;

    [IntegrationEvent(false, false)]
    [Scope('Internal')]
    procedure OnAddresslineChanged(CustAdd: Text[50])
    begin
    end;
}

