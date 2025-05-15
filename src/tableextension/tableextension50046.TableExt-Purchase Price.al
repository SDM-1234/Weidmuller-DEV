tableextension 50046 tableextension50046 extends "Purchase Price"
{
    fields
    {

        //Unsupported feature: Code Modification on ""Starting Date"(Field 4).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        IF ("Starting Date" > "Ending Date") AND ("Ending Date" <> 0D) THEN
          ERROR(Text000,FIELDCAPTION("Starting Date"),FIELDCAPTION("Ending Date"));
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        {IF ("Starting Date" > "Ending Date") AND ("Ending Date" <> 0D) THEN
          ERROR(Text000,FIELDCAPTION("Starting Date"),FIELDCAPTION("Ending Date"));
          }
        */
        //end;


        //Unsupported feature: Code Modification on ""Ending Date"(Field 15).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        VALIDATE("Starting Date");
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        //VALIDATE("Starting Date");
        */
        //end;
    }
    keys
    {
        key(Key1; "Direct Unit Cost")
        {
        }
    }
}

