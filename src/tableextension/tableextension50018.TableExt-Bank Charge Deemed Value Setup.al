tableextension 50018 tableextension50018 extends "Bank Charge Deemed Value Setup"
{

    //Unsupported feature: Code Modification on "CheckUpperLowerLimit(PROCEDURE 1500000)".

    //procedure CheckUpperLowerLimit();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    IF "Lower Limit" <> 0 THEN BEGIN
      BankChargeDeemedValueSetup.RESET;
      BankChargeDeemedValueSetup.SETRANGE("Bank Charge Code","Bank Charge Code");
      BankChargeDeemedValueSetup.SETRANGE("Upper Limit","Lower Limit");
      IF BankChargeDeemedValueSetup.ISEMPTY THEN
        ERROR(LowerLimitErr,"Lower Limit","Bank Charge Code");
    #7..10
      IF NOT BankChargeDeemedValueSetup.ISEMPTY THEN
        ERROR(LowerLimitZeroErr,"Bank Charge Code");
    END;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..3
      //BankChargeDeemedValueSetup.SETFILTER("Lower Limit",'<>%1',"Lower Limit");
    #4..13
    */
    //end;
}

