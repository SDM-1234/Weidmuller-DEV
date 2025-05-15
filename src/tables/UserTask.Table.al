table 1170 "User Task"
{
    Caption = 'User Task';
    DataCaptionFields = Title;
    DrillDownPageID = 1170;

    fields
    {
        field(1; ID; Integer)
        {
            AutoIncrement = true;
            Caption = 'ID';
            Editable = false;
        }
        field(2; Title; Text[250])
        {
            Caption = 'Subject';
        }
        field(3; "Created By"; Guid)
        {
            Caption = 'Created By';
            DataClassification = EndUserPseudonymousIdentifiers;
            Editable = false;
            TableRelation = User."User Security ID" WHERE (License Type=CONST(Full User));
        }
        field(4; "Created DateTime"; DateTime)
        {
            Caption = 'Created Date';
            Editable = false;
        }
        field(5; "Assigned To"; Guid)
        {
            Caption = 'Assigned To';
            TableRelation = User."User Security ID" WHERE (License Type=CONST(Full User));
        }
        field(7; "Completed By"; Guid)
        {
            Caption = 'Completed By';
            DataClassification = EndUserPseudonymousIdentifiers;
            TableRelation = User."User Security ID" WHERE (License Type=CONST(Full User));

            trigger OnValidate()
            begin
                IF NOT ISNULLGUID("Completed By") THEN BEGIN
                    "Percent Complete" := 100;
                    IF "Completed DateTime" = 0DT THEN
                        "Completed DateTime" := CURRENTDATETIME;
                    IF "Start DateTime" = 0DT THEN
                        "Start DateTime" := CURRENTDATETIME;
                END ELSE BEGIN
                    "Completed DateTime" := 0DT;
                    "Percent Complete" := 0;
                END;
            end;
        }
        field(8; "Completed DateTime"; DateTime)
        {
            Caption = 'Completed Date';

            trigger OnValidate()
            begin
                IF "Completed DateTime" <> 0DT THEN BEGIN
                    "Percent Complete" := 100;
                    IF ISNULLGUID("Completed By") THEN
                        "Completed By" := USERSECURITYID;
                    IF "Start DateTime" = 0DT THEN
                        "Start DateTime" := CURRENTDATETIME;
                END ELSE BEGIN
                    CLEAR("Completed By");
                    "Percent Complete" := 0;
                END;
            end;
        }
        field(9; "Due DateTime"; DateTime)
        {
            Caption = 'Due Date';
        }
        field(10; "Percent Complete"; Integer)
        {
            Caption = '% Complete';
            MaxValue = 100;
            MinValue = 0;

            trigger OnValidate()
            begin
                IF "Percent Complete" = 100 THEN BEGIN
                    "Completed By" := USERSECURITYID;
                    "Completed DateTime" := CURRENTDATETIME;
                END ELSE BEGIN
                    CLEAR("Completed By");
                    CLEAR("Completed DateTime");
                END;

                IF "Percent Complete" = 0 THEN
                    "Start DateTime" := 0DT
                ELSE
                    IF "Start DateTime" = 0DT THEN
                        "Start DateTime" := CURRENTDATETIME;
            end;
        }
        field(11; "Start DateTime"; DateTime)
        {
            Caption = 'Start Date';
        }
        field(12; Priority; Option)
        {
            Caption = 'Priority';
            OptionCaption = ',Low,Normal,High';
            OptionMembers = ,Low,Normal,High;
        }
        field(13; Description; BLOB)
        {
            Caption = 'Description';
            SubType = Memo;
        }
        field(14; "Created By User Name"; Code[50])
        {
            CalcFormula = Lookup (User."User Name" WHERE (User Security ID=FIELD(Created By),
                                                         License Type=CONST(Full User)));
            Caption = 'User Created By';
            Editable = false;
            FieldClass = FlowField;
        }
        field(15;"Assigned To User Name";Code[50])
        {
            CalcFormula = Lookup(User."User Name" WHERE (User Security ID=FIELD(Assigned To),
                                                         License Type=CONST(Full User)));
            Caption = 'User Assigned To';
            Editable = false;
            FieldClass = FlowField;
        }
        field(16;"Completed By User Name";Code[50])
        {
            CalcFormula = Lookup(User."User Name" WHERE (User Security ID=FIELD(Completed By),
                                                         License Type=CONST(Full User)));
            Caption = 'User Completed By';
            Editable = false;
            FieldClass = FlowField;
        }
        field(17;"Object Type";Option)
        {
            Caption = 'Link Task To';
            OptionCaption = ',,,Report,,,,,Page';
            OptionMembers = ,,,"Report",,,,,"Page";
        }
        field(18;"Object ID";Integer)
        {
            Caption = 'Object ID';
            TableRelation = AllObj."Object ID" WHERE (Object Type=FIELD(Object Type));
        }
        field(19;"Parent ID";Integer)
        {
            Caption = 'Parent ID';
        }
    }

    keys
    {
        key(Key1;ID)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    var
        DummyUserTask: Record "1170";
    begin
        IF ("Percent Complete" > 0) AND ("Percent Complete" < 100) THEN
          IF NOT CONFIRM(ConfirmDeleteQst) THEN
            ERROR('');

        IF "Parent ID" > 0 THEN
          IF CONFIRM(ConfirmDeleteAllOccurrencesQst) THEN BEGIN
            DummyUserTask.COPYFILTERS(Rec);
            RESET;
            SETRANGE("Parent ID","Parent ID");
            DELETEALL;
            COPYFILTERS(DummyUserTask);
          END
    end;

    trigger OnInsert()
    begin
        VALIDATE("Created DateTime",CURRENTDATETIME);
        "Created By" := USERSECURITYID
    end;

    var
        ConfirmDeleteQst: Label 'This task is started but not complete, delete anyway?';
        ConfirmDeleteAllOccurrencesQst: Label 'Delete all occurrences of this task?';

    [Scope('Internal')]
    procedure CreateRecurrence(RecurringStartDate: Date;Recurrence: DateFormula;Occurrences: Integer)
    var
        UserTaskTemp: Record "1170";
        "Count": Integer;
        TempDueDate: Date;
    begin
        VALIDATE("Parent ID",ID);
        VALIDATE("Due DateTime",CREATEDATETIME(RecurringStartDate,000000T));
        MODIFY(TRUE);

        TempDueDate := RecurringStartDate;
        WHILE Count < Occurrences - 1 DO BEGIN
          CLEAR(UserTaskTemp);
          UserTaskTemp.VALIDATE(Title,Title);
          UserTaskTemp.SetDescription(GetDescription);
          UserTaskTemp."Created By" := USERSECURITYID;
          UserTaskTemp.VALIDATE("Created DateTime",CURRENTDATETIME);
          UserTaskTemp.VALIDATE("Assigned To","Assigned To");
          UserTaskTemp.VALIDATE(Priority,Priority);
          UserTaskTemp.VALIDATE("Object Type","Object Type");
          UserTaskTemp.VALIDATE("Object ID","Object ID");
          UserTaskTemp.VALIDATE("Parent ID",ID);
          TempDueDate := CALCDATE(Recurrence,TempDueDate);
          UserTaskTemp.VALIDATE("Due DateTime",CREATEDATETIME(TempDueDate,000000T));
          UserTaskTemp.INSERT(TRUE);
          Count := Count + 1;
        END
    end;

    [Scope('Internal')]
    procedure SetCompleted()
    begin
        "Percent Complete" := 100;
        "Completed By" := USERSECURITYID;
        "Completed DateTime" := CURRENTDATETIME;

        IF "Start DateTime" = 0DT THEN
          "Start DateTime" := CURRENTDATETIME;
    end;

    [Scope('Internal')]
    procedure SetStyle(): Text
    begin
        IF "Percent Complete" <> 100 THEN BEGIN
          IF ("Due DateTime" <> 0DT) AND ("Due DateTime" <= CURRENTDATETIME) THEN
            EXIT('Unfavorable')
        END;
        EXIT('');
    end;

    [Scope('Internal')]
    procedure GetDescription(): Text
    var
        TypeHelper: Codeunit "10";
        DescriptionFieldRef: FieldRef;
        UserTaskRecRef: RecordRef;
        StreamText: Text;
    begin
        UserTaskRecRef.GETTABLE(Rec);
        DescriptionFieldRef := UserTaskRecRef.FIELD(FIELDNO(Description));
        StreamText := TypeHelper.ReadTextBlobWithTextEncoding(DescriptionFieldRef,TEXTENCODING::Windows);
        EXIT(StreamText);
    end;

    [Scope('Internal')]
    procedure SetDescription(StreamText: Text)
    var
        TypeHelper: Codeunit "10";
        DescriptionFieldRef: FieldRef;
        UserTaskRecRef: RecordRef;
    begin
        CLEAR(Description);
        UserTaskRecRef.GETTABLE(Rec);
        DescriptionFieldRef := UserTaskRecRef.FIELD(FIELDNO(Description));
        IF TypeHelper.WriteBlobWithEncoding(DescriptionFieldRef,StreamText,TEXTENCODING::Windows) THEN BEGIN
          Description := DescriptionFieldRef.VALUE;
          IF MODIFY(TRUE) THEN;
        END;
    end;

    [Scope('Internal')]
    procedure IsCompleted(): Boolean
    begin
        EXIT("Percent Complete" = 100);
    end;
}

