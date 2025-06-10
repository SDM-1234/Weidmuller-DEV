pageextension 50032 CustomerCardPageExt extends "Customer Card"
{
    layout
    {

        //Unsupported feature: Code Insertion on "Control 6".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //var
        //CustNameChaneEvent: Codeunit "50092";
        //begin
        /*
        //CustNameChaneEvent.OnAddresslineChanged(Address); E963 Commented due to Execute issue of the codeunit
        */
        //end;


        //Unsupported feature: Code Insertion on "Control 26".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //begin
        /*
        //ZE_LIJO 19.02.2020
        //++
        IF (xRec.Blocked=Blocked::All) OR (xRec.Blocked=Blocked::Invoice) THEN BEGIN
          IF xRec."No." <> 'C001' THEN
          ERROR('Send Approval Request for Customer Unblocking');
        END;
        //--
        */
        //end;
        modify("Control 104")
        {
            Visible = false;
        }
        modify("Control 154")
        {
            Visible = false;
        }
        modify("Control 23")
        {
            Visible = false;
        }
        modify("Control 29")
        {
            Visible = false;
        }
        modify("Control 58")
        {
            Visible = false;
        }
        modify("Control 1500028")
        {
            Visible = false;
        }
        modify("Control 66")
        {
            Visible = false;
        }
        modify("Control 1500021")
        {
            Visible = false;
        }
        modify("Control 1500011")
        {
            Visible = false;
        }
        modify("Control 1500010")
        {
            Visible = false;
        }
        modify("Control 1500026")
        {
            Visible = false;
        }
        modify("Control 1500022")
        {
            Visible = false;
        }
        modify("Control 1500009")
        {
            Visible = false;
        }
        modify("Control 1500008")
        {
            Visible = false;
        }
        modify("Control 1500007")
        {
            Visible = false;
        }
        modify("Control 1500006")
        {
            Visible = false;
        }
        modify("Control 1500000")
        {
            Visible = false;
        }
        modify("Control 1500002")
        {
            Visible = false;
        }
        modify("Control 1500001")
        {
            Visible = false;
        }
        modify("Control 1500023")
        {
            Visible = false;
        }
        modify("Control 1500032")
        {
            Visible = false;
        }
        modify("Control 1500035")
        {
            Visible = false;
        }
        addafter("Control 20")
        {
            field(Structure; Structure)
            {
            }
        }
        addafter("Control 28")
        {
            field("No. of Industry Segments"; "No. of Industry Segments")
            {
            }
            field("Invoice Print Check"; "Invoice Print Check")
            {
            }
            field(Freight; Freight)
            {
            }
            field("Freight GL Account"; "Freight GL Account")
            {
            }
        }
        addafter("Control 1500017")
        {
            field("Tax Liable"; "Tax Liable")
            {
            }
        }
    }
    actions
    {
        modify(Approve)
        {
            Enabled = true;
        }
        modify(Reject)
        {
            Enabled = true;
        }
        modify(Delegate)
        {
            Enabled = false;
        }
    }


    //Unsupported feature: Code Insertion on "OnModifyRecord".

    //trigger OnModifyRecord(): Boolean
    //begin
    /*
    //++ ZT0207 06.05.2020
    IF "E-Mail" = '' THEN
      ERROR('Kindly enter Customer mail');
    //-- ZT0207 06.05.2020
    //++ ZT0207 19.08.2020
    //IF(COMPANYNAME='PreGOLIVE') THEN BEGIN
      IF (xRec."Customer Price Group" <> Rec."Customer Price Group") OR (xRec."Customer Posting Group" <> Rec."Customer Posting Group")
        OR (xRec."Gen. Bus. Posting Group" <> Rec."Gen. Bus. Posting Group") THEN
          Rec.Blocked := Blocked::All;
    //END;
    //-- ZT0207 19.08.2020
    */
    //end;


    //Unsupported feature: Code Insertion on "OnQueryClosePage".

    //trigger OnQueryClosePage(CloseAction: Action): Boolean
    //begin
    /*
    IF "Currency Code" = '' THEN
      TESTFIELD("Currency Code");
    */
    //end;
}

