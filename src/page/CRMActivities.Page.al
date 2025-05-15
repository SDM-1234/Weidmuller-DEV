page 50021 "CRM Activities"
{
    Caption = 'Activities';
    PageType = CardPart;
    SourceTable = Table50001;

    layout
    {
        area(content)
        {
            cuegroup("For CRM")
            {
                Caption = 'For CRM';
                field(Contacts; Contacts)
                {
                }
                field("Open Opportunities"; "Open Opportunities")
                {
                }
                field("Closed Opportunities"; "Closed Opportunities")
                {
                }
                field("Overdue To-Dos"; "Overdue To-Dos")
                {
                }
                field("Upcoming To-Dos"; "Upcoming To-Dos")
                {
                }
                field("Interactions This Month"; "Interactions This Month")
                {
                }
            }
            cuegroup("For Quotations and Order Processing")
            {
                Caption = 'For Quotations and Order Processing';
                field("Open Quotes"; "Open Quotes")
                {
                    DrillDownPageID = "Mini Sales Quotes List";
                    LookupPageID = "Mini Sales Quotes List";
                }
                field("Overdue Orders for Delivery"; "Overdue Orders for Delivery")
                {
                    DrillDownPageID = "Sales Order List";
                    LookupPageID = "Sales Order List";
                }
                field("Upcoming Orders for Delivery"; "Upcoming Orders for Delivery")
                {
                    DrillDownPageID = "Sales Order List";
                    LookupPageID = "Sales Order List";
                }
                field("Outstanding Invoices"; "Outstanding Invoices")
                {
                }
                field(Customers; Customers)
                {
                }
            }
            cuegroup("For User Task")
            {
                Caption = 'For User Task';
                field("UT Assigned By Me - Completed"; "UT Assigned By Me - Completed")
                {
                }
                field("UT Assigned By Me - Pending"; "UT Assigned By Me - Pending")
                {
                }
                field("UT Assigned To Me - Completed"; "UT Assigned To Me - Completed")
                {
                }
                field("UT Assigned To Me - Pending"; "UT Assigned To Me - Pending")
                {
                }
            }
        }
    }

    actions
    {
    }

    trigger OnOpenPage()
    begin
        RESET;

        FILTERGROUP(2);
        SETRANGE("Team Code", GetTeamCode);
        SETRANGE("Date Filter", 0D, WORKDATE - 1);
        SETFILTER("Date Filter2", '>=%1', WORKDATE);
        SETRANGE("Date Filter3", CALCDATE('<CM-1M+1D>', WORKDATE), WORKDATE);
        SETFILTER("User ID Filter", USERID);
        FILTERGROUP(0);
    end;
}

