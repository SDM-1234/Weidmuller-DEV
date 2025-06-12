pageextension 50044 Navigate extends Navigate
{

    //Unsupported feature: Code Modification on "FindUnpostedSalesDocs(PROCEDURE 14)".

    //procedure FindUnpostedSalesDocs();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    SalesHeader."SECURITYFILTERING"(SECURITYFILTER::Filtered);
    IF SalesHeader.READPERMISSION THEN BEGIN
      SalesHeader.RESET;
      SalesHeader.SETCURRENTKEY("Sell-to Customer No.","External Document No.");
      SalesHeader.SETFILTER("Sell-to Customer No.",ContactNo);
      SalesHeader.SETFILTER("External Document No.",ExtDocNo);
      SalesHeader.SETRANGE("Document Type",DocType);
      InsertIntoDocEntry(DATABASE::"Sales Header",DocType,DocTableName,SalesHeader.COUNT);
    END;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..3
      SalesHeader.SETCURRENTKEY("Sell-to Customer No.","PO No.");
      SalesHeader.SETFILTER("Sell-to Customer No.",ContactNo);
      SalesHeader.SETFILTER("PO No.",ExtDocNo);
    #7..9
    */
    //end;
}

