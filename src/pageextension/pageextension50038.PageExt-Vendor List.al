pageextension 50038 pageextension50038 extends "Vendor List"
{
    layout
    {
        modify("Control 41")
        {
            Visible = false;
        }
        modify("Control 33")
        {
            Visible = false;
        }
        modify("Control 68")
        {
            Visible = false;
        }
        modify("Control 49")
        {
            Visible = false;
        }
        modify("Control 45")
        {
            Visible = false;
        }
        modify("Control 47")
        {
            Visible = false;
        }
        modify("Control 1102601004")
        {
            Visible = false;
        }
        modify("Control 1102601008")
        {
            Visible = false;
        }
        modify("Control 1102601010")
        {
            Visible = false;
        }
        modify("Control 1102601012")
        {
            Visible = false;
        }
        addafter("Control 59")
        {
            field("State Code"; "State Code")
            {
            }
        }
        addafter("Location Code2")
        {
            field("GST Registration No."; "GST Registration No.")
            {
            }
            field("Preferred Bank Account"; "Preferred Bank Account")
            {
            }
            field("P.A.N. No."; "P.A.N. No.")
            {
            }
        }
    }
}

