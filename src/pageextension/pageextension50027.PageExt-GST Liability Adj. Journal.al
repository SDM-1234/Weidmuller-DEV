pageextension 50027 pageextension50027 extends "GST Liability Adj. Journal"
{
    actions
    {

        //Unsupported feature: Code Modification on ""<Action1500030>"(Action 1500017).OnAction".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        IF NOT CONFIRM(PostCreditLiabilityQst) THEN
          EXIT;
        GSTInputTaxCredit.PostLiabilityAdjustmentJnl(Rec);
        DELETEALL;
        CurrPage.CLOSE;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*

        IF NOT CONFIRM(PostCreditLiability) THEN
        #2..5
        */
        //end;
    }

    var
        PostCreditLiability: Label 'Do you want to Post GST Credit & Liability Adjustment?';

        //Unsupported feature: Property Deletion (CaptionML).

}

