pageextension 50115 PurchaseInvoices extends "Purchase Invoices"
{
    layout
    {
        modify("Control 13")
        {
            Visible = false;
        }
        modify("Control 15")
        {
            Visible = false;
        }
        modify("Control 27")
        {
            Visible = false;
        }
        modify("Control 23")
        {
            Visible = false;
        }
        modify("Control 35")
        {
            Visible = false;
        }
        modify("Control 163")
        {
            Visible = false;
        }
        modify("Control 161")
        {
            Visible = false;
        }
        modify("Control 33")
        {
            Visible = false;
        }
        modify("Control 29")
        {
            Visible = false;
        }
        modify("Control 151")
        {
            Visible = false;
        }
        modify("Control 147")
        {
            Visible = false;
        }
        modify("Control 145")
        {
            Visible = false;
        }
        modify("Control 21")
        {
            Visible = false;
        }
        modify("Control 17")
        {
            Visible = false;
        }
        modify("Control 135")
        {
            Visible = false;
        }
        modify("Control 99")
        {
            Visible = false;
        }
        modify("Control 31")
        {
            Visible = false;
        }
        modify("Control 1102601005")
        {
            Visible = false;
        }
        modify("Control 1102601007")
        {
            Visible = false;
        }
        modify("Control 1102601009")
        {
            Visible = false;
        }
        modify("Control 1102601011")
        {
            Visible = false;
        }
        modify("Control 1102601020")
        {
            Visible = false;
        }
        modify("Control 1102601025")
        {
            Visible = false;
        }
        modify("Control 5")
        {
            Visible = false;
        }
        addafter("Control 11")
        {
            field("Vendor Invoice No."; "Vendor Invoice No.")
            {
            }
            field(Amount; Amount)
            {
            }
            field("Amount to Vendor"; "Amount to Vendor")
            {
            }
        }
        moveafter("Control 1"; "Control 131")
        moveafter("Control 131"; "Control 1102601001")
    }
}

