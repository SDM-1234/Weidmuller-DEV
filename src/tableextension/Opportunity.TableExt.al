tableextension 50041 Opportunity extends Opportunity
{
    fields
    {
        field(50000; "Calendar Week"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52';
            OptionMembers = " ","1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36","37","38","39","40","41","42","43","44","45","46","47","48","49","50","51","52";
        }
    }


    //Unsupported feature: Code Modification on "CreateOppFromOpp(PROCEDURE 1)".

    //procedure CreateOppFromOpp();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    DELETEALL;
    INIT;
    "Creation Date" := WORKDATE;
    #4..15
      "Salesperson Code" := Cont."Salesperson Code";
      SETRANGE("Contact No.","Contact No.");
    END;
    IF SalesPurchPerson.GET(Opp.GETFILTER("Salesperson Code")) THEN BEGIN
      "Salesperson Code" := SalesPurchPerson.Code;
      SETRANGE("Salesperson Code","Salesperson Code");
    END;
    IF Campaign.GET(Opp.GETFILTER("Campaign No.")) THEN BEGIN
      "Campaign No." := Campaign."No.";
      "Salesperson Code" := Campaign."Salesperson Code";
    #26..35
    END;

    StartWizard;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..18
    {
    IF SalesPurchPerson.GET(Opp.GETFILTER("Salesperson Code")) THEN BEGIN  //Santosh
    #20..22
    }
    #23..38
    */
    //end;
}

