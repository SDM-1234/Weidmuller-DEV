codeunit 50001 "Item Count"
{
    Permissions = TableData 27 = rimd;

    trigger OnRun()
    begin
        recitem.RESET;
        recitem.SETRANGE(Description, '');
        IF recitem.FINDSET THEN BEGIN
            //MESSAGE('Count %1',recitem.COUNT);
            recitem.DELETEALL;
        END ELSE
            MESSAGE('Not find set');
    end;

    var
        recitem: Record "27";
}

