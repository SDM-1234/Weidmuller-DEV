tableextension 50012 tableextension50012 extends "Incoming Document"
{

    //Unsupported feature: Code Modification on "SelectIncomingDocument(PROCEDURE 29)".

    //procedure SelectIncomingDocument();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    IF EntryNo <> 0 THEN BEGIN
      IncomingDocument.GET(EntryNo);
      IncomingDocuments.SETRECORD(IncomingDocument);
    #4..7
    IncomingDocument.SETRANGE(Posted,FALSE);
    IncomingDocuments.SETTABLEVIEW(IncomingDocument);
    IncomingDocuments.LOOKUPMODE := TRUE;
    IF IncomingDocuments.RUNMODAL = ACTION::LookupOK THEN BEGIN
      IncomingDocuments.GETRECORD(IncomingDocument);
      EXIT(IncomingDocument."Entry No.");
    END;
    EXIT(EntryNo);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..10
    COMMIT;
    #11..15
    */
    //end;
}

