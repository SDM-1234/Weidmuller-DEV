tableextension 50023 ReversalEntry extends "Reversal Entry"
{

    //Unsupported feature: Code Modification on "CheckFAPostingDate(PROCEDURE 24)".

    //procedure CheckFAPostingDate();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    IF (AllowPostingFrom = 0D) AND (AllowPostingto = 0D) THEN BEGIN
      IF USERID <> '' THEN
        IF UserSetup.GET(USERID) THEN BEGIN
    #4..9
        AllowPostingto := FASetup."Allow FA Posting To";
      END;
      IF AllowPostingto = 0D THEN
        AllowPostingto := 31129998D;
    END;
    IF (FAPostingDate < AllowPostingFrom) OR (FAPostingDate > AllowPostingto) THEN
      ERROR(Text005,Caption,EntryNo,FALedgEntry.FIELDCAPTION("FA Posting Date"));
    IF FAPostingDate > MaxPostingDate THEN
      MaxPostingDate := FAPostingDate;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..12
        AllowPostingto := 12319998D;
    #14..18
    */
    //end;
}

