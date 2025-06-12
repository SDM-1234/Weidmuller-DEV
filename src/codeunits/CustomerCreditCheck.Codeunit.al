codeunit 50003 "Customer Credit Check"
{
    // Project: Weidmueller
    // ********************************************************************************************************************************
    // Developer: ZiniosEdge
    // ********************************************************************************************************************************
    // CodeUnit for Customer Blocking based on Credit Limit


    trigger OnRun()
    begin
        //>> ZE.SAGAR
        SetJobQueueLogEntry(TRUE, RetunMinutes);
        IF RetunMinutes = 1 THEN
            EXIT;
        //<< ZE.SAGAR

        BalanceAmount := 0;
        CreditLimit := 0;
        OpenOrdersCredit := 0;
        //IF(COMPANYNAME='PreGOLIVE') THEN BEGIN
        Cust1.RESET;
        //Cust1.SETFILTER(Cust1."No.",'IN00001..IN00010');
        //++ 22-05-2020
        Cust1.CALCFIELDS(Balance);
        //>> ZE.SAGAR
        //Cust1.SETFILTER(Balance,'>=0');
        //Cust1.SETFILTER(Balance,'>=5000');
        Cust1.SETFILTER(Blocked, '<>%1', Cust1.Blocked::Ship);
        //<< ZE.SAGAR
        //--
        IF Cust1.FINDSET() THEN
            REPEAT
                BalanceAmount := Cust1.CalcOverdueBalance();
                IF BalanceAmount >= 5000 THEN BEGIN
                    OpenOrdersCredit := OpenOrderCreditCheck(Cust1."No.");
                    //BalanceAmount:=Cust1.CalcOverdueBalance;
                    CreditLimit := Cust1."Credit Limit (LCY)";
                    PayTermsExceed := PaymentTermsCheck(Cust1."No.");
                    IF (CreditLimit < BalanceAmount + OpenOrdersCredit) THEN
                        BlockCustomer(Cust1."No.")
                    ELSE
                        IF NOT (PayTermsExceed) THEN
                            BlockCustomer(Cust1."No.");
                    //ELSE
                    //UnBlockCustomer(Cust1."No.");
                END;
            UNTIL Cust1.NEXT() = 0;
        //END;

        COMMIT();
        SetJobQueueLogEntry(FALSE, RetunMinutes);//ZE.SAGAR
    end;

    var
        Cust: Record Customer;
        Cust1: Record Customer;
        OpenOrdersCredit: Decimal;
        BalanceAmount: Decimal;
        CreditLimit: Decimal;
        PayTermsExceed: Boolean;
        SalesLn: Record "Sales Line";
        SalesHead: Record "Sales Header";
        RetunMinutes: Integer;

    local procedure BlockCustomer(CustomerNo: Code[20])
    begin
        Cust.RESET();
        Cust.GET(CustomerNo);
        IF Cust.Blocked = Cust.Blocked::" " THEN BEGIN
            Cust.Blocked := Cust.Blocked::Invoice;
            Cust.MODIFY();
        END;
    end;

    local procedure UnBlockCustomer(CustomerNo: Code[20])
    begin
        Cust.RESET();
        Cust.GET(CustomerNo);
        IF Cust.Blocked = Cust.Blocked::Invoice THEN BEGIN
            Cust.Blocked := Cust.Blocked::" ";
            Cust.MODIFY();
        END;
    end;

    local procedure OpenOrderCreditCheck(CustomerNo: Code[20]): Decimal
    var
        SalesHeader: Record "Sales Header";
        SalesLine: Record "Sales Line";
        SalesAmt: Decimal;
    begin
        SalesAmt := 0;
        SalesLine.RESET();
        SalesLine.SETFILTER(SalesLine."Sell-to Customer No.", CustomerNo);
        SalesLine.SETFILTER(SalesLine."Shipped Not Invoiced", '>0');
        SalesLine.SETRANGE(SalesLine."Document Type", SalesLine."Document Type"::Order);
        IF SalesLine.FINDSET() THEN
            REPEAT
                SalesAmt += SalesLine.Amount;
            UNTIL SalesLine.NEXT() = 0;
        EXIT(SalesAmt);
    end;

    local procedure PaymentTermsCheck(CustomerNo: Code[20]): Boolean
    var
        PaymentTerms: Record "Payment Terms";
        PaymentTermsDate: Date;
        Txt: Text[30];
        CustLedger: Record "Cust. Ledger Entry";
    begin
        Cust.RESET();
        Cust.GET(CustomerNo);
        IF Cust."Payment Terms Code" <> '' THEN BEGIN
            PaymentTerms.RESET();
            PaymentTerms.SETFILTER(PaymentTerms.Code, Cust."Payment Terms Code");
            IF PaymentTerms.FINDFIRST() THEN BEGIN
                CustLedger.RESET();
                CustLedger.SETFILTER(CustLedger."Customer No.", CustomerNo);
                CustLedger.SETFILTER(CustLedger.Open, 'TRUE');
                CustLedger.SETRANGE(CustLedger."Document Type", CustLedger."Document Type"::Invoice);
                CustLedger.SETFILTER(CustLedger."Remaining Amount", '>%1', 0);
                IF CustLedger.FINDSET() THEN
                    REPEAT
                        IF ((TODAY - CustLedger."Due Date") >= 31) THEN
                            EXIT(FALSE);

                    /*
                    CustLedger.CALCFIELDS("Remaining Amount");
                    Txt:=FORMAT(PaymentTerms."Due Date Calculation");
                    PaymentTermsDate:=CALCDATE(Txt,CustLedger."Due Date");
                    IF TODAY>PaymentTermsDate THEN BEGIN
                      EXIT(FALSE);
                    END;
                    */
                    UNTIL CustLedger.NEXT = 0;
            END;
        END;
        EXIT(TRUE);

    end;

    procedure MakeOrderfromBlnktOrder(BlanketOrder: Code[20])
    var
        BlanketAmt: Decimal;
    begin
        BalanceAmount := 0;
        CreditLimit := 0;
        OpenOrdersCredit := 0;
        SalesHead.RESET();
        SalesHead.SETFILTER(SalesHead."No.", BlanketOrder);
        SalesHead.SETRANGE(SalesHead."Document Type", SalesHead."Document Type"::"Blanket Order");
        IF SalesHead.FINDFIRST() THEN BEGIN
            Cust1.RESET();
            Cust1.SETFILTER(Cust1."No.", SalesHead."Sell-to Customer No.");
            IF Cust1.FINDFIRST() THEN BEGIN
                OpenOrdersCredit := OpenOrderCreditCheck(Cust1."No.");
                BalanceAmount := Cust1.CalcOverdueBalance();
                CreditLimit := Cust1."Credit Limit (LCY)";
                PayTermsExceed := PaymentTermsCheck(Cust1."No.");
                BlanketAmt := 0;
                SalesLn.RESET();
                SalesLn.SETFILTER(SalesLn."Document No.", BlanketOrder);
                SalesLn.SETRANGE(SalesLn."Document Type", SalesLn."Document Type"::"Blanket Order");
                IF SalesLn.FINDSET() THEN
                    REPEAT
                        //BlanketAmt += SalesLn."Amount To Customer";
                        BlanketAmt += SalesLn."Amount";

                    UNTIL SalesLn.NEXT() = 0;
                IF (CreditLimit < BalanceAmount + OpenOrdersCredit + BlanketAmt) AND (PayTermsExceed) THEN
                    //BlockCustomer(Cust1."No.");
                    ERROR('Customer: %1 is lacking credit limit', Cust1.Name);

            END;
        END;
    end;

    procedure ReleasingSalesOrder(SalesOrder: Code[20])
    var
        SalesOrderAmt: Decimal;
    begin
        BalanceAmount := 0;
        CreditLimit := 0;
        OpenOrdersCredit := 0;
        SalesHead.RESET();
        SalesHead.SETFILTER(SalesHead."No.", SalesOrder);
        SalesHead.SETRANGE(SalesHead."Document Type", SalesHead."Document Type"::Order);
        IF SalesHead.FINDFIRST() THEN BEGIN
            Cust1.RESET();
            Cust1.SETFILTER(Cust1."No.", SalesHead."Sell-to Customer No.");
            IF Cust1.FINDFIRST() THEN BEGIN
                OpenOrdersCredit := OpenOrderCreditCheck(Cust1."No.");
                BalanceAmount := Cust1.CalcOverdueBalance();
                CreditLimit := Cust1."Credit Limit (LCY)";
                PayTermsExceed := PaymentTermsCheck(Cust1."No.");
                SalesOrderAmt := 0;
                SalesLn.RESET();
                SalesLn.SETFILTER(SalesLn."Document No.", SalesOrder);
                SalesLn.SETRANGE(SalesLn."Document Type", SalesLn."Document Type"::"Blanket Order");
                IF SalesLn.FINDSET() THEN
                    REPEAT
                        //SalesOrderAmt += SalesLn."Amount To Customer";
                        SalesOrderAmt += SalesLn."Amount";

                    UNTIL SalesLn.NEXT() = 0;

                IF (CreditLimit < BalanceAmount + OpenOrdersCredit + SalesOrderAmt) AND (PayTermsExceed) THEN
                    ERROR('Customer: %1 is lacking credit limit', Cust1.Name);


            END;
        END;
    end;

    local procedure SetJobQueueLogEntry(IsItFirst: Boolean; var RetunMinutes: Integer)
    var
        Days8: Duration;
        Days21: Duration;
        Date8: Date;
        Date21: Date;
        JobQueueEntry: Record "Job Queue Entry";
        NextMontthDate: Date;
    begin
        //>> ZE.SAGAR
        Date8 := CALCDATE('-CM+8D-1D');
        Date21 := CALCDATE('-CM+21D-1D');
        NextMontthDate := CALCDATE('CM+8D');

        IF IsItFirst THEN
            IF TODAY IN [Date8, Date21, NextMontthDate] THEN
                EXIT;

        JobQueueEntry.RESET();
        JobQueueEntry.SETRANGE("Object Type to Run", JobQueueEntry."Object Type to Run"::Codeunit);
        JobQueueEntry.SETRANGE("Object ID to Run", CODEUNIT::"Customer Credit Check");
        IF IsItFirst THEN
            JobQueueEntry.SETFILTER("No. of Minutes between Runs", '%1', 1);
        IF JobQueueEntry.FINDFIRST() THEN BEGIN
            RetunMinutes := JobQueueEntry."No. of Minutes between Runs";

            IF TODAY < Date8 THEN
                SetNoofMinutestorun(JobQueueEntry, CalculateNoOfminutes(Date8), Date8)
            ELSE
                IF TODAY < Date21 THEN
                    SetNoofMinutestorun(JobQueueEntry, CalculateNoOfminutes(Date21), Date21);
            IF TODAY = Date8 THEN
                SetNoofMinutestorun(JobQueueEntry, CalculateNoOfminutes(Date21), Date21);
            IF TODAY = Date21 THEN
                SetNoofMinutestorun(JobQueueEntry, CalculateNoOfminutes(NextMontthDate), NextMontthDate);
        END;
        //<< ZE.SAGAR
    end;

    local procedure SetNoofMinutestorun(var JobQueueEntry: Record "Job Queue Entry"; NoOfMinutes: Integer; NextstartDate: Date)
    begin
        //>> ZE.SAGAR
        JobQueueEntry.Status := JobQueueEntry.Status::"On Hold";
        JobQueueEntry."No. of Minutes between Runs" := ABS(NoOfMinutes);
        JobQueueEntry.VALIDATE("Earliest Start Date/Time", CREATEDATETIME(NextstartDate, JobQueueEntry."Starting Time"));
        JobQueueEntry.Status := JobQueueEntry.Status::Ready;
        JobQueueEntry.MODIFY(TRUE);
        //<< ZE.SAGAR
    end;

    local procedure GetNoOfDaysToNextRun(D_Date: Date): Duration
    var
        NoOfdays: Duration;
    begin
        NoOfdays := CREATEDATETIME(D_Date, 000000T) - CREATEDATETIME(TODAY, 000000T);

        EXIT(NoOfdays);
    end;

    local procedure CalculateNoOfminutes(newdate: Date): Integer
    begin
        EXIT(GetNoOfDaysToNextRun(newdate) DIV 1000 DIV 60);
    end;
}

