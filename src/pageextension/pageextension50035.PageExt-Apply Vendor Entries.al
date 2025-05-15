pageextension 50035 pageextension50035 extends "Apply Vendor Entries"
{

    //Unsupported feature: Code Modification on "OnQueryClosePage".

    //trigger OnQueryClosePage(CloseAction: Action): Boolean
    //>>>> ORIGINAL CODE:
    //begin
    /*
    IF CloseAction = ACTION::LookupOK THEN
      LookupOKOnPush;
    IF ApplnType = ApplnType::"Applies-to Doc. No." THEN BEGIN
    #4..49
      IF NOT GSTGroupWiseApplication(Rec,ApplyingVendLedgEntry) THEN
        CODEUNIT.RUN(CODEUNIT::"Vend. Entry-Edit",Rec);
    END;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*

    #1..52
    */
    //end;
}

