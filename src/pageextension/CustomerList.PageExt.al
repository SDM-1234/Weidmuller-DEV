pageextension 50033 CustomerList extends "Customer List"
{
    layout
    {

        addafter("Name 2")
        {
            field("E-Mail"; Rec."E-Mail")
            {
                ToolTip = 'Specifies the value of the Email field.';
                ApplicationArea = All;
            }

            field("No. of Industry Segments"; Rec."No. of Industry Segments")
            {
                ToolTip = 'Specifies the value of the No. of Industry Segments field.';
                ApplicationArea = All;
            }

            field("Outstanding Orders (LCY)"; Rec."Outstanding Orders (LCY)")
            {
                ToolTip = 'Specifies the value of the Outstanding Orders (LCY) field.';
                ApplicationArea = All;
            }
            field("GST Registration No."; Rec."GST Registration No.")
            {
                ToolTip = 'Specifies the value of the GST Registration No. field.';
                ApplicationArea = All;
            }
            field(Balance; Rec.Balance)
            {
                ToolTip = 'Specifies the value of the Balance field.';
                ApplicationArea = All;
            }

            field(Freight; Rec.Freight)
            {
                ToolTip = 'Specifies the value of the Freight field.';
                ApplicationArea = All;
            }
            field("Freight GL Account"; Rec."Freight GL Account")
            {
                ToolTip = 'Specifies the value of the Freight GL Account field.';
                ApplicationArea = All;
            }

            field(Address; Rec.Address)
            {
                ToolTip = 'Specifies the value of the Address field.';
                ApplicationArea = All;
            }
            field("Address 2"; Rec."Address 2")
            {
                ToolTip = 'Specifies the value of the Address 2 field.';
                ApplicationArea = All;
            }
        }
    }
    actions
    {
        addafter("C&ontact")
        {
            group("Customer Blocking")
            {
                Caption = 'Customer Blocking';
                action("Block/Unblock")
                {
                    Caption = 'Block/Unblock';
                    Image = Post;
                    ToolTip = 'Executes the Block/Unblock action.';
                    ApplicationArea = All;

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
        addafter(ReportCustomerDetailTrial)
        {
            action("Customer-wise Dunning")
            {
                Caption = 'Customer-wise Dunning';
                RunObject = Report "Customer-wise Dunning";
                Image = Customer;
                ToolTip = 'Executes the Customer-wise Dunning action.';
                ApplicationArea = All;
            }
        }
    }

    var
        CustomerCreditCheck: Codeunit "Customer Credit Check";
}

