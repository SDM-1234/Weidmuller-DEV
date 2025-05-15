pageextension 50118 pageextension50118 extends "Sales Cr. Memo Subform"
{
    layout
    {
        addfirst("Control 1")
        {
            field("Line No."; "Line No.")
            {
                Editable = false;
            }
        }
        addafter("Control 6")
        {
            field("Gen. Bus. Posting Group"; "Gen. Bus. Posting Group")
            {
            }
            field("Gen. Prod. Posting Group"; "Gen. Prod. Posting Group")
            {
            }
        }
    }
}

