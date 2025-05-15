tableextension 50059 tableextension50059 extends "General Ledger Setup"
{
    fields
    {

        //Unsupported feature: Property Insertion (DecimalPlaces) on ""GST Rounding Precision"(Field 16611)".


        //Unsupported feature: Code Modification on ""Amount Rounding Precision"(Field 73).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        IF "Amount Rounding Precision" <> 0 THEN BEGIN
          "Inv. Rounding Precision (LCY)" := ROUND("Inv. Rounding Precision (LCY)","Amount Rounding Precision");
          "GST Rounding Precision" := ROUND("GST Rounding Precision","Amount Rounding Precision");
        END;
        RoundingErrorCheck(FIELDCAPTION("Amount Rounding Precision"));
        IF HideDialog THEN
          MESSAGE(Text021);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        #1..4
        //RoundingErrorCheck(FIELDCAPTION("Amount Rounding Precision")); //SE
        IF HideDialog THEN
          MESSAGE(Text021);
        */
        //end;
    }
}

