tableextension 50014 tableextension50014 extends "Structure Details"
{
    fields
    {

        //Unsupported feature: Code Modification on "Type(Field 3).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        CASE Type OF
          Type::"Sales Tax":
            BEGIN
              CheckGST;
              "Header/Line" := "Header/Line"::Line;
              "Tax/Charge Code" := Text001;
              IF "Tax/Charge Group" <> '' THEN
        #8..44

        IF "Inc. GST in TDS Base" OR "Exclude GST in TCS Base" THEN
          TESTFIELD(Type,Type::GST);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        #1..3
             // CheckGST;
        #5..47
        */
        //end;
    }
}

