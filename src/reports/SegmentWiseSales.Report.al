report 50027 "Segment Wise Sales"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultRenderingLayout = ExcelLayout;
    Caption = 'Segment Wise Sales';

    dataset
    {
        dataitem(QueryLoop; Integer)
        {
            DataItemTableView = sorting(Number);
            dataitem(SegmentLoop; "Industry Segment")
            {
                DataItemTableView = sorting("Customer No.", "Industry Group Code");
                column(CustomerNo; SalesSegmentQuery.CustNo)
                {
                    Caption = 'Customer No.';
                }
                column(CustomerName; Customer.Name)
                {
                    Caption = 'Customer Name';
                    IncludeCaption = true;
                }
                column(SegmentCode; SegmentLoop."Industry Group Code")
                {
                    Caption = 'Industry Group Code';
                    IncludeCaption = true;
                }
                column(SegmentName; SegmentLoop."Industry Group Description")
                {
                    Caption = 'Segment Name';
                    IncludeCaption = true;
                }
                // column(SalesAmount; (SalesSegmentQuery.Amount + SalesSegmentQuery.GSTAmount) * (SegmentLoop."Sales %" / 100))
                // {
                //     Caption = 'Total Sales Amount';
                // }
                column(SalesAmount; (SalesSegmentQuery.Amount - CrMemoAmount) * (SegmentLoop."Sales %" / 100))
                {
                    Caption = 'Total Sales Amount';
                }

                column(Percentage; SegmentLoop."Sales %")
                {
                    Caption = 'Sales %';
                    IncludeCaption = true;
                }
                trigger OnPreDataItem()
                begin
                    SetRange("Customer No.", SalesSegmentQuery.CustNo);
                end;
            }
            trigger OnPreDataItem()
            begin
                SalesSegmentQuery.SetRange(SalesSegmentQuery.posting_date, StartDate, EndDate);
                SalesSegmentQuery.Open();
            end;

            trigger OnAfterGetRecord()
            var
                SalesCrMemoLine: Record "Sales Cr.Memo Line";
            begin
                if not SalesSegmentQuery.Read() then
                    CurrReport.Break();
                CrMemoAmount := 0;
                Customer.GET(SalesSegmentQuery.CustNo);
                SalesCrMemoLine.SetRange("Sell-to Customer No.", SalesSegmentQuery.CustNo);
                SalesCrMemoLine.SetRange("Posting Date", StartDate, EndDate);
                SalesCrMemoLine.CalcSums(Amount);
                CrMemoAmount := SalesCrMemoLine.Amount;
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
        Customer: Record Customer;
        SalesSegmentQuery: Query "Sales Segment Report";
        StartDate, EndDate : Date;
        CrMemoAmount: Decimal;

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