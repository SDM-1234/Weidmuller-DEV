pageextension 50033 pageextension50033 extends "Customer List"
{
    layout
    {
        modify("Control 40")
        {
            Visible = false;
        }
        modify("Control 32")
        {
            Visible = false;
        }
        modify("Control 79")
        {
            Visible = false;
        }
        modify("Control 52")
        {
            Visible = false;
        }
        modify("Control 61")
        {
            Visible = false;
        }
        modify("Control 48")
        {
            Visible = false;
        }
        modify("Control 50")
        {
            Visible = false;
        }
        modify("Control 1102601016")
        {
            Visible = false;
        }
        addafter("Control 43")
        {
            field("State Code"; "State Code")
            {
            }
        }
        addafter("Control 6")
        {
            field("E-Mail"; "E-Mail")
            {
            }
        }
        addafter("Control 34")
        {
            field("No. of Industry Segments"; "No. of Industry Segments")
            {
            }
        }
        addafter("Control 8")
        {
            field("Outstanding Orders (LCY)"; "Outstanding Orders (LCY)")
            {
            }
            field("GST Registration No."; "GST Registration No.")
            {
            }
            field(Balance; Balance)
            {
            }
        }
        addafter("Control 1102601008")
        {
            field(Freight; Freight)
            {
            }
            field("Freight GL Account"; "Freight GL Account")
            {
            }
        }
        addafter("Control 1102601014")
        {
            field(Address; Address)
            {
            }
            field("Address 2"; "Address 2")
            {
            }
        }
    }
    actions
    {
        addafter("Action 1905171704")
        {
            group("Customer Blocking")
            {
                Caption = 'Customer Blocking';
                action("Block/Unblock")
                {
                    Caption = 'Block/Unblock';
                    Image = Post;

                    trigger OnAction()
                    begin
                        //ZE_LIJO 22.01.2020
                        //++
                        CustomerCreditCheck.RUN();
                        MESSAGE('Block/Unblock checking is completed for all the customers');
                        //--
                    end;
                }
            }
        }
        addafter("Action 1904039606")
        {
            action("Customer-wise Dunning")
            {
                Caption = 'Customer-wise Dunning';
                RunObject = Report 50024;
            }
        }
    }

    var
        CustomerCreditCheck: Codeunit "50003";
}

