tableextension 50039 tableextension50039 extends "Segment Line"
{

    //Unsupported feature: Code Modification on "CreateInteractionFromIntLogEnt(PROCEDURE 42)".

    //procedure CreateInteractionFromIntLogEnt();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    IF Todo.GET(InteractionLogEntry.GETFILTER("To-do No.")) THEN BEGIN
      "To-do No." := Todo."No.";
      SETRANGE("To-do No.","To-do No.");
    #4..17
        VALIDATE("Contact No.",Cont."No.");
        SETRANGE("Contact No.","Contact No.");
      END;
      IF SalesPurchPerson.GET(InteractionLogEntry.GETFILTER("Salesperson Code")) THEN BEGIN
        "Salesperson Code" := SalesPurchPerson.Code;
        SETRANGE("Salesperson Code","Salesperson Code");
      END;
      IF Campaign.GET(InteractionLogEntry.GETFILTER("Campaign No.")) THEN BEGIN
        "Campaign No." := Campaign."No.";
        SETRANGE("Campaign No.","Campaign No.");
    #28..31
      END;
    END;
    StartWizard;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..20
      {
      IF SalesPurchPerson.GET(InteractionLogEntry.GETFILTER("Salesperson Code")) THEN BEGIN  //Santosh
    #22..24
      }
    #25..34
    */
    //end;
}

