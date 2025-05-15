pageextension 50086 pageextension50086 extends "Warehouse Receipt"
{
    layout
    {

        //Unsupported feature: Property Modification (SourceExpr) on "Control 44".


        //Unsupported feature: Code Insertion on "Control 42".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //begin
        /*
        CurrPage."BinContent FactBox".PAGE.GetPostingDate("Posting Date","Location Code");//SE-E859
        */
        //end;
        addafter("Control 13")
        {
            field("EAN No."; "EAN No.")
            {

                trigger OnValidate()
                begin
                    CurrPage.WhseReceiptLines.PAGE.UpdateByEAN(Rec);//SE-E859
                end;
            }
        }
        addafter("Control 1901796907")
        {
            part("BinContent FactBox"; 50000)
            {
                Caption = 'BinContent FactBox';
                Provider = "97";
                SubPageLink = Item No.=FIELD(Item No.);
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

                trigger OnAction()
                begin
                    ClearBins;
                end;
            }
        }
    }


    //Unsupported feature: Code Insertion on "OnAfterGetCurrRecord".

    //trigger OnAfterGetCurrRecord()
    //begin
    /*
    //SE-E859.s
    CurrPage.WhseReceiptLines.PAGE.UpdateByEAN(Rec);
    CurrPage."BinContent FactBox".PAGE.GetPostingDate("Posting Date","Location Code");
    //SE-E859.e
    */
    //end;
}

