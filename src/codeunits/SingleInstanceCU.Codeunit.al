codeunit 50000 "Single Instance CU"
{
    SingleInstance = true;

    trigger OnRun()
    begin
        IF NOT StoreToTemp THEN
            StoreToTemp := TRUE
        ELSE
            PAGE.RUNMODAL(0, TempGLEntry);
    end;

    var
        TempGLEntry: Record "G/L Entry" temporary;
        StoreToTemp: Boolean;

    procedure InsertGL(GLEntry: Record "G/L Entry")
    begin
        IF StoreToTemp THEN BEGIN
            TempGLEntry := GLEntry;
            IF NOT TempGLEntry.INSERT() THEN BEGIN
                TempGLEntry.DELETEALL();
                TempGLEntry.INSERT();
            END;
        END;
    end;

    procedure SetBlockParameterFromDocs()
    begin
        SetBlockParameterFromDocsValue := TRUE;
    end;

    procedure GetBlockParameterFromDocs(): Boolean
    begin
        exit(SetBlockParameterFromDocsValue);
    end;

    var
        SetBlockParameterFromDocsValue: Boolean;

    // Need to shift in single instance

}

