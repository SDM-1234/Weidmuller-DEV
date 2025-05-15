page 1171 "User Task Card"
{
    Caption = 'User Task';
    PageType = Card;
    SourceTable = Table1170;

    layout
    {
        area(content)
        {
            group(General)
            {
                field(Title; Title)
                {
                    ShowMandatory = true;
                    ToolTip = 'Specifies the title of the task.';
                }
                field(MultiLineTextControl; MultiLineTextControl)
                {
                    Caption = 'Task Description';
                    MultiLine = true;
                    ToolTip = 'Specifies what the task is about.';

                    trigger OnValidate()
                    begin
                        SetDescription(MultiLineTextControl);
                    end;
                }
                field("Created By User Name"; "Created By User Name")
                {
                    Editable = false;
                    Enabled = false;
                    Importance = Additional;
                    ToolTip = 'Specifies who created the task.';
                }
                field("Created DateTime"; "Created DateTime")
                {
                    Importance = Additional;
                    ToolTip = 'Specifies when the task was created.';
                }
            }
            group(Status)
            {
                Caption = 'Status';
                field("Assigned To User Name"; "Assigned To User Name")
                {
                    DrillDown = false;
                    ToolTip = 'Specifies who the task is assigned to.';

                    trigger OnAssistEdit()
                    var
                        User: Record "2000000120";
                        Users: Page "9800";
                    begin
                        IF User.GET("Assigned To") THEN
                            Users.SETRECORD(User);

                        Users.LOOKUPMODE := TRUE;
                        IF Users.RUNMODAL = ACTION::LookupOK THEN BEGIN
                            Users.GETRECORD(User);
                            "Assigned To" := User."User Security ID";
                            CurrPage.UPDATE(TRUE);
                        END;
                    end;
                }
                field("Due DateTime"; "Due DateTime")
                {
                    ToolTip = 'Specifies when the task must be completed.';
                }
                field("Percent Complete"; "Percent Complete")
                {
                    ToolTip = 'Specifies the progress of the task.';

                    trigger OnValidate()
                    begin
                        CurrPage.UPDATE(TRUE);
                    end;
                }
                field("Start DateTime"; "Start DateTime")
                {
                    ToolTip = 'Specifies when the task must start.';
                }
                field(Priority; Priority)
                {
                    BlankZero = true;
                    ToolTip = 'Specifies the priority of the task.';
                }
                field("Completed By User Name"; "Completed By User Name")
                {
                    DrillDown = false;
                    Importance = Additional;
                    ToolTip = 'Specifies who completed the task.';

                    trigger OnAssistEdit()
                    var
                        User: Record "2000000120";
                        Users: Page "9800";
                    begin
                        IF User.GET("Completed By") THEN
                            Users.SETRECORD(User);

                        Users.LOOKUPMODE := TRUE;
                        IF Users.RUNMODAL = ACTION::LookupOK THEN BEGIN
                            Users.GETRECORD(User);
                            VALIDATE("Completed By", User."User Security ID");
                            CurrPage.UPDATE(TRUE);
                        END;
                    end;
                }
                field("Completed DateTime"; "Completed DateTime")
                {
                    Importance = Additional;
                    ToolTip = 'Specifies when the task was completed.';

                    trigger OnValidate()
                    begin
                        CurrPage.UPDATE(TRUE);
                    end;
                }
            }
            group("Task Item")
            {
                Caption = 'Task Item';
                field("Object Type"; "Object Type")
                {
                    BlankZero = true;
                    OptionCaption = ',,,Report,,,,,Page';
                    ToolTip = 'Specifies the type of window that the task opens.';

                    trigger OnValidate()
                    begin
                        // Clear out the values for object id if it exists.
                        IF "Object ID" <> 0 THEN
                            "Object ID" := 0;
                    end;
                }
                field("Object ID"; "Object ID")
                {
                    BlankZero = true;
                    CaptionClass = GetObjectTypeCaption;
                    Lookup = true;
                    ToolTip = 'Specifies the window that the task opens.';

                    trigger OnLookup(var Text: Text): Boolean
                    var
                        AllObjWithCaption: Record "2000000058";
                        AllObjectsWithCaption: Page "9174";
                    begin
                        // If object type is empty then show both pages / reports in lookup
                        AllObjWithCaption.FILTERGROUP(2);
                        IF "Object Type" = 0 THEN BEGIN
                            AllObjWithCaption.SETFILTER("Object Type", 'Page|Report');
                            AllObjWithCaption.SETFILTER("Object Subtype", '%1|%2', '', 'List');
                        END ELSE BEGIN
                            IF "Object Type" = AllObjWithCaption."Object Type"::Page THEN BEGIN
                                AllObjWithCaption.SETRANGE("Object Type", AllObjWithCaption."Object Type"::Page);
                                AllObjWithCaption.SETRANGE("Object Subtype", 'List');
                            END ELSE
                                AllObjWithCaption.SETRANGE("Object Type", AllObjWithCaption."Object Type"::Report);
                        END;
                        AllObjWithCaption.FILTERGROUP(0);

                        //AllObjectsWithCaption.IsObjectTypeVisible(FALSE);
                        AllObjectsWithCaption.SETTABLEVIEW(AllObjWithCaption);

                        AllObjectsWithCaption.LOOKUPMODE := TRUE;
                        IF AllObjectsWithCaption.RUNMODAL = ACTION::LookupOK THEN BEGIN
                            AllObjectsWithCaption.GETRECORD(AllObjWithCaption);
                            "Object ID" := AllObjWithCaption."Object ID";
                            "Object Type" := AllObjWithCaption."Object Type";
                        END;
                    end;

                    trigger OnValidate()
                    var
                        AllObjWithCaption: Record "2000000058";
                    begin
                        IF "Object Type" = AllObjWithCaption."Object Type"::Page THEN BEGIN
                            AllObjWithCaption.SETRANGE("Object Type", AllObjWithCaption."Object Type"::Page);
                            AllObjWithCaption.SETRANGE("Object ID", "Object ID");
                            IF AllObjWithCaption.FINDFIRST THEN
                                IF AllObjWithCaption."Object Subtype" <> 'List' THEN
                                    ERROR(InvalidPageTypeErr);
                        END;
                    end;
                }
                field(ObjectName; DisplayObjectName)
                {
                    Caption = 'Resource Name';
                    Enabled = false;
                    ToolTip = 'Specifies the name of the resource that is assigned to the task.';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Go To Task Item")
            {
                Caption = 'Go To Task Item';
                Image = Navigate;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Open the page or report that is associated with this task.';

                trigger OnAction()
                begin
                    RunReportOrPageLink;
                end;
            }
            action("Mark Completed")
            {
                Caption = 'Mark Completed';
                Enabled = IsMarkCompleteEnabled;
                Image = Completed;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Mark the task as completed.';

                trigger OnAction()
                begin
                    // Marks the current task as completed.
                    SetCompleted;
                    CurrPage.UPDATE(TRUE);
                end;
            }
            action(Recurrence)
            {
                Caption = 'Recurrence';
                Image = Refresh;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Make this a recurring task.';

                trigger OnAction()
                var
                    UserTaskRecurrence: Page "1172";
                begin
                    UserTaskRecurrence.SetInitialData(Rec);
                    UserTaskRecurrence.RUNMODAL;
                end;
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        MultiLineTextControl := GetDescription;
        IsMarkCompleteEnabled := NOT IsCompleted;
        CurrPage.UPDATE(FALSE);
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        "Created By" := USERSECURITYID;
        VALIDATE("Created DateTime", CURRENTDATETIME);
        CALCFIELDS("Created By User Name");

        CLEAR(MultiLineTextControl);
    end;

    trigger OnOpenPage()
    begin
        RESET;
    end;

    var
        MultiLineTextControl: Text;
        InvalidPageTypeErr: Label 'You must specify a list page.';
        IsMarkCompleteEnabled: Boolean;
        PageTok: Label 'Page';
        ReportTok: Label 'Report';

    local procedure DisplayObjectName(): Text
    var
        AllObjWithCaption: Record "2000000058";
    begin
        AllObjWithCaption.SETRANGE("Object Type", "Object Type");
        AllObjWithCaption.SETRANGE("Object ID", "Object ID");
        IF AllObjWithCaption.FINDFIRST THEN
            EXIT(AllObjWithCaption."Object Name");
    end;

    local procedure RunReportOrPageLink()
    var
        AllObjWithCaption: Record "2000000058";
    begin
        IF ("Object Type" = 0) OR ("Object ID" = 0) THEN
            EXIT;
        IF "Object Type" = AllObjWithCaption."Object Type"::Page THEN
            PAGE.RUN("Object ID")
        ELSE
            REPORT.RUN("Object ID");
    end;

    local procedure GetObjectTypeCaption(): Text
    begin
        IF "Object Type" = "Object Type"::Page THEN
            EXIT(PageTok);

        EXIT(ReportTok);
    end;
}

