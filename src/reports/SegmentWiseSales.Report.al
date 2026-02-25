report 50027 "Segment Wise Sales"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultRenderingLayout = ExcelLayout;
    Caption = 'Segment Wise Sales';

    dataset
    {
        dataitem(Integer; Integer)
        {
            column(SegmentName; GetSegmentDesc(SalesSegmentQuery.Industry_Group_Code))
            {
                Caption = 'Industry Group Code';
            }
            column(SumAmount; SalesSegmentQuery.Amount)
            {
                Caption = 'Total Sales Amount';
            }
            trigger OnPreDataItem()
            begin
                SalesSegmentQuery.SetRange(SalesSegmentQuery.posting_date, StartDate, EndDate);
                SalesSegmentQuery.Open();
            end;

            trigger OnAfterGetRecord()
            begin
                if not SalesSegmentQuery.Read() then
                    CurrReport.Break();
            end;
        }
    }

    requestpage
    {
        AboutTitle = 'Teaching tip title';
        AboutText = 'Teaching tip content';
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                    field(StartDate_; StartDate)
                    {
                        Caption = 'Start Date';
                        ToolTip = 'Select the start date for the sales segment report.';
                        ApplicationArea = All;

                    }
                    field(EndDate_; EndDate)
                    {
                        Caption = 'End Date';
                        ToolTip = 'Select the end date for the sales segment report.';
                        ApplicationArea = All;
                    }
                }
            }
        }
    }

    rendering
    {
        layout(ExcelLayout)
        {
            Type = Excel;
            LayoutFile = 'src/reportlayout/Segment_Wise_Sales.xlsx';
        }
    }

    var
        SalesSegmentQuery: Query "Sales Segment Report";
        StartDate, EndDate : Date;

    procedure GetSegmentDesc(SegmentCode: Code[10]) Result: Text
    var
        IndustrySegment: Record "Industry Segment Group";
    begin
        if IndustrySegment.Get(SegmentCode) then
            Result := IndustrySegment.Description
        else
            Result := SegmentCode;
    end;
}