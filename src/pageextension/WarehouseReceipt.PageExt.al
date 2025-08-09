pageextension 50084 WarehouseReceipt extends "Warehouse Receipt"
{
    layout
    {


        modify("Posting Date")
        {
            trigger OnAfterValidate()
            var
                myInt: Integer;
            begin
                CurrPage."BinContent FactBox".PAGE.GetPostingDate(Rec."Posting Date", Rec."Location Code");

            end;
        }
        addafter("Assignment Date")
        {
            field("EAN No."; Rec."EAN No.")
            {
                ApplicationArea = All;

                trigger OnValidate()
                begin
                    CurrPage.WhseReceiptLines.PAGE.UpdateByEAN(Rec);
                end;
            }
        }
        addafter(Control1900383207)
        {
            part("BinContent FactBox"; 50000)
            {
                Caption = 'BinContent FactBox';
                //Provider = 97;
                //Provider = "97";

                //SubPageLink = ;
                ApplicationArea = All;
            }
        }
    }
    actions
    {
        addafter(CalculateCrossDock)
        {
            action(ClearBins)
            {
                Caption = 'ClearBins';
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = All;

                trigger OnAction()
                begin
                    Rec.ClearBins();
                end;
            }
        }
    }



    trigger OnAfterGetCurrRecord()
    begin

        CurrPage.WhseReceiptLines.PAGE.UpdateByEAN(Rec);
        CurrPage."BinContent FactBox".PAGE.GetPostingDate(Rec."Posting Date", Rec."Location Code");

    end;
}

