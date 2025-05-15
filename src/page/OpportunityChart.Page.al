page 782 "Opportunity Chart"
{
    Caption = 'Opportunities';
    PageType = CardPart;

    layout
    {
        area(content)
        {
            field(StatusText; StatusText)
            {
                Caption = 'Status Text';
                Enabled = false;
                ShowCaption = false;
                Style = StrongAccent;
                StyleExpr = TRUE;
                ToolTip = 'Specifies the status of the chart.';
            }
            usercontrol(BusinessChart; "Microsoft.Dynamics.Nav.Client.BusinessChart")
            {

                trigger DataPointClicked(point: DotNet BusinessChartDataPoint)
                begin
                end;

                trigger DataPointDoubleClicked(point: DotNet BusinessChartDataPoint)
                begin
                end;

                trigger AddInReady()
                begin
                end;
            }
        }
    }

    actions
    {
        area(processing)
        {
            group(Opportunity)
            {
                Caption = 'Opportunity';
                Image = SelectChart;
                action("All Status")
                {
                    Caption = 'All Status';

                    trigger OnAction()
                    begin
                        Opportunity.Status := 99;
                        UpdateChart(Period, Opportunity);
                    end;
                }
                action(NotStarted)
                {
                    Caption = 'Not Started';
                    ToolTip = 'View opportunities not started.';

                    trigger OnAction()
                    begin
                        Opportunity.Status := Opportunity.Status::"Not Started";
                        UpdateChart(Period, Opportunity);
                    end;
                }
                action(InProgress)
                {
                    Caption = 'In Progress';
                    ToolTip = 'View opportunities in progress.';

                    trigger OnAction()
                    begin
                        Opportunity.Status := Opportunity.Status::"In Progress";
                        UpdateChart(Period, Opportunity);
                    end;
                }
                action(Won)
                {
                    Caption = 'Won';
                    ToolTip = 'View opportunities won.';

                    trigger OnAction()
                    begin
                        Opportunity.Status := Opportunity.Status::Won;
                        UpdateChart(Period, Opportunity);
                    end;
                }
                action(Lost)
                {
                    Caption = 'Lost';
                    ToolTip = 'View opportunities lost.';

                    trigger OnAction()
                    begin
                        Opportunity.Status := Opportunity.Status::Lost;
                        UpdateChart(Period, Opportunity);
                    end;
                }
            }
            group(Period)
            {
                Caption = 'Period';
                Image = Period;
                action(Day)
                {
                    Caption = 'Day';
                    ToolTip = 'View the day.';

                    trigger OnAction()
                    begin
                        Period."Period Type" := Period."Period Type"::Date;
                        SetPeriodAndUpdateChart(Period);
                    end;
                }
                action(Week)
                {
                    Caption = 'Week';
                    ToolTip = 'View the week.';

                    trigger OnAction()
                    begin
                        Period."Period Type" := Period."Period Type"::Week;
                        SetPeriodAndUpdateChart(Period);
                    end;
                }
                action(Month)
                {
                    Caption = 'Month';
                    ToolTip = 'View the month.';

                    trigger OnAction()
                    begin
                        Period."Period Type" := Period."Period Type"::Month;
                        SetPeriodAndUpdateChart(Period);
                    end;
                }
                action(Quarter)
                {
                    Caption = 'Quarter';
                    ToolTip = 'View the quarter.';

                    trigger OnAction()
                    begin
                        Period."Period Type" := Period."Period Type"::Quarter;
                        SetPeriodAndUpdateChart(Period);
                    end;
                }
                action(Year)
                {
                    Caption = 'Year';
                    ToolTip = 'View the year.';

                    trigger OnAction()
                    begin
                        Period."Period Type" := Period."Period Type"::Year;
                        SetPeriodAndUpdateChart(Period);
                    end;
                }
            }
            group(View)
            {
                Caption = 'View';
                Image = History;
                group(Period)
                {
                    Caption = 'Period';
                    action(Amount)
                    {
                        Caption = 'Amount';

                        trigger OnAction()
                        begin
                            ByPeriod := TRUE;
                            ByAmt := TRUE;
                            ByCount := FALSE;
                            UpdateChart(Period, Opportunity);
                        end;
                    }
                    action(Count)
                    {
                        Caption = 'Count';

                        trigger OnAction()
                        begin
                            ByPeriod := TRUE;
                            ByAmt := FALSE;
                            ByCount := TRUE;
                            UpdateChart(Period, Opportunity);
                        end;
                    }
                }
                group(SalesPerson)
                {
                    Caption = 'SalesPerson';
                    action(Amount)
                    {
                        Caption = 'Amount';

                        trigger OnAction()
                        begin
                            ByPeriod := FALSE;
                            BySPAmt := TRUE;
                            UpdateChart(Period, Opportunity);
                        end;
                    }
                    action(Count)
                    {
                        Caption = 'Count';

                        trigger OnAction()
                        begin
                            ByPeriod := FALSE;
                            BySPAmt := FALSE;
                            UpdateChart(Period, Opportunity);
                        end;
                    }
                }
            }
            action(PrevPeriod)
            {
                Caption = 'Previous Period';
                Image = PreviousRecord;
                ToolTip = 'Show the information based on the previous period. If you set the View by field to Day, the date filter changes to the day before.';

                trigger OnAction()
                begin
                    OppChartMgt.SetPrevPeriod(Period);
                    UpdateChart(Period, Opportunity);
                end;
            }
            action(NextPeriod)
            {
                Caption = 'Next Period';
                Image = NextRecord;
                ToolTip = 'Show the information based on the next period. If you set the View by field to Day, the date filter changes to the day before.';

                trigger OnAction()
                begin
                    OppChartMgt.SetNextPeriod(Period);
                    UpdateChart(Period, Opportunity);
                end;
            }
        }
    }

    trigger OnOpenPage()
    begin
        OppChartMgt.SetDefaultOppStatus(Opportunity);
        OppChartMgt.SetDefaultPeriod(Period);
    end;

    var
        BusinessChartBuffer: Record "485";
        Opportunity: Record "5092";
        Period: Record "2000000007";
        OppChartMgt: Codeunit "782";
        StatusText: Text;
        IsChartAddInReady: Boolean;
        ByPeriod: Boolean;
        ByAmt: Boolean;
        ByCount: Boolean;
        BySPAmt: Boolean;

    local procedure SetPeriodAndUpdateChart(var Period: Record "2000000007")
    begin
        OppChartMgt.SetPeriodRange(Period);
        UpdateChart(Period, Opportunity);
    end;

    local procedure UpdateChart(Period: Record "2000000007"; Opportunity: Record "5092")
    begin
        // IF NOT IsChartAddInReady THEN
        //  EXIT;

        IF ByPeriod THEN
            OppChartMgt.UpdateDataPeriod(BusinessChartBuffer, Period, Opportunity.Status, ByAmt, ByCount)
        ELSE
            OppChartMgt.UpdateData(BusinessChartBuffer, Period, Opportunity.Status, BySPAmt);
        BusinessChartBuffer.Update(CurrPage.BusinessChart);
        UpdateStatusText(Period, Opportunity);
    end;

    local procedure UpdateStatusText(Period: Record "2000000007"; Opportunity: Record "5092")
    begin
        StatusText := FORMAT(Opportunity.Status) + ' | ' + FORMAT(Period."Period Type") + ' | ';
        CASE Opportunity.Status OF
            Opportunity.Status::"Not Started",
          Opportunity.Status::"In Progress":
                //StatusText += ' .. ' + FORMAT(Period."Period End");
                StatusText += FORMAT(Period."Period Start") + ' .. ' + FORMAT(Period."Period End");
            Opportunity.Status::Won,
          Opportunity.Status::Lost:
                StatusText += FORMAT(Period."Period Start") + ' .. ' + FORMAT(Period."Period End");
            Opportunity.Status::"99":
                //StatusText += ' .. ' + FORMAT(Period."Period End");
                StatusText += FORMAT(Period."Period Start") + ' .. ' + FORMAT(Period."Period End");
        END;
    end;
}

