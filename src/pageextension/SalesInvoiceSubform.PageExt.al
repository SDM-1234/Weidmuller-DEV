pageextension 50058 pageextension50058 extends "Sales Invoice Subform"
{
    layout
    {
        addafter("Control 58")
        {
            field("OC No"; "OC No")
            {
            }
        }
        addafter("Control 6")
        {
            field("Gen. Bus. Posting Group"; "Gen. Bus. Posting Group")
            {
            }
            field("Gen. Prod. Posting Group"; "Gen. Prod. Posting Group")
            {
            }
        }
    }
    actions
    {


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
        recCust: Record "18";

    var
        recSalesHeader: Record "36";
        txt50000: Label ' Selecting Multiple Shipments for Customer %1 Restricted.';
}

