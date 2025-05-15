tableextension 50040 tableextension50040 extends "To-do"
{
    fields
    {

        //Unsupported feature: Code Modification on ""Contact No."(Field 5).OnValidate".

        //trigger "(Field 5)()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        IF Cont.GET("Contact No.") THEN
          "Contact Company No." := Cont."Company No."
        ELSE
          CLEAR("Contact Company No.");

        IF ("No." <> '') AND
        #7..42
                CreateSubTodo(AttendeeTemp,Rec);
              END;
          END;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        IF Cont.GET("Contact No.") THEN BEGIN
          "Contact Company No." := Cont."Company No.";
           IF "Salesperson Code" = '' THEN//ZT
           "Salesperson Code" := Cont."Salesperson Code";//ZT
        END ELSE
        #4..45
        */
        //end;


        //Unsupported feature: Code Modification on "Date(Field 9).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        IF (Date < 01011900D) OR (Date > 31122999D) THEN
          ERROR(Text006,01011900D,31122999D);

        IF Date <> xRec.Date THEN
          GetEndDateTime;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        IF (Date < 01011900D) OR (Date > 12312999D) THEN
          ERROR(Text006,01011900D,12312999D);
        #3..5
        */
        //end;
    }


    //Unsupported feature: Code Modification on "CreateToDoFromToDo(PROCEDURE 1)".

    //procedure CreateToDoFromToDo();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    DELETEALL;
    INIT;
    IF ToDo.GETFILTER("Contact Company No.") <> '' THEN
    #4..10
      "Salesperson Code" := Cont."Salesperson Code";
      SETRANGE("Contact No.","Contact No.");
    END;
    IF SalesPurchPerson.GET(ToDo.GETFILTER("Salesperson Code")) THEN BEGIN
      "Salesperson Code" := SalesPurchPerson.Code;
      SETRANGE("Salesperson Code","Salesperson Code");
    END;
    IF Team.GET(ToDo.GETFILTER("Team Code")) THEN BEGIN
      VALIDATE("Team Code",Team.Code);
      SETRANGE("Team Code","Team Code");
    #21..39
    END;

    StartWizard;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..13
    {
    IF SalesPurchPerson.GET(ToDo.GETFILTER("Salesperson Code")) THEN BEGIN //Santosh
    #15..17
    }
    #18..42
    */
    //end;


    //Unsupported feature: Code Modification on "SetDuration(PROCEDURE 16)".

    //procedure SetDuration();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    IF (EndingDate < 01011900D) OR (EndingDate > 31122999D) THEN
      ERROR(Text006,01011900D,31122999D);
    IF NOT "All Day Event" AND (Type = Type::Meeting) THEN
      Duration := CREATEDATETIME(EndingDate,EndingTime) - CREATEDATETIME(Date,"Start Time")
    ELSE
      Duration := CREATEDATETIME(EndingDate + 1,0T) - CREATEDATETIME(Date,0T);

    VALIDATE(Duration);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    IF (EndingDate < 01011900D) OR (EndingDate > 12312999D) THEN
      ERROR(Text006,01011900D,12312999D);
    #3..8
    */
    //end;


    //Unsupported feature: Code Modification on "FinishWizard(PROCEDURE 41)".

    //procedure FinishWizard();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    IF Recurring THEN BEGIN
      TESTFIELD("Recurring Date Interval");
      TESTFIELD("Calc. Due Date From");
    #4..18
          Cont."No.",Cont."E-Mail" <> '');
      IF SegHeader.GET("Segment No.") THEN BEGIN
        SegLine.SETRANGE("Segment No.","Segment No.");
        SegLine.SETFILTER("Contact No.",'<>%1','');
        IF SegLine.FIND('-') THEN
          REPEAT
            AttendeeTemp.CreateAttendee(
    #26..45
    MODIFY;
    InsertTodo(Rec,RMCommentLineTmp,AttendeeTemp,TodoInteractionLanguage,AttachmentTemp,'',SendOnFinish);
    DELETE;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..21
        //ZT0214++ 21.04.2021
        IF "Contact No." = '' THEN
          SegLine.SETFILTER("Contact No.",'<>%1','')
        ELSE
          SegLine.SETRANGE("Contact No.","Contact No.");
        //ZT0214-- 21.04.2021
    #23..48
    */
    //end;
}

