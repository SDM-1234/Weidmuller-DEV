codeunit 50093 ChangeNameSubscriber
{

    trigger OnRun()
    begin
    end;

    [EventSubscriber(ObjectType::Codeunit, 50092, 'OnAddresslineChanged', '', false, false)]
    [Scope('Internal')]
    procedure ChangeAddress(CustAdd: Text[50])
    begin
        IF STRPOS(CustAdd, '+') > 0 THEN
            ERROR('You Cant Change');
    end;
}

