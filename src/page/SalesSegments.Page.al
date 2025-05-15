page 50014 "Sales Segments"
{
    // Project: Weidmuller
    // ********************************************************************************************************************************
    // Developer: SourceEdge
    // ********************************************************************************************************************************
    // -+------+-----------------+--------+---------+---------+--------------------------------------
    // T|ID_RIC|MOD    REL       |DATE    |SEARCH   |Developer|DESCRIPTION
    // -+------+-----------------+--------+---------+---------+--------------------------------------
    // ?|SE    |SE   2.00-IND-SEG|10.07.18|SE-E747  |Manjusree|New page

    DelayedInsert = true;
    PageType = List;
    SourceTable = Table50005;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Industry Group Code"; "Industry Group Code")
                {
                    Editable = FieldEditable;

                    trigger OnValidate()
                    begin
                        "Sales Order No." := SalesOrderNo;
                        "Sales Invoice No." := SalesInvNo;
                    end;
                }
                field("Sales %"; "Sales %")
                {
                    Editable = FieldEditable;
                }
                field(Amount; Amount)
                {
                    Editable = false;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(Recalculate)
            {
                Image = Recalculate;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    SalesHeader: Record "36";
                    SalesSegment: Record "50005";
                begin
                    SalesHeader.RESET;
                    IF "Sales Invoice No." <> '' THEN BEGIN
                        SalesHeader.SETRANGE("Document Type", SalesHeader."Document Type"::Invoice);
                        SalesHeader.SETRANGE("No.", "Sales Invoice No.");
                    END ELSE BEGIN
                        SalesHeader.SETRANGE("Document Type", SalesHeader."Document Type"::Order);
                        SalesHeader.SETRANGE("No.", "Sales Order No.");
                    END;
                    IF SalesHeader.FINDFIRST THEN BEGIN
                        SalesSegment.RESET;
                        IF SalesHeader."Document Type" = SalesHeader."Document Type"::Order THEN
                            SalesSegment.SETRANGE("Sales Order No.", SalesHeader."No.")
                        ELSE
                            IF SalesHeader."Document Type" = SalesHeader."Document Type"::Invoice THEN
                                SalesSegment.SETRANGE("Sales Invoice No.", SalesHeader."No.");
                        IF SalesSegment.FINDSET THEN
                            REPEAT
                                SalesSegment.Amount := FindLineAmount(SalesHeader."Document Type", SalesHeader."No.") * (SalesSegment."Sales %" / 100);
                                SalesSegment.MODIFY;
                            UNTIL SalesSegment.NEXT = 0;
                    END;
                end;
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        IF ("Posted Sales Invoice No." = '') THEN
            FieldEditable := TRUE
        ELSE
            FieldEditable := FALSE;
        UpdateUnassignedPercentage("Customer No.", 0);
    end;

    trigger OnAfterGetRecord()
    begin
        IF "Sales Order No." <> '' THEN
            SalesOrderNo := "Sales Order No.";
        IF "Sales Invoice No." <> '' THEN
            SalesInvNo := "Sales Invoice No.";
        UpdateUnassignedPercentage("Customer No.", 0);
    end;

    trigger OnClosePage()
    var
        SalesSegment: Record "50005";
    begin
        SalesSegment.RESET;
        SalesSegment.SETRANGE("Customer No.", "Customer No.");
        SalesSegment.SETRANGE("Sales Order No.", "Sales Order No.");
        SalesSegment.SETRANGE("Sales %", 0);
        IF SalesSegment.FINDSET THEN
            REPEAT
                SalesSegment.DELETE;
            UNTIL SalesSegment.NEXT = 0;
    end;

    trigger OnOpenPage()
    var
        SalesSegment: Record "50005";
    begin
        FieldEditable := TRUE;
    end;

    var
        SalesOrderNo: Code[20];
        FieldEditable: Boolean;
        SalesInvNo: Code[20];

    local procedure FindLineAmount(DocType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order"; No: Code[20]) TotalLineAmt: Decimal
    var
        SalesLine: Record "37";
    begin
        SalesLine.RESET;
        SalesLine.SETRANGE("Document Type", DocType);
        SalesLine.SETRANGE("Document No.", No);
        IF SalesLine.FINDSET THEN
            REPEAT
                TotalLineAmt += SalesLine."Line Amount";
            UNTIL SalesLine.NEXT = 0;
    end;
}

