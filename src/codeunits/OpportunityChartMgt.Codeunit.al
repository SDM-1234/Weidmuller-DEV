codeunit 782 "Opportunity Chart Mgt."
{

    trigger OnRun()
    begin
    end;

    [Scope('Internal')]
    procedure DrillDown(var BusinessChartBuffer: Record "485"; Period: Record "2000000007"; OpportunityStatus: Option)
    var
        Opportunity: Record "5092";
        SalespersonPurchaser: Record "13";
        SalesPersonName: Variant;
    begin
        BusinessChartBuffer.GetXValue(BusinessChartBuffer."Drill-Down X Index", SalesPersonName);
        SalespersonPurchaser.SETRANGE(Name, SalesPersonName);
        SalespersonPurchaser.FINDFIRST;
        Opportunity.SETRANGE("Salesperson Code", SalespersonPurchaser.Code);
        Opportunity.Status := OpportunityStatus;
        Opportunity.SETRANGE(Status, Opportunity.Status);
        CASE Opportunity.Status OF
            Opportunity.Status::"Not Started",
          Opportunity.Status::"In Progress":
                Opportunity.SETRANGE("Creation Date", 0D, Period."Period End");
            Opportunity.Status::Won,
          Opportunity.Status::Lost:
                Opportunity.SETRANGE("Date Closed", Period."Period Start", Period."Period End");
        END;
        PAGE.RUN(PAGE::"Opportunity List", Opportunity);
    end;

    local procedure GetOppCount(Period: Record "2000000007"; SalesPersonCode: Code[20]; OpportunityStatus: Option): Integer
    var
        Opportunity: Record "5092";
    begin
        Opportunity.SETRANGE("Salesperson Code", SalesPersonCode);
        Opportunity.Status := OpportunityStatus;
        IF OpportunityStatus <> 99 THEN
            Opportunity.SETRANGE(Status, Opportunity.Status)
        ELSE BEGIN // Added
            Opportunity.SETRANGE(Status);
            Opportunity.SETRANGE("Creation Date", Period."Period Start", Period."Period End"); //Added
        END; //Added
        CASE Opportunity.Status OF
            Opportunity.Status::"Not Started",
          Opportunity.Status::"In Progress":
                //Opportunity.SETRANGE("Creation Date",0D,Period."Period End");
                Opportunity.SETRANGE("Creation Date", Period."Period Start", Period."Period End");
            Opportunity.Status::Won,
          Opportunity.Status::Lost:
                Opportunity.SETRANGE("Date Closed", Period."Period Start", Period."Period End");
        END;
        EXIT(Opportunity.COUNT);
    end;

    [Scope('Internal')]
    procedure SetDefaultOppStatus(var Opportunity: Record "5092")
    begin
        Opportunity.Status := Opportunity.Status::Won;
    end;

    [Scope('Internal')]
    procedure SetDefaultPeriod(var Period: Record "2000000007")
    begin
        Period."Period Type" := Period."Period Type"::Month;
        Period."Period Start" := CALCDATE('<-CM>', WORKDATE);
        Period."Period End" := CALCDATE('<CM>', WORKDATE);
    end;

    [Scope('Internal')]
    procedure SetNextPeriod(var Period: Record "2000000007")
    begin
        CASE Period."Period Type" OF
            Period."Period Type"::Date:
                Period."Period Start" := CALCDATE('<+1D>', Period."Period Start");
            Period."Period Type"::Week:
                Period."Period Start" := CALCDATE('<+1W>', Period."Period Start");
            Period."Period Type"::Month:
                Period."Period Start" := CALCDATE('<+1M>', Period."Period Start");
            Period."Period Type"::Quarter:
                Period."Period Start" := CALCDATE('<+1Q>', Period."Period Start");
            Period."Period Type"::Year:
                Period."Period Start" := CALCDATE('<+1Y>', Period."Period Start");
        END;
        SetPeriodRange(Period);
    end;

    [Scope('Internal')]
    procedure SetPrevPeriod(var Period: Record "2000000007")
    begin
        CASE Period."Period Type" OF
            Period."Period Type"::Date:
                Period."Period Start" := CALCDATE('<-1D>', Period."Period Start");
            Period."Period Type"::Week:
                Period."Period Start" := CALCDATE('<-1W>', Period."Period Start");
            Period."Period Type"::Month:
                Period."Period Start" := CALCDATE('<-1M>', Period."Period Start");
            Period."Period Type"::Quarter:
                Period."Period Start" := CALCDATE('<-1Q>', Period."Period Start");
            Period."Period Type"::Year:
                Period."Period Start" := CALCDATE('<-1Y>', Period."Period Start");
        END;
        SetPeriodRange(Period);
    end;

    [Scope('Internal')]
    procedure SetPeriodRange(var Period: Record "2000000007")
    begin
        CASE Period."Period Type" OF
            Period."Period Type"::Date:
                BEGIN
                    Period."Period Start" := Period."Period Start";
                    Period."Period End" := Period."Period Start";
                END;
            Period."Period Type"::Week:
                BEGIN
                    Period."Period Start" := CALCDATE('<-CW>', Period."Period Start");
                    Period."Period End" := CALCDATE('<CW>', Period."Period Start");
                END;
            Period."Period Type"::Month:
                BEGIN
                    Period."Period Start" := CALCDATE('<-CM>', Period."Period Start");
                    Period."Period End" := CALCDATE('<CM>', Period."Period Start");
                END;
            Period."Period Type"::Quarter:
                BEGIN
                    Period."Period Start" := CALCDATE('<-CQ>', Period."Period Start");
                    Period."Period End" := CALCDATE('<CQ>', Period."Period Start");
                END;
            Period."Period Type"::Year:
                BEGIN
                    Period."Period Start" := CALCDATE('<-CY>', Period."Period Start");
                    Period."Period End" := CALCDATE('<CY>', Period."Period Start");
                END;
        END;
    end;

    [Scope('Internal')]
    procedure UpdateData(var BusinessChartBuffer: Record "485"; Period: Record "2000000007"; OpportunityStatus: Option; ByAmt: Boolean)
    var
        SalespersonPurchaser: Record "13";
        I: Integer;
        OppCount: Integer;
        CRMCue: Record "50001";
        OppAmt: Decimal;
    begin
        WITH BusinessChartBuffer DO BEGIN
            Initialize;
            AddMeasure(SalespersonPurchaser.FIELDCAPTION("No. of Opportunities"), 1, "Data Type"::Integer, "Chart Type"::Pie);
            SetXAxis(SalespersonPurchaser.TABLECAPTION, "Data Type"::String);
            SalespersonPurchaser.SETFILTER(Code, CRMCue.GetSalesPersonFilter(CRMCue.GetTeamCode));
            IF SalespersonPurchaser.FINDSET THEN
                REPEAT
                    IF NOT ByAmt THEN BEGIN
                        OppCount := GetOppCount(Period, SalespersonPurchaser.Code, OpportunityStatus);
                        IF OppCount <> 0 THEN BEGIN
                            I += 1;
                            AddColumn(SalespersonPurchaser.Name);
                            SetValueByIndex(0, I - 1, OppCount);
                        END;
                    END ELSE BEGIN
                        OppAmt := GetOppAmtPeriod(Period."Period Start", Period."Period End", OpportunityStatus, SalespersonPurchaser.Code);
                        IF OppAmt <> 0 THEN BEGIN
                            I += 1;
                            AddColumn(SalespersonPurchaser.Name);
                            SetValueByIndex(0, I - 1, OppAmt);
                        END;
                    END;
                UNTIL SalespersonPurchaser.NEXT = 0;
        END;
    end;

    [Scope('Internal')]
    procedure UpdateDataPeriod(var BusinessChartBuffer: Record "485"; Period: Record "2000000007"; OpportunityStatus: Option; ByAmt: Boolean; ByCount: Boolean)
    var
        SalespersonPurchaser: Record "13";
        Opportunity: Record "5092";
        I: Integer;
        OppCount: Integer;
        OppAmt: Decimal;
        ToDate: array[5] of Date;
        FromDate: array[5] of Date;
    begin
        WITH BusinessChartBuffer DO BEGIN
            Initialize;
            "Period Length" := Period."Period Type";
            SetPeriodXAxis;

            IF ByCount THEN
                AddMeasure(SalespersonPurchaser.FIELDCAPTION("No. of Opportunities"), 1, "Data Type"::Integer, "Chart Type"::Column);
            IF ByAmt THEN
                AddMeasure(Opportunity.FIELDCAPTION("Estimated Value (LCY)"), 1, "Data Type"::Decimal, "Chart Type"::Column);

            IF CalcPeriods(FromDate, ToDate, BusinessChartBuffer, Period) THEN BEGIN
                AddPeriods(ToDate[1], ToDate[ARRAYLEN(ToDate)]);

                FOR I := 1 TO ARRAYLEN(ToDate) DO BEGIN
                    IF ByCount THEN BEGIN
                        OppCount := GetOppCountPeriod(FromDate[I], ToDate[I], OpportunityStatus, Period);
                        SetValueByIndex(0, I - 1, OppCount);
                    END;
                    IF ByAmt THEN BEGIN
                        OppAmt := GetOppAmtPeriod(FromDate[I], ToDate[I], OpportunityStatus, '');
                        SetValueByIndex(0, I - 1, OppAmt);
                    END;
                END;
            END;
        END;
    end;

    local procedure GetOppCountPeriod(StartDate: Date; EndDate: Date; OpportunityStatus: Option; Period: Record "2000000007"): Integer
    var
        Opportunity: Record "5092";
        CRMCue: Record "50001";
    begin
        Opportunity.SETFILTER("Salesperson Code", CRMCue.GetSalesPersonFilter(CRMCue.GetTeamCode));
        Opportunity.Status := OpportunityStatus;
        IF OpportunityStatus <> 99 THEN
            Opportunity.SETRANGE(Status, Opportunity.Status)
        ELSE
            Opportunity.SETRANGE(Status);
        Opportunity.SETRANGE("Creation Date", StartDate, EndDate);
        EXIT(Opportunity.COUNT);
    end;

    local procedure GetOppAmtPeriod(StartDate: Date; EndDate: Date; OpportunityStatus: Option; SpCode: Code[20]) OppAmt: Decimal
    var
        Opportunity: Record "5092";
        CRMCue: Record "50001";
    begin
        IF SpCode = '' THEN
            Opportunity.SETFILTER("Salesperson Code", CRMCue.GetSalesPersonFilter(CRMCue.GetTeamCode))
        ELSE
            Opportunity.SETRANGE("Salesperson Code", SpCode);
        Opportunity.Status := OpportunityStatus;
        IF OpportunityStatus <> 99 THEN
            Opportunity.SETRANGE(Status, Opportunity.Status)
        ELSE
            Opportunity.SETRANGE(Status);
        Opportunity.SETRANGE("Creation Date", StartDate, EndDate);
        IF Opportunity.FINDSET THEN
            REPEAT
                Opportunity.CALCFIELDS("Estimated Value (LCY)");
                OppAmt += Opportunity."Estimated Value (LCY)";
            UNTIL Opportunity.NEXT = 0;
    end;

    local procedure CalcPeriods(var FromDate: array[5] of Date; var ToDate: array[5] of Date; var BusChartBuf: Record "485"; Period: Record "2000000007"): Boolean
    var
        MaxPeriodNo: Integer;
        i: Integer;
    begin
        MaxPeriodNo := ARRAYLEN(ToDate);
        ToDate[MaxPeriodNo] := Period."Period End";
        IF ToDate[MaxPeriodNo] = 0D THEN
            EXIT(FALSE);
        FOR i := MaxPeriodNo DOWNTO 1 DO BEGIN
            FromDate[i] := BusChartBuf.CalcFromDate(ToDate[i]);
            IF i > 1 THEN
                ToDate[i - 1] := FromDate[i] - 1;
        END;
        EXIT(TRUE);
    end;
}

