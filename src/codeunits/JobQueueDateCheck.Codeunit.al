codeunit 50094 "Job Queue Date Check"
{

    trigger OnRun()
    begin
        SetJobQueueLogEntry(TRUE, RetunMinutes);
        IF RetunMinutes = 1 THEN EXIT;

        // Days8 := CREATEDATETIME(Date21,000000T) - CREATEDATETIME(Date8,000000T);


        //MESSAGE('%1',Days8);

        // IF 022123D IN [CALCDATE('-CM+CM+8D'),CALCDATE('-CM+CM+21D')] THEN
        //  MESSAGE('TODAY IS THE DATE')
        // ELSE
        //   MESSAGE('TODAY IS NOT SPECIFY DATE');
        //
        // NewRunDateTime := TypeHelper.AddMinutesToDateTime(StartingDateTime,JobQueueEntry."No. of Minutes between Runs")
        SetJobQueueLogEntry(FALSE, RetunMinutes);
    end;

    var
        RetunMinutes: Integer;

    local procedure SetJobQueueLogEntry(IsItFirst: Boolean; var RetunMinutes: Integer): Boolean
    var
        Days8: Duration;
        Days21: Duration;
        Date8: Date;
        Date21: Date;
        JobQueueEntry: Record "472";
    begin
        Date8 := CALCDATE('-CM+CM+8D');
        Date21 := CALCDATE('-CM+CM+21D');
        Days8 := CREATEDATETIME(Date8, 000000T) - CREATEDATETIME(TODAY, 000000T);
        Days21 := CREATEDATETIME(Date21, 000000T) - CREATEDATETIME(TODAY, 000000T);

        JobQueueEntry.RESET;
        JobQueueEntry.SETRANGE("Object Type to Run", JobQueueEntry."Object Type to Run"::Codeunit);
        JobQueueEntry.SETRANGE("Object ID to Run", 50094);
        IF IsItFirst THEN
            JobQueueEntry.SETFILTER("No. of Minutes between Runs", '%1', 1);
        IF JobQueueEntry.FINDFIRST THEN BEGIN
            RetunMinutes := JobQueueEntry."No. of Minutes between Runs";
            IF (Date8 - TODAY) < (Date21 - TODAY) THEN
                SetNoofMinutestorun(JobQueueEntry, (Days8 DIV 1000 DIV 60), Date8)
            ELSE
                SetNoofMinutestorun(JobQueueEntry, (Days21 DIV 1000 DIV 60), Date21);
        END;
    end;

    local procedure SetNoofMinutestorun(var JobQueueEntry: Record "472"; NoOfMinutes: Integer; NextstartDate: Date)
    begin
        JobQueueEntry.Status := JobQueueEntry.Status::"On Hold";
        JobQueueEntry."No. of Minutes between Runs" := NoOfMinutes;
        JobQueueEntry.VALIDATE("Earliest Start Date/Time", CREATEDATETIME(NextstartDate, JobQueueEntry."Starting Time"));
        JobQueueEntry.Status := JobQueueEntry.Status::Ready;
        JobQueueEntry.MODIFY(TRUE);
    end;
}

