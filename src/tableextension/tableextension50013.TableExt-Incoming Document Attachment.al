tableextension 50013 tableextension50013 extends "Incoming Document Attachment"
{

    //Unsupported feature: Code Modification on "NewAttachment(PROCEDURE 1)".

    //procedure NewAttachment();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    IF NOT CODEUNIT.RUN(CODEUNIT::"Import Attachment - Inc. Doc.",Rec) THEN
      ERROR('');
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    COMMIT;
    IF NOT CODEUNIT.RUN(CODEUNIT::"Import Attachment - Inc. Doc.",Rec) THEN
      ERROR('');
    */
    //end;
}

