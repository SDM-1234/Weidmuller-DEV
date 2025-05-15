page 50013 "Industry Segments"
{
    // Project: Weidmuller
    // ********************************************************************************************************************************
    // Developer: SourceEdge
    // ********************************************************************************************************************************
    // -+------+-----------------+--------+---------+---------+--------------------------------------
    // T|ID_RIC|MOD    REL       |DATE    |SEARCH   |Developer|DESCRIPTION
    // -+------+-----------------+--------+---------+---------+--------------------------------------
    // ?|SE    |SE   2.00-IND-SEG|10.07.18|SE-E747  |Manjusree|New page

    PageType = List;
    SourceTable = Table50004;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Customer No."; "Customer No.")
                {
                    Caption = 'Customer No.';
                    Visible = false;
                }
                field("Industry Group Code"; "Industry Group Code")
                {
                }
                field("Industry Group Description"; "Industry Group Description")
                {
                }
                field("Customer Name"; "Customer Name")
                {
                    Caption = 'Customer Name';
                }
                field("Sales %"; "Sales %")
                {
                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetCurrRecord()
    var
        IndustrySegment: Record "50004";
        IndustryGroup: Record "5057";
        IndustrySegment1: Record "50004";
    begin
        IndustrySegment.RESET;
        IndustrySegment.SETRANGE("Customer No.", "Customer No.");
        IF NOT IndustrySegment.FINDSET THEN BEGIN
            IndustryGroup.RESET;
            IF NOT IndustryGroup.GET('UNASSIGNED') THEN BEGIN
                IndustryGroup.INIT;
                IndustryGroup.Code := 'UNASSIGNED';
                IndustryGroup.Description := 'Unassigned';
                IndustryGroup.INSERT;
            END;
            IndustrySegment1.INIT;
            IndustrySegment1.VALIDATE("Customer No.", "Customer No.");
            ;
            IndustrySegment1.VALIDATE("Industry Group Code", 'UNASSIGNED');
            IndustrySegment1."Sales %" := 100;
            IndustrySegment1.INSERT;
        END;
        UpdateUnassignedPercentage("Customer No.");
    end;

    trigger OnAfterGetRecord()
    var
        IndustrySegment: Record "50004";
        IndustryGroup: Record "5057";
        IndustrySegment1: Record "50004";
    begin
        IndustrySegment.RESET;
        IndustrySegment.SETRANGE("Customer No.", "Customer No.");
        IF NOT IndustrySegment.FINDSET THEN BEGIN
            IndustryGroup.RESET;
            IF NOT IndustryGroup.GET('UNASSIGNED') THEN BEGIN
                IndustryGroup.INIT;
                IndustryGroup.Code := 'UNASSIGNED';
                IndustryGroup.Description := 'Unassigned';
                IndustryGroup.INSERT;
            END;
            IndustrySegment1.INIT;
            IndustrySegment1.VALIDATE("Customer No.", "Customer No.");
            ;
            IndustrySegment1.VALIDATE("Industry Group Code", 'UNASSIGNED');
            IndustrySegment1."Sales %" := 100;
            IndustrySegment1.INSERT;
        END;
        UpdateUnassignedPercentage("Customer No.");
    end;

    trigger OnClosePage()
    var
        IndustrySegment: Record "50004";
    begin
        IF (FindTotalSalesPercentage("Customer No.") = 100) AND (CountIndustrySegments("Customer No.") > 0) THEN BEGIN
            IndustrySegment.RESET;
            IndustrySegment.SETRANGE("Customer No.", "Customer No.");
            IndustrySegment.SETRANGE("Industry Group Code", 'UNASSIGNED');
            IF IndustrySegment.FINDFIRST THEN
                IndustrySegment.DELETE;
        END;
        IndustrySegment.RESET;
        IndustrySegment.SETRANGE("Customer No.", "Customer No.");
        IndustrySegment.SETRANGE("Sales %", 0);
        IF IndustrySegment.FINDSET THEN
            REPEAT
                IndustrySegment.DELETE;
            UNTIL IndustrySegment.NEXT = 0;
    end;
}

