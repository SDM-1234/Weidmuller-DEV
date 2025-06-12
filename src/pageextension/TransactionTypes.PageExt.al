pageextension 50042 TransactionTypes extends "Transaction Types"
{
    layout
    {
        addafter(Control1)
        {
            field("Special Price"; Rec."Special Price")
            {
                ToolTip = 'Specifies the value of the Special Price field.';
                ApplicationArea = All;
            }
        }
    }
}

