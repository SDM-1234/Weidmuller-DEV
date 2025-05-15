report 50018 "Purchase Order-Bulk"
{
    // Project: Weidmuller
    // ********************************************************************************************************************************
    // Developer: ZiniosEdge
    // ********************************************************************************************************************************
    // -+------+---------+--------+---------+----+--------------------------------------
    // T|ID_RIC|MOD  REL |DATE    |SEARCH   |Developer|DESCRIPTION
    // -+------+---------+--------+---------+----+--------------------------------------
    // ?|ZE    |         |25.07.19|ZE_LIJO  |LIJO     | GST Calculation is added.
    //  |                                             |
    DefaultLayout = RDLC;
    RDLCLayout = './PurchaseOrderBulk.rdlc';

    PreviewMode = Normal;

    dataset
    {
        dataitem(DataItem1000000000; Table38)
        {
            column(PurchOrderCaption; PurchOrderCaption)
            {
            }
            column(Desc; Desc)
            {
            }
            column(Desc2; Desc2)
            {
            }
            column(JobWork; JobWork)
            {
            }
            column(PurchHdrNo; "Purchase Header"."No.")
            {
            }
            column(Continued; ContinuedCaptionLbl)
            {
            }
            column(Payment_Terms_Code_Purchase_Header; "Payment Terms Code")
            {
            }
            column(No_Purchase_Header; PurchaseHeadNo)
            {
            }
            column(Order_Date_Purchase_Header; "Purchase Header"."Document Date")
            {
            }
            column(Description_Payment_Terms; PaymentTerms.Description)
            {
            }
            column(TINNO_CompanyInfo; CompanyInfo."T.I.N. No.")
            {
            }
            column(CSTNO_CompanyInfo; CompanyInfo."C.S.T No.")
            {
            }
            column(CompInfo_GST; CompanyInfo."GST Registration No.")
            {
            }
            column(Picture_CompanyInfo; CompanyInfo.Picture)
            {
            }
            column(Name_CompanyInfo; CompanyInfo.Name)
            {
            }
            column(Name2_CompanyInfo; CompanyInfo."Name 2")
            {
            }
            column(Address_CompanyInfo; CompanyInfo.Address)
            {
            }
            column(Address2_CompanyInfo; CompanyInfo."Address 2")
            {
            }
            column(City_CompanyInfo; CompanyInfo.City)
            {
            }
            column(PhoneNo_CompanyInfo; CompanyInfo."Phone No.")
            {
            }
            column(HomePage_CompanyInfo; CompanyInfo."Home Page")
            {
            }
            column(PhoneNo2_CompanyInfo; CompanyInfo."Phone No. 2")
            {
            }
            column(HomePage2_CompanyInfo; CompanyInfo."Home Page 2")
            {
            }
            column(CIN_CompanyInfo; CompanyInfo.CIN)
            {
            }
            column(Country_CompanyInfo; CompanyInfo.County)
            {
            }
            column(PostCode_CompanyInfo; CompanyInfo."Post Code")
            {
            }
            column(Phone_No_Vendor; Vendor."Phone No.")
            {
            }
            column(GST_No_Vendor; Vendor."GST Registration No.")
            {
            }
            column(Name_BuyfromVendor; "Buy-from Vendor Name")
            {
            }
            column(Name2_BuyfromVendor; "Buy-from Vendor Name 2")
            {
            }
            column(Address_BuyfromVendor; "Buy-from Address")
            {
            }
            column(Address2_BuyfromVendor; "Buy-from Address 2")
            {
            }
            column(City_BuyfromVendor; "Buy-from City")
            {
            }
            column(Contact_BuyfromVendor; "Buy-from Contact")
            {
            }
            column(PostCode_BuyfromVendor; "Buy-from Post Code")
            {
            }
            column(Country_BuyfromVendor; "Buy-from County")
            {
            }
            column(Approvedbylblcaption; Approvedbylblcaption)
            {
            }
            column(Initiatedbylblcaption; Initiatedbylblcaption)
            {
            }
            column(PURCHASEORDERlblCaption; PURCHASEORDERlblCaption)
            {
            }
            column(DatelblCaption; DatelblCaption)
            {
            }
            column(CSTNOlblCaption; CSTNOlblCaption)
            {
            }
            column(TINNOlblCaption; TINNOlblCaption)
            {
            }
            column(PurchaseordernolblCaption; PurchaseordernolblCaption)
            {
            }
            column(PaymentlblCaption; PaymentlblCaption)
            {
            }
            column(ReflblCaption; ReflblCaption)
            {
            }
            column(TermslblCaption; TermslblCaption)
            {
            }
            column(DeliverylblCaption; DeliverylblCaption)
            {
            }
            column(TolblCaption; TolblCaption)
            {
            }
            column(text001; text001)
            {
            }
            column(slnolblCaption; slnolblCaption)
            {
            }
            column(QTYlblCaption; QTYlblCaption)
            {
            }
            column(UNITlblCaption; UNITlblCaption)
            {
            }
            column(DESCRIPTIONlblCaption; DESCRIPTIONlblCaption)
            {
            }
            column(UNITRATElblCaption; UNITRATElblCaption)
            {
            }
            column(AMOUNTlblCaption; AMOUNTlblCaption)
            {
            }
            column(TotallblCaption; TotallblCaption)
            {
            }
            column(SubTotallblCaption; SubTotallblCaption)
            {
            }
            column(INRlblCaption; INRlblCaption)
            {
            }
            column(TermsDescription; TermsDescription)
            {
            }
            column(DeliveryDescription; DeliveryDescription)
            {
            }
            column(DelyAddresslblCaption; DelyAddresslblCaption)
            {
            }
            column(Name_Location; Name_Location)
            {
            }
            column(Name2_Location; Name2_Location)
            {
            }
            column(Address_Location; Address_Location)
            {
            }
            column(Address2_Location; Address2_Location)
            {
            }
            column(City_Location; City_Location)
            {
            }
            column(PostCode_Location; PostCode_Location)
            {
            }
            column(Country_Location; Country_Location)
            {
            }
            column(CurrencyCode; CurrencyCode)
            {
            }
            column(CurrencyCaption; CurrencyCaption)
            {
            }
            column(SplPackagingChargCaption; SplPackagingChargeslblCaption)
            {
            }
            column(InsuranceChargesCaption; InsuranceChargeslblCaption)
            {
            }
            column(CarriagecostCaption; CarriagecostlblCaption)
            {
            }
            column(PackingCharges; PackingCharges)
            {
            }
            column(InsuranceCharges; InsuranceCharges)
            {
            }
            column(carriagecost; carriagecost)
            {
            }
            column(Billing_Caption; BillingLblCaption)
            {
            }
            column(CurrencyCaptionlbl; CurrencyCaptionlbl)
            {
            }
            column(ForWeidmullerCaptionlbl; ForWeidmullerCaptionlbl)
            {
            }
            column(TaxesExtraCaptionlbl; TaxesExtraCaptionlbl)
            {
            }
            column(TotalvalueofPOCaptionlbl; TotalvalueofPOCaptionlbl)
            {
            }
            column(AmendmentNoCaptionlbl; AmendmentNoCaptionlbl)
            {
            }
            column(VendorCaptionlbl; VendorCaptionlbl)
            {
            }
            column(RefernceQuoteNoCaptionlbl; RefernceQuoteNoCaptionlbl)
            {
            }
            column(ProductCaptionlbl; ProductCaptionlbl)
            {
            }
            column(text002; text002)
            {
            }
            column(text003; text003)
            {
            }
            column(CINCaption; CINCaption)
            {
            }
            column(TCaption; Tcaption)
            {
            }
            column(GSTnoCaption; GSTnoCaption)
            {
            }
            column(Phonecaption; Phonecaption)
            {
            }
            column(CurrencyDesc; CurrencyDesc)
            {
            }
            column(DeliveryDate; "Purchase Header"."Posting Date")
            {
            }
            column(TermsofDelivery; Shipmentcode)
            {
            }
            column(text004; text004)
            {
            }
            dataitem(DataItem1000000001; Table39)
            {
                DataItemLink = Document No.=FIELD(No.);
                DataItemTableView = SORTING (Document Type, Document No., Line No.)
                                    ORDER(Ascending);
                column(Structure; Tax)
                {
                }
                column(Text5; Text5)
                {
                }
                column(Tax5; Tax5)
                {
                }
                column(Tax14; Tax14)
                {
                }
                column(HSNSACCode_PurchaseLine; "Purchase Line"."HSN/SAC Code")
                {
                }
                column(Tax_Amount; "Tax Amount")
                {
                }
                column(Tax_Percentage; "Tax %")
                {
                }
                column(SNo; SNo)
                {
                }
                column(No_PurchaseLine; "No.")
                {
                }
                column(Quantity_Purchase_Line; Quantity)
                {
                }
                column(Description_Purchase_Line; Description)
                {
                }
                column(Unit_Cost_Purchase_Line; "Unit Cost")
                {
                }
                column(Amount_Purchase_Line; Amount)
                {
                }
                column(TotalAmount; TotalAmount)
                {
                }
                column(GSTAmt; GSTAmt)
                {
                }
                column(LnTotal; LnTotal)
                {
                }
                column(TotalLines; TotalLines)
                {
                }
                column(UOM_Purchase_Line; "Unit of Measure")
                {
                }
                column(UnitofMeasureCode_PurchaseLine; "Unit of Measure Code")
                {
                }
                column(Line_NO_PurchaseLine; "Line No.")
                {
                }
                column(Comnt; Comnt)
                {
                }
                column(Description2_PurchLn; "Purchase Line"."Description 2")
                {
                }
                column(GST_PurchLn; "Purchase Line"."GST %")
                {
                }
                column(HSNSACCode_PurchLn; "Purchase Line"."HSN/SAC Code")
                {
                }

                trigger OnAfterGetRecord()
                begin
                    SNo := SNo + 1;
                    //ZE_LIJO 25.07.2019
                    //++
                    //TotalAmount := TotalAmount + "Purchase Line".Amount;
                    LnTotal := LnTotal + "Purchase Line".Amount;
                    GSTAmt := GSTAmt + "Purchase Line"."Total GST Amount";
                    TotalAmount := TotalAmount + "Purchase Line".Amount + "Purchase Line"."Total GST Amount";
                    //--
                    TotalLines := 0;
                    PurchLn.RESET;
                    PurchLn.SETFILTER(PurchLn."Document No.", "Purchase Header"."No.");
                    IF PurchLn.FINDSET THEN
                        REPEAT
                            TotalLines += 1;
                        UNTIL PurchLn.NEXT = 0;

                    IF tempint >= loopint THEN BEGIN
                        CurrReport.NEWPAGE;
                        tempint := 0;
                    END;
                    tempint := tempint + 1;

                    Var_Count := "Purchase Line".COUNT;
                end;

                trigger OnPreDataItem()
                begin
                    SNo := 0;

                    //ZE_LIJO 25.07.2019
                    //++
                    LnTotal := 0;
                    GSTAmt := 0;
                    TotalAmount := 0;
                    //--
                end;
            }
            dataitem(DataItem1000000078; Table2000000026)
            {
                DataItemTableView = SORTING (Number)
                                    ORDER(Ascending);
                column(space; space)
                {
                }

                trigger OnPreDataItem()
                begin
                    SETRANGE(Number, 1, loopint - tempint);
                    space := '1';
                end;
            }

            trigger OnAfterGetRecord()
            var
                PurchCommentLine: Record "43";
            begin
                PurchCommentLine.RESET;
                PurchCommentLine.SETRANGE(PurchCommentLine."Document Type", "Document Type");
                PurchCommentLine.SETRANGE(PurchCommentLine."No.", "No.");
                CommentCounter := PurchCommentLine.COUNT;
                tempint := CommentCounter;

                IF "Payment Terms Code" = '' THEN
                    PaymentTerms.INIT
                ELSE BEGIN
                    PaymentTerms.GET("Payment Terms Code");
                    PaymentTerms.TranslateDescription(PaymentTerms, "Purchase Header"."Language Code");
                END;

                IF "Shipment Method Code" = '' THEN
                    ShipmentMethod.INIT
                ELSE BEGIN
                    ShipmentMethod.GET("Shipment Method Code");
                    ShipmentMethod.TranslateDescription(ShipmentMethod, "Purchase Header"."Language Code");
                    Shipmentcode := ShipmentMethod.Description;
                END;

                IF Vendor.GET("Purchase Header"."Buy-from Vendor No.") THEN;

                Loc.RESET;
                Loc.SETRANGE(Code, "Purchase Header"."Location Code");
                IF Loc.FINDFIRST THEN BEGIN
                    Name_Location := Loc.Name;
                    Name2_Location := Loc."Name 2";
                    Address_Location := Loc.Address;
                    Address2_Location := Loc."Address 2";
                    City_Location := Loc.City;
                    PostCode_Location := Loc."Post Code";
                    Country_Location := Loc."Country/Region Code";
                END;

                IF "Purchase Header"."Currency Code" = '' THEN BEGIN
                    CurrencyCode := 'INR';
                    CurrencyCaption := 'INR';
                END ELSE
                    IF "Purchase Header"."Currency Code" = 'USD' THEN BEGIN
                        CurrencyCode := "Purchase Header"."Currency Code";
                        CurrencyCaption := 'USD';
                    END ELSE
                        IF "Purchase Header"."Currency Code" = 'EUR' THEN BEGIN
                            CurrencyCode := "Purchase Header"."Currency Code";
                            CurrencyCaption := 'EURO';
                        END;

                StructureOrderDetails.RESET;
                StructureOrderDetails.SETRANGE(StructureOrderDetails."Document No.", "No.");
                IF StructureOrderDetails.FINDFIRST THEN
                    REPEAT
                        IF StructureOrderDetails."Tax/Charge Group" = 'PACK' THEN BEGIN
                            PackingCharges := StructureOrderDetails."Calculation Value";
                        END
                        ELSE
                            IF StructureOrderDetails."Tax/Charge Group" = 'INSURANCE' THEN BEGIN
                                InsuranceCharges := StructureOrderDetails."Calculation Value";
                            END
                            ELSE
                                IF StructureOrderDetails."Tax/Charge Group" = 'CARRIAGE' THEN
                                    carriagecost := StructureOrderDetails."Calculation Value";
                    UNTIL StructureOrderDetails.NEXT = 0;

                PurchCommentLine.RESET;
                PurchCommentLine.SETRANGE(PurchCommentLine."Document Type", "Document Type");
                PurchCommentLine.SETRANGE(PurchCommentLine."No.", "No.");
                IF PurchCommentLine.FINDFIRST THEN
                    REPEAT
                        Comnt := Comnt + '<BR>' + PurchCommentLine.Comment;
                    UNTIL PurchCommentLine.NEXT = 0;

                //SE
                PurchaseHeaderArchive.SETRANGE(PurchaseHeaderArchive."No.", "Purchase Header"."No.");
                IF PurchaseHeaderArchive.FINDLAST THEN
                    PurchaseHeadNo := "Purchase Header"."No." + ' - R ' + FORMAT(PurchaseHeaderArchive."Version No.")
                ELSE
                    PurchaseHeadNo := "Purchase Header"."No.";

                //SE

                Currency.RESET;
                Currency.SETRANGE(Currency.Code, "Currency Code");
                IF Currency.FINDFIRST THEN
                    CurrencyDesc := Currency.Description;
            end;

            trigger OnPreDataItem()
            begin
                loopint := 15;

                IF JobWork THEN BEGIN
                    Desc := 'Article No';
                    Desc2 := 'Description';
                    PurchOrderCaption := 'PURCHASE ORDER (JOB WORK)';
                END ELSE BEGIN
                    Desc := 'Description';
                    Desc2 := 'Description 2';
                    PurchOrderCaption := 'PURCHASE ORDER';

                END
            end;
        }
    }

    requestpage
    {
        SaveValues = true;

        layout
        {
            area(content)
            {
                field("Job Work"; JobWork)
                {
                }
            }
        }

        actions
        {
        }
    }

    labels
    {
    }

    trigger OnInitReport()
    begin
        CompanyInfo.GET;
        CompanyInfo.CALCFIELDS(Picture)
    end;

    var
        PaymentTerms: Record "3";
        CompanyInfo: Record "79";
        Approvedbylblcaption: Label 'Authorized Signatory';
        Initiatedbylblcaption: Label 'Initiated by';
        PURCHASEORDERlblCaption: Label 'PURCHASE ORDER';
        DatelblCaption: Label 'PO Date';
        CSTNOlblCaption: Label 'CST NO.';
        TINNOlblCaption: Label 'TIN NO.';
        PurchaseordernolblCaption: Label 'PO No.';
        PaymentlblCaption: Label 'Payment Terms';
        ReflblCaption: Label 'Ref:';
        TermslblCaption: Label 'Terms of Delivery';
        DeliverylblCaption: Label 'Delivery Date';
        TolblCaption: Label 'To:';
        text001: Label 'The prices committed on this purchase order will remain firm, till the full execution of the order or any formal written communication.';
        slnolblCaption: Label 'Sl. no.';
        QTYlblCaption: Label 'Qty';
        UNITlblCaption: Label 'UNIT';
        DESCRIPTIONlblCaption: Label 'Description';
        UNITRATElblCaption: Label 'Unit Price';
        AMOUNTlblCaption: Label 'Total Value  ';
        TotallblCaption: Label 'TOTAL CURRENCY';
        SubTotallblCaption: Label 'SUBTOTAL';
        INRlblCaption: Label 'INR';
        SNo: Integer;
        TermsDescription: Text;
        DeliveryDescription: Text;
        DelyAddresslblCaption: Label 'Delivery Address';
        CurrencyCode: Code[20];
        CurrencyCaption: Text;
        loopint: Integer;
        tempint: Integer;
        space: Text;
        PurchCommentLine: Record "43";
        Comnt: Text[1024];
        Tax5: Decimal;
        Tax14: Decimal;
        Text5: Text;
        Text14: Text;
        Tax: Label 'Add VAT';
        SplPackagingChargeslblCaption: Label 'Spl. Packaging Charges';
        InsuranceChargeslblCaption: Label 'Insurance Charges';
        CarriagecostlblCaption: Label 'Carriage Cost';
        StructureOrderDetails: Record "13794";
        PackingCharges: Decimal;
        InsuranceCharges: Decimal;
        carriagecost: Decimal;
        Loc: Record "14";
        Name_Location: Text;
        Name2_Location: Text;
        Address_Location: Text;
        Address2_Location: Text;
        City_Location: Text;
        PostCode_Location: Text;
        Country_Location: Text;
        CommentCounter: Integer;
        BillingLblCaption: Label 'Billing Address ';
        PurchaseHeaderArchive: Record "5109";
        PurchaseHeadNo: Code[50];
        CurrencyCaptionlbl: Label 'Currency';
        ForWeidmullerCaptionlbl: Label 'For Weidmuller Electronics India Pvt. Ltd.';
        TaxesExtraCaptionlbl: Label 'Taxes Extra as Applicable';
        TotalvalueofPOCaptionlbl: Label 'Total Value';
        AmendmentNoCaptionlbl: Label 'Amendment No.';
        VendorCaptionlbl: Label 'Vendor';
        RefernceQuoteNoCaptionlbl: Label 'Reference Quote No.';
        ProductCaptionlbl: Label 'Article No';
        text002: Label 'The acceptance of this order shall be conveyed by the supplier to the purchaser within 7 days from the date of receipt of PO by supplier, failing which, it shall be deemed to be accepted unconditionally by the supplier.';
        text003: Label 'This Purchase Order is electronically approved; no signature is required.';
        Tcaption: Label 'Phone : +';
        CINCaption: Label 'CIN:';
        GSTnoCaption: Label 'GST No.';
        Phonecaption: Label 'Phone : +';
        Vendor: Record "23";
        Var_Count: Integer;
        Currency: Record "4";
        CurrencyDesc: Text;
        ShipmentMethod: Record "10";
        Shipmentcode: Text;
        text004: Label 'HSN / SAC Code is mandatory in the invoice.';
        ContinuedCaptionLbl: Label 'Continued.........';
        TotalAmount: Decimal;
        PurchLn: Record "39";
        TotalLines: Decimal;
        GSTAmt: Decimal;
        LnTotal: Decimal;
        JobWork: Boolean;
        Desc: Text;
        Desc2: Text;
        PurchOrderCaption: Text;
}

