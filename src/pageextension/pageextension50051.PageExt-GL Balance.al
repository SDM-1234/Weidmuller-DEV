pageextension 50051 pageextension50051 extends "G/L Balance"
{
    layout
    {
        addafter("Control 1")
        {
            field("Account Type"; "Account Type")
            {
            }
            field(Totaling; Totaling)
            {
            }
        }
    }
}

