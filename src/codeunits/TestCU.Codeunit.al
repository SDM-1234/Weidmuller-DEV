codeunit 50095 "Test CU"
{

    trigger OnRun()
    begin
        IF Customer.GET('IN00403') THEN BEGIN
            Customer.Blocked := Customer.Blocked::" ";
            Customer.MODIFY;
        END;
    end;

    var
        Customer: Record Customer;
}

