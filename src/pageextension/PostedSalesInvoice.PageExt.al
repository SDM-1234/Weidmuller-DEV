pageextension 50005 PostedSalesInvoice extends "Posted Sales Invoice"
{
    Editable = true;
    layout
    {
        addlast(General)
        {
            field("Total No of Boxes"; Rec."Total No of Boxes")
            {
                Caption = 'Total No of Boxes';
                ToolTip = 'Specifies the total number of boxes.';
                ApplicationArea = All;
            }
            field("Total Weight"; Rec."Total Weight")
            {
                Caption = 'Total Weight';
                ToolTip = 'Specifies the total weight.';
                ApplicationArea = All;
            }
        }
    }
    actions
    {
        addafter(ActivityLog)
        {
            action("Industry Segments")
            {
                Image = Segment;
                Caption = 'Industry Segments';
                ToolTip = 'View the industry segments associated with this posted sales invoice.';
                ApplicationArea = All;
                trigger OnAction()
                var
                    SalesSegmentRec: Record "Sales Segment";
                    SalesSegmentPage: Page "Sales Segments";
                begin
                    SalesSegmentPage.SetOrderInvNo('', '', Rec."No.");
                    SalesSegmentRec.SetRange("Posted Sales Invoice No.", Rec."No.");
                    SalesSegmentPage.SetTableView(SalesSegmentRec);
                    SalesSegmentPage.RunModal();
                end;
            }
        }
        addafter(Print)
        {
            action(PostedSalesInvoice)
            {
                Caption = 'Posted Sales Invoice';
                Image = Report;
                ToolTip = 'Executes the Posted Sales Invoice action.';
                ApplicationArea = All;

                trigger OnAction()
                var
                    PostdSalesInv: Report "Posted Sales Invoice";
                begin
                    SalesInvHeader.RESET();
                    SalesInvHeader.SETRANGE("No.", Rec."No.");
                    IF SalesInvHeader.FINDFIRST() THEN BEGIN
                        PostdSalesInv.SETTABLEVIEW(SalesInvHeader);
                        PostdSalesInv.RUN();
                    END;
                end;
            }
            //     action("Posted Sales Inv & Certificate")
            //     {
            //         Caption = 'Posted Sales Inv Certificate';
            //         Image = "report";
            //         Promoted = true;
            //         PromotedCategory = Process;

            //         trigger OnAction()
            //         var
            //             PostdSalesInv: Report "50023";
            //         begin
            //             //ZE_LIJO 05.08.2019
            //             //++
            //             SalesInvHeader.RESET;
            //             SalesInvHeader.SETRANGE("No.", "No.");
            //             IF SalesInvHeader.FINDFIRST THEN BEGIN
            //                 PostdSalesInv.SETTABLEVIEW(SalesInvHeader);
            //                 PostdSalesInv.RUN;
            //             END;
            //             //--
            //         end;
            //     }
            //     action("Export Invoice")
            //     {
            //         Caption = 'Export Invoice';
            //         Image = "report";
            //         Promoted = true;
            //         PromotedCategory = Process;

            //         trigger OnAction()
            //         begin
            //             SalesInvHeader.SETRANGE("No.", "No.");
            //             IF SalesInvHeader.FINDFIRST THEN BEGIN
            //                 ExportInvoiceWeidmueller.SETTABLEVIEW(SalesInvHeader);
            //                 ExportInvoiceWeidmueller.RUN;
            //             END;
            //         end;
            //     }
        }
        addafter(Print_Promoted)
        {
            actionref(Posted_Sales_Invoice_Promoted; PostedSalesInvoice)
            {
            }
        }
    }

    // var
    //     ExportInvoiceWeidmueller: Report "50009";
}

