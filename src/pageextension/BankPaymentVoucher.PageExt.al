pageextension 50024 BankPaymentVoucher extends "Bank Payment Voucher"
{
    layout
    {
        addafter("Document No.")
        {
            field("Line No."; Rec."Line No.")
            {
                ApplicationArea = All;
            }
        }
    }
}

