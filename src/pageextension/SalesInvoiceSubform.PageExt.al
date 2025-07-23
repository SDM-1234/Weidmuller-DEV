pageextension 50058 SalesInvoiceSubform extends "Sales Invoice Subform"
{
    layout
    {
        addlast(Control1)
        {
            field("OC No"; Rec."OC No")
            {
                ToolTip = 'Specifies the value of the OC No field.';
                ApplicationArea = All;
            }
        }
    }
    actions
    {

        modify(GetShipmentLines)
        {
            trigger OnBeforeAction()
            begin
                IF Rec.COUNT >= 1 THEN BEGIN
                    recSalesHeader.RESET();
                    recSalesHeader.SETRANGE("No.", rec."Document No.");
                    IF recSalesHeader.FINDSET() THEN BEGIN
                        recCust.RESET();
                        recCust.SETRANGE("No.", recSalesHeader."Bill-to Customer No.");
                        recCust.SETRANGE("Invoice Print Check", TRUE);
                        IF recCust.FINDSET() THEN
                            ERROR(txt50000, Rec."Bill-to Customer No.")
                    END;
                END ELSE
                    GetShipment();
            end;
        }

        //Unsupported feature: Code Insertion (VariableCollection) on "GetShipmentLines(Action 1900545004).OnAction".

        //trigger (Variable: recCust)()
        //Parameters and return type have not been exported.
        //begin
        /*
        */
        //end;

        //Unsupported feature: Code Modification on "GetShipmentLines(Action 1900545004).OnAction".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        GetShipment;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        //MESSAGE(FORMAT(Rec."Bill-to Customer No."));
        IF Rec.COUNT >=1 THEN BEGIN
          recSalesHeader.RESET;
          recSalesHeader.SETRANGE("No.","Document No.");
          IF recSalesHeader.FINDSET THEN BEGIN
            recCust.RESET;
            recCust.SETRANGE("No.",recSalesHeader."Bill-to Customer No.");
            recCust.SETRANGE("Invoice Print Check",TRUE);
            IF recCust.FINDSET THEN
              ERROR(txt50000,Rec."Bill-to Customer No.")
           END;
           END ELSE
            GetShipment;
        */
        //end;
    }

    var
        recCust: Record Customer;

    var
        recSalesHeader: Record "Sales Header";
        txt50000: Label ' Selecting Multiple Shipments for Customer %1 Restricted.';
}

