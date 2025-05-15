page 1164 "User Task List Part"
{
    Caption = 'User Task List Part';
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = CardPart;
    SourceTable = Table1170;

    layout
    {
        area(content)
        {
            repeater()
            {
                field(Title; Title)
                {

                    trigger OnDrillDown()
                    var
                        Company: Record "2000000006";
                        HyperLinkUrl: Text[500];
                    begin
                        Company.GET(COMPANYNAME);
                        HyperLinkUrl := GETURL(CLIENTTYPE::Web, COMPANYNAME, OBJECTTYPE::Page, 1171, Rec) + '&mode=Edit';
                        HYPERLINK(HyperLinkUrl);
                    end;
                }
                field("Due DateTime"; "Due DateTime")
                {
                    StyleExpr = StyleTxt;
                }
                field(Priority; Priority)
                {
                }
                field("Percent Complete"; "Percent Complete")
                {
                    StyleExpr = StyleTxt;
                }
                field("Assigned To User Name"; "Assigned To User Name")
                {
                }
                field("Created DateTime"; "Created DateTime")
                {
                }
                field("Completed DateTime"; "Completed DateTime")
                {
                    Visible = false;
                }
                field("Start DateTime"; "Start DateTime")
                {
                    Visible = false;
                }
                field("Created By User Name"; "Created By User Name")
                {
                    Visible = false;
                }
                field("Completed By User Name"; "Completed By User Name")
                {
                    Visible = false;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetRecord()
    begin
        StyleTxt := SetStyle;
    end;

    trigger OnOpenPage()
    begin
        SETFILTER("Assigned To User Name", USERID);
        SETFILTER("Percent Complete", '<>100');
    end;

    var
        StyleTxt: Text;

    [Scope('Internal')]
    procedure SetFilterForPendingTasks()
    begin
        // Sets filter to show all pending tasks assigned to logged in user
        RESET;
        SETFILTER("Assigned To User Name", USERID);
        SETFILTER("Percent Complete", '<>100');
        CurrPage.UPDATE(FALSE);
    end;

    [Scope('Internal')]
    procedure SetFilterForTasksDueToday()
    begin
        // Sets filter to show all pending tasks assigned to logged in user due today
        RESET;
        SETFILTER("Assigned To User Name", USERID);
        SETFILTER("Percent Complete", '<>100');
        SETFILTER("Due DateTime", '<=%1', CURRENTDATETIME);
        CurrPage.UPDATE(FALSE);
    end;

    [Scope('Internal')]
    procedure SetFilterForTasksDueThisWeek()
    begin
        // Sets filter to show all pending tasks assigned to logged in user due today
        RESET;
        SETFILTER("Assigned To User Name", USERID);
        SETFILTER("Percent Complete", '<>100');
        SETFILTER("Due DateTime", '<=%1', CREATEDATETIME(CALCDATE('<CW>'), 0T));
        CurrPage.UPDATE(FALSE);
    end;
}

