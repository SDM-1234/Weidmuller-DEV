pageextension 50063 pageextension50063 extends "Interaction Log Entries"
{

    //Unsupported feature: Property Modification (PageType) on ""Interaction Log Entries"(Page 5076)".

    var
        Team: Record "5083";


        //Unsupported feature: Code Modification on "OnOpenPage".

        //trigger OnOpenPage()
        //>>>> ORIGINAL CODE:
        //begin
        /*
        SetCaption;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        SetCaption;
        //ZT0214
        SETFILTER("Salesperson Code",GetTeamCode);
        //ZT0214
        */
        //end;

    local procedure "////////////////+ZE+//////////////////////////////////"()
    begin
    end;

    procedure GetTeamCode(): Text[250]
    var
        User: Record "2000000120";
    begin
        User.GET(USERSECURITYID);
        IF User."Team Code" = '' THEN
            EXIT;
        IF Team.GET(User."Team Code") THEN BEGIN
            //IF Opportunity.GET(User."Team Code")
            EXIT(GetSalesPersonFilter(Team.Code));
            //MODIFY;
        END;
        EXIT('');
    end;

    procedure GetSalesPersonFilter(pTeamCode: Code[10]) rReturn: Text[250]
    var
        TeamSalesperson: Record "5084";
    begin
        TeamSalesperson.SETRANGE("Team Code", pTeamCode);
        IF TeamSalesperson.FINDSET THEN
            REPEAT
                IF rReturn = '' THEN
                    rReturn += TeamSalesperson."Salesperson Code"
                ELSE
                    rReturn += '|' + TeamSalesperson."Salesperson Code";
            UNTIL (TeamSalesperson.NEXT = 0);
    end;
}

