pageextension 50088 pageextension50088 extends "Demand Overview"
{

    //Unsupported feature: Code Modification on "ApplyUserFilters(PROCEDURE 6)".

    //procedure ApplyUserFilters();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    AvailCalcOverview.RESET;
    AvailCalcOverview.SETFILTER("Item No.",ItemFilter);
    IF (StartDate <> 0D) OR (EndDate <> 0D) THEN BEGIN
      IF EndDate <> 0D THEN
        AvailCalcOverview.SETRANGE(Date,StartDate,EndDate)
      ELSE
        AvailCalcOverview.SETRANGE(Date,StartDate,31129999D);
    END;
    IF LocationFilter <> '' THEN
      AvailCalcOverview.SETFILTER("Location Code",LocationFilter);
    IF VariantFilter <> '' THEN
      AvailCalcOverview.SETFILTER("Variant Code",VariantFilter);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..6
        AvailCalcOverview.SETRANGE(Date,StartDate,12319999D);
    #8..12
    */
    //end;
}

