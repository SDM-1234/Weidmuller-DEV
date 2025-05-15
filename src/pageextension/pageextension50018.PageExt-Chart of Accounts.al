pageextension 50018 pageextension50018 extends "Chart of Accounts"
{
    layout
    {
        modify("Control 32")
        {
            Visible = false;
        }
        modify("Control 44")
        {
            Visible = false;
        }
        modify("Control 39")
        {
            Visible = false;
        }
        modify("Control 41")
        {
            Visible = false;
        }
        modify("Control 61")
        {
            Visible = false;
        }
        modify("Control 57")
        {
            Visible = false;
        }
        modify("Control 7")
        {
            Visible = false;
        }
        addafter("Control 12")
        {
            field("Debit Amount"; "Debit Amount")
            {
            }
            field("Credit Amount"; "Credit Amount")
            {
            }
        }
        addafter("Control 3")
        {
            field("SAP GL No."; "SAP GL No.")
            {
            }
            field("Date Filter"; "Date Filter")
            {
            }
        }
    }
}

