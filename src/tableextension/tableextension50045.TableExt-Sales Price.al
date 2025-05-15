tableextension 50045 tableextension50045 extends "Sales Price"
{
    fields
    {
        field(50000; Status; Option)
        {
            Caption = 'Status';
            DataClassification = ToBeClassified;
            Description = 'ZE_1065';
            Editable = false;
            OptionCaption = 'Open,Pending for Approval,Released';
            OptionMembers = Open,"Pending for Approval",Released;

            trigger OnValidate()
            begin
                /*
                IF Status = Status::Open THEN
                  COMMIT;
                  //SalesPriceManagement.OnSalesStatusReOpenUpdateUnitPrice(Rec);
                
                  */

            end;
        }
    }


    //Unsupported feature: Code Modification on "OnInsert".

    //trigger OnInsert()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    IF "Sales Type" = "Sales Type"::"All Customers" THEN
      "Sales Code" := ''
    ELSE
      TESTFIELD("Sales Code");
    TESTFIELD("Item No.");
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..5

    SalesPriceManagement.UpdateMoQ(Rec);//1065
    */
    //end;


    //Unsupported feature: Code Modification on "OnRename".

    //trigger OnRename()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    IF "Sales Type" <> "Sales Type"::"All Customers" THEN
      TESTFIELD("Sales Code");
    TESTFIELD("Item No.");
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..3
    SalesPriceManagement.UpdateMoQ(Rec);//1065
    */
    //end;

    var
        SalesPriceManagement: Codeunit "50007";
}

