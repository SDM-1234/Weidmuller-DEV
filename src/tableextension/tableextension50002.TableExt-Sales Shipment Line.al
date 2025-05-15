tableextension 50002 tableextension50002 extends "Sales Shipment Line"
{
    fields
    {
        field(50000; "Package No."; Code[20])
        {
            Description = 'SE-E859';
        }
        field(50001; Weight; Decimal)
        {
            Description = 'SE-E859';
        }
    }
    keys
    {
        key(Key1; "Bin Code")
        {
        }
    }


    //Unsupported feature: Code Modification on "InsertInvLineFromShptLine(PROCEDURE 2)".

    //procedure InsertInvLineFromShptLine();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    SETRANGE("Document No.","Document No.");

    TempSalesLine := SalesLine;
    IF SalesLine.FIND('+') THEN
      NextLineNo := SalesLine."Line No." + 10000
    #6..84
      SalesLine."Shipment Line No." := "Line No.";
      SalesLine."Appl.-to Item Entry" := 0;
      SalesLine."Appl.-from Item Entry" := 0;
      IF NOT ExtTextLine AND (SalesLine.Type <> 0) THEN BEGIN
        SalesLine.VALIDATE(Quantity,Quantity - "Quantity Invoiced");
        CalcBaseQuantities(SalesLine,"Quantity (Base)" / Quantity);
    #91..141
      SalesOrderHeader."Get Shipment Used" := TRUE;
      SalesOrderHeader.MODIFY;
    END;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    SETRANGE("Document No.","Document No.");
    #3..87
      SalesLine."OC No" := "Order No.";//SE-E859
    #88..144
    */
    //end;
}

