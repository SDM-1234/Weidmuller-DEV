pageextension 50100 pageextension50100 extends "Bin Contents"
{

    //Unsupported feature: Property Modification (PageType) on ""Bin Contents"(Page 7374)".

    layout
    {
        addafter("Control 5")
        {
            field(Desc; Desc)
            {
                Caption = 'Desc';
                Editable = false;
            }
        }
        moveafter("Control 3"; "Control 5")
        moveafter("Control 5"; "Control 19")
    }

    var
        Desc: Text[250];


        //Unsupported feature: Code Modification on "OnAfterGetCurrRecord".

        //trigger OnAfterGetCurrRecord()
        //>>>> ORIGINAL CODE:
        //begin
        /*
        GetItemDescr("Item No.","Variant Code",ItemDescription);
        DataCaption := STRSUBSTNO('%1 ',"Bin Code");
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        GetItemDescr("Item No.","Variant Code",ItemDescription);
        Desc := ItemDescription;
        DataCaption := STRSUBSTNO('%1 ',"Bin Code");
        */
        //end;


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

