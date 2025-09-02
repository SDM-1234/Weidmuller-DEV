pageextension 50021 BinContents extends "Bin Contents"
{

    //Unsupported feature: Property Modification (PageType) on ""Bin Contents"(Page 7374)".

    layout
    {
        addafter("Item Description")
        {
            field(Desc; Desc)
            {
                Caption = 'Desc';
                Editable = false;
                ApplicationArea = all;
            }
        }
    }

    var
        Desc: Text[250];



    trigger OnAfterGetCurrRecord()

    begin
        /*
        GetItemDescr("Item No.","Variant Code",ItemDescription);
        DataCaption := STRSUBSTNO('%1 ',"Bin Code");
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin

        // REC.GetItemDescr(Rec."Item No.", Rec."Variant Code", ItemDescription);
        // Desc := ItemDescription;
        // DataCaption := STRSUBSTNO('%1 ', "Bin Code");

    end;


    //Unsupported feature: Code Insertion on "OnAfterGetRecord".

    //trigger OnAfterGetRecord()
    //begin
    /*
    //SE-E859.s
    CLEAR(ItemDescription);//SE-E859.s
    GetItemDescr("Item No.","Variant Code",ItemDescription);
    Desc := ItemDescription;
    //SE-E859.e
    */
    //end;


    //Unsupported feature: Code Modification on "OnOpenPage".

    //trigger OnOpenPage()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    ItemDescription := '';
    GetWhseLocation(LocationCode,ZoneCode);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    ItemDescription := '';
    Desc := '';//SE-E859.s
    GetWhseLocation(LocationCode,ZoneCode);
    SETFILTER("Quantity (Base)",'>%1',0);//SE-E859.s
    */
    //end;
}

