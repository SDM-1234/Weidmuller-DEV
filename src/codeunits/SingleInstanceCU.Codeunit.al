codeunit 50000 "Single Instance CU"
{
    SingleInstance = true;

    procedure SetLastDocNo(pDocNO: Code[20])
    begin
        DocNO := pDocNO;
    end;

    procedure GetLastDocNo(): Code[20]
    begin
        exit(DocNO);
    end;

    procedure SetWhseDocNo(pDocNO: Code[20])
    begin
        DocNO := pDocNO;
    end;

    procedure GetWhseDocNo(): Code[20]
    begin
        exit(DocNO);
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
        DocNO: Code[20];

    // Need to shift in single instance

}

