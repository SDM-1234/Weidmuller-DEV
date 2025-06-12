tableextension 50042 CustomerTempl extends "Customer Templ."
{

    //Unsupported feature: Code Modification on "OnInsert".

    //trigger OnInsert()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    DimMgt.UpdateDefaultDim(
      DATABASE::"Customer Template",Code,
      "Global Dimension 1 Code","Global Dimension 2 Code");

    "Invoice Disc. Code" := Code;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    ERROR('');
    #1..5
    */
    //end;
}

