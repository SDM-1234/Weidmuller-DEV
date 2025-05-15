pageextension 50030 pageextension50030 extends "G/L Account List"
{
    layout
    {
        addafter("Control 8")
        {
            field("Debit/Credit"; "Debit/Credit")
            {
            }
            field("Credit Amount"; "Credit Amount")
            {
            }
            field("Debit Amount"; "Debit Amount")
            {
            }
        }
        addafter("Control 3")
        {
            field("SAP GL No."; "SAP GL No.")
            {
            }
        }
    }
}

