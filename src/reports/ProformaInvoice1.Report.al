report 50010 "Proforma Invoice1"
{
    DefaultLayout = RDLC;
    RDLCLayout = './ProformaInvoice1.rdlc';

    dataset
    {
        dataitem(DataItem1000000000; Table36)
        {
            RequestFilterFields = "No.";
            column(SalesHeader_No; "Sales Header"."No.")
            {
            }
            column(SalesHeader_OrderDate; "Sales Header"."Order Date")
            {
            }
            column(SalesHeader_PostingDate; "Sales Header"."Posting Date")
            {
            }
            column(SalesHeader_DueDate; "Sales Header"."Due Date")
            {
            }
            column(SalesHeade_DocumentDate; "Sales Header"."Document Date")
            {
            }
            column(SalesHeader_SelltoCustomerNo; "Sales Header"."Sell-to Customer No.")
            {
            }
            column(SalesHeader_BilltoCustomerNo; "Sales Header"."Bill-to Customer No.")
            {
            }
            column(SalesHeader_BilltoName; "Sales Header"."Bill-to Name")
            {
            }
            column(SalesHeader_BilltoAddress; "Sales Header"."Bill-to Address")
            {
            }
            column(SalesHeader_BilltoAddress2; "Sales Header"."Bill-to Address 2")
            {
            }
            column(SalesHeader_SelltoCity_PostCode; "Sales Header"."Sell-to City" + ' - ' + "Sales Header"."Sell-to Post Code")
            {
            }
            column(SalesHeader_ShiptoCity_PostCode; "Sales Header"."Ship-to City" + ' - ' + "Sales Header"."Ship-to Post Code")
            {
            }
            column(SalesHeader_PaymentTermsCode; "Sales Header"."Payment Terms Code")
            {
            }
            column(SalesHeader_ShiptoName; "Sales Header"."Ship-to Name")
            {
            }
            column(SalesHeader_ShiptoAddress; "Sales Header"."Ship-to Address")
            {
            }
            column(SalesHeader_ShiptoAddress2; "Sales Header"."Ship-to Address 2")
            {
            }
            column(DocumentType_SalesHeader; "Document Type")
            {
            }
            column(External_Document_No; "Sales Header"."Your Reference")
            {
            }
            column(ModeofTransport_SalesHeader; "Sales Header"."Mode of Transport")
            {
            }
            column(TotalCaption; TotalCaptionLbl)
            {
            }
            column(Shipmentcode; Shipmentcode)
            {
            }
            column(TransPortCode; TransPortCode)
            {
            }
            column(Cust_No; Customer."No.")
            {
            }
            column(Cust_Name; Customer.Name)
            {
            }
            column(Cust_Address; Customer.Address)
            {
            }
            column(Cust_Address2; Customer."Address 2")
            {
            }
            column(Cust_Country; Customer."Country/Region Code")
            {
            }
            column(Cust_PostCode; Customer."Post Code")
            {
            }
            column(Cust_City; Customer.City)
            {
            }
            column(Cust_TIN_No; Customer."T.I.N. No.")
            {
            }
            column(Cust_CST_No; Customer."C.S.T. No.")
            {
            }
            column(Cust_FaxNo; Customer."Fax No.")
            {
            }
            column(Cust_EmailId; Customer."E-Mail")
            {
            }
            column(Cust_TelexNo; Customer."Phone No.")
            {
            }
            column(Cust_GSTNo; Customer."GST Registration No.")
            {
            }
            column(Picture; CompanyInfo.Picture)
            {
            }
            column(CompanyInfo_Name; CompanyInfo.Name)
            {
            }
            column(CompanyInfo_Address; CompanyInfo.Address)
            {
            }
            column(CompanyInfo_Address2; CompanyInfo."Address 2")
            {
            }
            column(CompanyInfo_PostCode; CompanyInfo."Post Code")
            {
            }
            column(CompanyInfo_City; CompanyInfo.City)
            {
            }
            column(CompanyInfo_Country; CompanyInfo.County)
            {
            }
            column(CompanyInfo_PhoneNo; CompanyInfo."Phone No.")
            {
            }
            column(CompanyInfo_TelexNo; CompanyInfo."Telex No.")
            {
            }
            column(CompanyInfo_EMail; CompanyInfo."E-Mail")
            {
            }
            column(CompanyInfo_HomePage; CompanyInfo."Home Page")
            {
            }
            column(CompanyInfo_BankName; CompanyInfo."Bank Name")
            {
            }
            column(CompanyInfo_IBAN; CompanyInfo.IBAN)
            {
            }
            column(CurrencyCode; CurrencyCode)
            {
            }
            column(CurrencyCaption; CurrencyCaption)
            {
            }
            column(Project; "Shortcut Dimension 1 Code")
            {
            }
            column(Structure; Structure)
            {
            }
            column(SalesHeadNo; SalesHeadNo)
            {
            }
            column(AmountCaption; AmountCap)
            {
            }
            column(Payment_Terms_Code; PaymentTermsDesc)
            {
            }
            column(OrderText; OrderText)
            {
            }
            column(PhoneNoCaptionLbl; PhoneNoCaptionLbl)
            {
            }
            column(WebCaptionLbl; WebCaptionLbl)
            {
            }
            column(Billing_AddressCaption; Billing_AddressCaptionLbl)
            {
            }
            column(Dispatch_Date_Caption; Dispatch_Date_CaptionLbl)
            {
            }
            column(OCNoCaptionLbl; OCNoCaptionLbl)
            {
            }
            column(CustomerPONoCaptionLbl; CustomerPONoCaptionLbl)
            {
            }
            column(TermsofDeliveryCaptionLbl; TermsofDeliveryCaptionLbl)
            {
            }
            column(TypeofDispatchCaptionLbl; TypeofDispatchCaptionLbl)
            {
            }
            column(TotalWeightCaptionLbl; TotalWeightCaptionLbl)
            {
            }
            column(CustomerNoCaptionLbl; CustomerNoCaptionLbl)
            {
            }
            column(CustomerNameCaptionLbl; CustomerNameCaptionLbl)
            {
            }
            column(AddressCaptionLbl; AddressCaptionLbl)
            {
            }
            column(PINCaptionLbl; PINCaptionLbl)
            {
            }
            column(GSTINCaptionLbl; GSTINCaptionLbl)
            {
            }
            column(Delivery_AddressCaption; Delivery_AddressCaptionLbl)
            {
            }
            column(TermsofPaymentCaptionLbl; TermsofPaymentCaptionLbl)
            {
            }
            column(PODateCaptionLbl; PODateCaptionLbl)
            {
            }
            dataitem(DataItem1000000001; Table37)
            {
                DataItemLink = Document Type=FIELD(Document Type),
                               Document No.=FIELD(No.);
                DataItemTableView = SORTING(Document Type,Document No.,Line No.);
                column(Tax_Amount;"Sales Line"."Tax Amount")
                {
                }
                column(Weight_SalesLine;"Sales Line".Weight)
                {
                }
                column(Tax_Percentage;"Sales Line"."Tax %")
                {
                }
                column(Sales_Line_Type;"Item Category Code")
                {
                }
                column(SalesLineAmt;"Sales Line"."Line Amount")
                {
                    AutoFormatExpression = "Sales Header"."Currency Code";
                    AutoFormatType = 1;
                }
                column(Desc_SalesLine;"Sales Line".Description)
                {
                }
                column(GeneralDescription;"Sales Line"."Description 2")
                {
                }
                column(No2_SalesLine;"No.")
                {
                }
                column(OrderQty_SalesLine;"Sales Line".Quantity * "Sales Line"."Unit Price")
                {
                }
                column(UnitofMeasure_SalesLine;"Unit of Measure Code")
                {
                }
                column(UnitPrice_SalesLine;"Sales Line"."Unit Price")
                {
                    AutoFormatExpression = "Sales Header"."Currency Code";
                    AutoFormatType = 2;
                }
                column(LineDiscount_SalesLine;"Line Discount %")
                {
                }
                column(LineAmt_SalesLine;LineAmt_SalesLine)
                {
                    AutoFormatExpression = "Sales Header"."Currency Code";
                    AutoFormatType = 1;
                }
                column(AllowInvDisc_SalesLine;"Allow Invoice Disc.")
                {
                }
                column(LineDiscount_SalesLineAmount;"Line Discount Amount")
                {
                }
                column(VATIdentifier_SalesLine;"VAT Identifier")
                {
                }
                column(SalesLine_Tax_Perct;"Tax Amount")
                {
                }
                column(No_SalesLine;"Sales Line"."Line No.")
                {
                }
                column(Hsn_Code;"Sales Line"."HSN/SAC Code")
                {
                }
                column(Req_Date_SalesLine;"Sales Line"."Requested Delivery Date")
                {
                }
                column(Promised_Date_SalesLine;"Sales Line"."Promised Delivery Date")
                {
                }
                column(AllowInvoiceDisYesNo;FORMAT("Sales Line"."Allow Invoice Disc."))
                {
                }
                column(SalesLineInvDiscAmount;SalesLine."Inv. Discount Amount")
                {
                    AutoFormatExpression = "Sales Header"."Currency Code";
                    AutoFormatType = 1;
                }
                column(SalesLineLineAmtInvDiscAmt;SalesLine."Line Amount" - SalesLine."Inv. Discount Amount")
                {
                    AutoFormatExpression = "Sales Header"."Currency Code";
                    AutoFormatType = 1;
                }
                column(SalesLineTaxAmount;SalesLine."Tax Amount")
                {
                    AutoFormatExpression = "Sales Header"."Currency Code";
                    AutoFormatType = 1;
                }
                column(No_SalesLineCaption;"Sales Line".FIELDCAPTION("No."))
                {
                }
                column(Description_SalesLineCaption;"Sales Line".FIELDCAPTION(Description))
                {
                }
                column(SalesLine_AmountToCustomer;"Amount To Customer")
                {
                }
                column(PrepmtPaymentTermsDescription;PrepmtPaymentTerms.Description)
                {
                }
                column(SLNoCaptison;SLNoCaptionLbl)
                {
                }
                column(No;No)
                {
                }
                column(ItemCodeCaption;ItemCodeCaption_lbl)
                {
                }
                column(Quantity_SalesLineCaption;QTYcaptionLbl)
                {
                }
                column(UnitofMeasure_SalesLineCaption;UnitCaptionLbl)
                {
                }
                column(AllowInvDisc_SalesLineCaption;"Sales Line".FIELDCAPTION("Allow Invoice Disc."))
                {
                }
                column(UnitPriceCaption;UnitPriceCaptionLbl)
                {
                }
                column(DescriptionCaptionLbl;DescriptionCaptionLbl)
                {
                }
                column(GeneralDescriptionCaptionLbl;GeneralDescriptionCaptionLbl)
                {
                }
                column(CustomerReferencenoCaptionLbl;CustomerReferencenoCaptionLbl)
                {
                }
                column(HSNCodeCaptionLbl;HSNCodeCaptionLbl)
                {
                }
                column(LeadtimeCaptionLbl;LeadtimeCaptionLbl)
                {
                }
                column(CurrentStockCaptionLbl;CurrentStockCaptionLbl)
                {
                }
                column(LineValueCaptionLbl;LineValueCaptionLbl)
                {
                }
                column(BankDetailsCaptionLbl;BankDetailsCaptionLbl)
                {
                }
                column(IBANCaptionLbl;IBANCaptionLbl)
                {
                }
                column(BICCodeCaptionLbl;BICCodeCaptionLbl)
                {
                }
                column(KtoCaptionLbl;KtoCaptionLbl)
                {
                }
                column(Text001;Text001)
                {
                }
                column(Text002;Text002)
                {
                }
                column(Text003;Text003)
                {
                }
                column(Text004;Text004)
                {
                }
                column(Text005;Text005)
                {
                }
                column(Text006;Text006)
                {
                }
                column(RequestDateCaptionLbl;RequestDateCaptionLbl)
                {
                }
                column(DeliveryDateCaptionLbl;DeliveryDateCaptionLbl)
                {
                }
                column(GSTlabelCaptionlbl;GSTlabelCaptionlbl)
                {
                }
                column(Var_Count;Var_Count)
                {
                }
                column(InventoryStock;InventoryStock)
                {
                }
                column(TotalGST;TotalGST)
                {
                }
                column(CrossReferenceNo_SalesLine;"Sales Line"."Cross-Reference No.")
                {
                }

                trigger OnAfterGetRecord()
                begin
                    No+=1;
                    Var_Count :="Sales Line".COUNT;
                    
                    IF Quantity <> 0 THEN
                     Unitcost := "Amount Including VAT" / Quantity;
                    
                    
                    // for Add VAT %
                    IF "Sales Line"."Tax %"=5 THEN
                      Tax5 := "Sales Line"."Tax Amount"
                    ELSE
                       Tax5 := 0;
                    
                    IF "Sales Line"."Tax %"=14.5 THEN
                      Tax14+="Sales Line"."Tax Amount"
                    ELSE
                       Tax14 := 0;
                    
                    
                    /*StateForms.RESET;
                    StateForms.SETRANGE(StateForms.State,State);
                    StateForms.SETRANGE(StateForms."Form Code","Form Code");
                    IF StateForms.FINDFIRST THEN BEGIN
                      Taxform:=StateForms."Form Description";
                    END;*/
                    LineAmt_SalesLine := "Sales Line".Quantity * Unitcost;
                    
                    
                    IF Item.GET("Sales Line"."No.") THEN BEGIN
                     Item.CALCFIELDS(Inventory);
                     InventoryStock :=Item.Inventory;
                     END;
                    
                    //GST Added
                    IGSTRate :=0;
                    IGSTAmount :=0;
                    TotalIGSTAmount:=0;
                    TotalGST:=0;
                    
                    DetailedGSTEntryBuffer.RESET;
                    DetailedGSTEntryBuffer.SETFILTER(DetailedGSTEntryBuffer."Document Type",'Order');
                    DetailedGSTEntryBuffer.SETRANGE(DetailedGSTEntryBuffer."Document No.",SalesLine."Document No.");
                    DetailedGSTEntryBuffer.SETRANGE(DetailedGSTEntryBuffer.Type,SalesLine.Type);
                    DetailedGSTEntryBuffer.SETRANGE(DetailedGSTEntryBuffer."No.",SalesLine."No.");
                    DetailedGSTEntryBuffer.SETFILTER(DetailedGSTEntryBuffer."GST Component Code",'CGST');
                    IF DetailedGSTEntryBuffer.FINDSET THEN BEGIN
                       CGSTRate:=DetailedGSTEntryBuffer."GST %";
                       CGSTAmount:=ABS(DetailedGSTEntryBuffer."GST Amount");
                       TotalCGSTAmount += CGSTAmount;
                    END;
                    
                    DetailedGSTEntryBuffer.RESET;
                    DetailedGSTEntryBuffer.SETFILTER(DetailedGSTEntryBuffer."Document Type",'Order');
                    DetailedGSTEntryBuffer.SETRANGE(DetailedGSTEntryBuffer."Document No.","Sales Line"."Document No.");
                    DetailedGSTEntryBuffer.SETRANGE(DetailedGSTEntryBuffer.Type,"Sales Line".Type);
                    DetailedGSTEntryBuffer.SETRANGE(DetailedGSTEntryBuffer."No.","Sales Line"."No.");
                    DetailedGSTEntryBuffer.SETFILTER(DetailedGSTEntryBuffer."GST Component Code",'SGST');
                    IF DetailedGSTEntryBuffer.FINDSET THEN BEGIN
                       SGSTRate:=DetailedGSTEntryBuffer."GST %";
                       SGSTAmount:=ABS(DetailedGSTEntryBuffer."GST Amount");
                       TotalSGSTAmount += SGSTAmount;
                    END;
                    
                    DetailedGSTEntryBuffer.RESET;
                    DetailedGSTEntryBuffer.SETFILTER(DetailedGSTEntryBuffer."Document Type",'Order');
                    DetailedGSTEntryBuffer.SETRANGE(DetailedGSTEntryBuffer."Document No.",SalesLine."Document No.");
                    DetailedGSTEntryBuffer.SETRANGE(DetailedGSTEntryBuffer.Type,SalesLine.Type);
                    DetailedGSTEntryBuffer.SETRANGE(DetailedGSTEntryBuffer."No.",SalesLine."No.");
                    DetailedGSTEntryBuffer.SETFILTER(DetailedGSTEntryBuffer."GST Component Code",'IGST');
                    IF DetailedGSTEntryBuffer.FINDSET THEN BEGIN
                       IGSTRate:=DetailedGSTEntryBuffer."GST %";
                       IGSTAmount:=ABS(DetailedGSTEntryBuffer."GST Amount");
                       TotalIGSTAmount += IGSTAmount;
                    END;
                    //GST Ended
                    
                    TotalGST :=TotalCGSTAmount+TotalSGSTAmount+TotalIGSTAmount;

                end;

                trigger OnPreDataItem()
                begin
                    No :=0;
                end;
            }
            dataitem(DataItem5444;Table2000000026)
            {
                DataItemTableView = SORTING(Number);
                column(Integer_Number;Number)
                {
                }

                trigger OnPreDataItem()
                begin
                    Integer.SETRANGE(Integer.Number,1,13-Var_Count);
                end;
            }

            trigger OnAfterGetRecord()
            begin

                IF "Document Type"="Document Type"::Order THEN
                    OrderText :='Proforma Invoice'
                ELSE IF "Document Type"="Document Type"::Quote THEN
                    OrderText :='Proforma  Invoice';

                CurrReport.LANGUAGE := Language.GetLanguageID("Language Code");
                CompanyInfo.GET;
                CompanyInfo.CALCFIELDS(Picture);

                Customer.RESET;
                IF Customer.GET("Sales Header"."Bill-to Customer No.") THEN;

                //SE
                SalesHeaderArchaive.SETRANGE(SalesHeaderArchaive."No.","Sales Header"."No.");
                IF SalesHeaderArchaive.FINDLAST THEN
                  SalesHeadNo := "Sales Header"."No." + ' -R '+ FORMAT(SalesHeaderArchaive."Version No.")
                ELSE
                  SalesHeadNo := "Sales Header"."No.";

                //SE


                IF "Shipment Method Code" = '' THEN
                  ShipmentMethod.INIT
                ELSE BEGIN
                  ShipmentMethod.GET("Shipment Method Code");
                  ShipmentMethod.TranslateDescription(ShipmentMethod,"Sales Header"."Language Code");
                  Shipmentcode :=ShipmentMethod.Description;
                END;

                IF "Transport Method" = '' THEN
                  TransportMethod.INIT
                ELSE BEGIN
                  TransportMethod.GET("Transport Method");
                  //TransportMethod.TranslateDescription(TransportMethod,"Sales Header"."Language Code");
                  TransPortCode :=TransportMethod.Description;
                END;

                IF "Sales Header"."Form Code"='C' THEN
                   Taxform :='C Form';

                IF "Sales Header"."Currency Code" = '' THEN BEGIN
                    CurrencyCode := 'INR';
                    CurrencyCaption :='INR';
                END ELSE
                IF "Sales Header"."Currency Code" = 'USD' THEN BEGIN
                    CurrencyCode := "Sales Header"."Currency Code";
                    CurrencyCaption :='USD';
                END ELSE
                IF "Sales Header"."Currency Code" = 'EUR' THEN BEGIN
                    CurrencyCode := "Sales Header"."Currency Code";
                    CurrencyCaption :='EURO';
                END;

                ShiptoAddress.RESET;
                ShiptoAddress.SETRANGE(ShiptoAddress.Code,"Ship-to Code");
                IF ShiptoAddress.FINDFIRST THEN;

                PaymentTerms.RESET;
                PaymentTerms.SETRANGE(PaymentTerms.Code,"Payment Terms Code");
                IF PaymentTerms.FINDFIRST THEN
                  PaymentTermsDesc :=PaymentTerms.Description;
            end;
        }
    }

    requestpage
    {

        layout
        {
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
    end;

    var
        CompanyInfo: Record "79";
        PageCaptionCap: Label 'Page %1 of %2';
        OrderNoCaptionLbl: Label 'Order No.';
        EMailCaptionLbl: Label 'E-Mail';
        PmtTermsDescCaptionLbl: Label 'Payment Terms';
        ShipMethodDescCaptionLbl: Label 'Shipment Method';
        PrepmtTermsDescCaptionLbl: Label 'Prepayment Payment Terms';
        DocDateCaptionLbl: Label 'Document Date';
        AmtCaptionLbl: Label 'Amount ';
        HdrDimsCaptionLbl: Label 'Header Dimensions';
        UnitPriceCaptionLbl: Label 'Unit Price in Rs';
        DiscPercentCaptionLbl: Label 'Discount %';
        LineDiscCaptionLbl: Label 'Line Discount Amount';
        SubtotalCaptionLbl: Label 'Subtotal';
        ExciseAmtCaptionLbl: Label 'Excise Amount';
        TaxAmtCaptionLbl: Label 'Tax Amount';
        ServTaxAmtCaptionLbl: Label 'Service Tax Amount';
        ChargesAmtCaptionLbl: Label 'Charges Amount';
        OtherTaxesAmtCaptionLbl: Label 'Other Taxes Amount';
        ServTaxeCessAmtCaptionLbl: Label 'Service Tax eCess Amount';
        TCSAmtCaptionLbl: Label 'TCS Amount';
        ServTaxSHECessAmtCaptionLbl: Label 'Service Tax SHECess Amount';
        VATDisctAmtCaptionLbl: Label 'Payment Discount on VAT';
        LineDimsCaptionLbl: Label 'Line Dimensions';
        VATAmtSpecCaptionLbl: Label 'VAT Amount Specification';
        InvDiscBaseAmtCaptionLbl: Label 'Invoice Discount Base Amount';
        ShipToAddrCaptionLbl: Label 'Ship-to Address';
        PmtTermsCaptionLbl: Label 'Description';
        GLAccNoCaptionLbl: Label 'G/L Account No.';
        PrepmtSpecCaptionLbl: Label 'Prepayment Specification';
        PrepmtVATAmtSpecCaptionLbl: Label 'Prepayment VAT Amount Specification';
        InvDiscAmtCaptionLbl: Label 'Invoice Discount Amount';
        VATPercentCaptionLbl: Label 'VAT %';
        VATBaseCaptionLbl: Label 'VAT Base';
        VATAmtCaptionLbl: Label 'VAT Amount';
        LineAmtCaptionLbl: Label 'Line Amount';
        VATIdentCaptionLbl: Label 'VAT Identifier';
        TotalCaptionLbl: Label 'TOTAL ORDER VALUE';
        ServTaxSBCAmtCaptionLbl: Label 'SBC Amount';
        KKCessAmtCaptionLbl: Label 'KK Cess Amount';
        NamecaptionLbl: Label 'Name';
        CitycaptionLbl: Label 'City';
        TelcaptionLbl: Label 'Tel.';
        TINCaptionLbl: Label 'TIN No.';
        FaxCaptionLbl: Label 'Fax';
        CountrycaptionLbl: Label 'Country';
        TermsconditionCaptionLbl: Label 'Terms & Conditions';
        PaymentCaptionLbl: Label 'with order confirmation';
        SalestaxformCaptionLbl: Label 'Sales Tax Form:';
        SalesTermsCaptionLbl: Label 'Sales Terms:';
        TransporterCaptionLbl: Label 'Transporter:   To be nominated by customer';
        ValidityofInvCaptionLbl: Label 'Validity of Proforma Invoice:';
        daysCaptionLbl: Label '7 days';
        DespatchCaptionLbl: Label 'Despatch Destination:';
        RemarkCaptionLbl: Label 'Remarks:';
        AdvancepctCaptionLbl: Label '100% Advance';
        RoundedoffCaptionLbl: Label 'Rounded Off';
        PayableCaptionLbl: Label 'Payable with:';
        AuthorisedCaptionLbl: Label 'Authorised Signatory';
        TypeCaptionLbl: Label 'Type';
        SLNoCaptionLbl: Label 'Sl. No.';
        ItemCodeCaption_lbl: Label 'Article No';
        UnitCaptionLbl: Label 'Price Unit';
        QTYcaptionLbl: Label 'Order Qty';
        Customer: Record "18";
        StateForms: Record "13767";
        PaymentTerms: Record "3";
        PrepmtPaymentTerms: Record "3";
        SalesLine: Record "37" temporary;
        ShipmentMethod: Record "10";
        TransportMethod: Record "259";
        Language: Record "8";
        loopint: Integer;
        tempint: Integer;
        space: Text;
        CustomerCaptionLbl: Label 'Customer';
        No: Integer;
        Taxform: Text[50];
        Shipmentcode: Text;
        CinCaptionLbl: Label 'CIN';
        TcaptionLbl: Label 'T:';
        PIOCNOCaptionLbl: Label 'PI/OC No.';
        PONOCaptionLbl: Label 'P.O. No.';
        ProjectCaptionLbl: Label 'Project';
        DatecaptionLbl: Label 'Date';
        AddCSTCaptionLbl: Label 'Add CST';
        CurrencyCode: Code[20];
        CurrencyCaption: Text;
        SameasbillingCaptionLbl: Label 'Same as billing address';
        Tax5: Decimal;
        Tax14: Decimal;
        Text5: Text;
        Text14: Text;
        Tax: Label 'Add VAT';
        SalesHeaderArchaive: Record "5107";
        SalesHeadNo: Code[50];
        CSTCaptionLbl: Label 'CST:';
        AmountCap: Code[30];
        Unitcost: Decimal;
        PaymentTermsDesc: Text;
        OrderText: Text;
        LineAmt_SalesLine: Decimal;
        Billing_AddressCaptionLbl: Label 'Billing Address';
        Delivery_AddressCaptionLbl: Label 'Shipping Address';
        Dispatch_Date_CaptionLbl: Label 'Date:';
        OCNoCaptionLbl: Label 'OC No.';
        TermsofDeliveryCaptionLbl: Label 'Terms of delivery:';
        TypeofDispatchCaptionLbl: Label 'Type of dispatch:';
        TotalWeightCaptionLbl: Label 'Total Weight of Order:';
        PhoneNoCaptionLbl: Label 'Phone No.';
        CustomerNoCaptionLbl: Label 'Customer No.';
        CustomerNameCaptionLbl: Label 'Customer Name';
        AddressCaptionLbl: Label 'Address';
        PINCaptionLbl: Label 'PIN';
        GSTINCaptionLbl: Label 'GSTIN';
        CustomerPONoCaptionLbl: Label 'Customer PO No.';
        TermsofPaymentCaptionLbl: Label 'Terms of Payment:';
        WebCaptionLbl: Label 'Web:';
        PODateCaptionLbl: Label 'PO Date:';
        ShiptoAddress: Record "222";
        TransPortCode: Text;
        DescriptionCaptionLbl: Label 'Description';
        GeneralDescriptionCaptionLbl: Label 'General Description';
        CustomerReferencenoCaptionLbl: Label 'Customer Reference no';
        HSNCodeCaptionLbl: Label 'HSN Code';
        LeadtimeCaptionLbl: Label 'Lead time in Weeks';
        CurrentStockCaptionLbl: Label 'Current Stock *';
        LineValueCaptionLbl: Label 'Line Value in Rs';
        BankDetailsCaptionLbl: Label 'Bank Details';
        IBANCaptionLbl: Label 'IBAN';
        BICCodeCaptionLbl: Label 'BIC Code:';
        KtoCaptionLbl: Label 'Kto.';
        Text001: Label '* Kindly Note te stock situaton is Dynamic. The Confirmed delivery date will be informed at the time of Order Confirmation';
        Text002: Label 'You are advised to check (if not already mentioned in your order):';
        Text003: Label 'Prices (special prices will only be considered when offer number was mentioned)';
        Text004: Label 'Forwarder and shipping details have to be provided immediately after receipt of order confirmation/proforma invoice';
        Text005: Label 'Any change after preparation of documents cannot be accepted!';
        Text006: Label 'Taxes extra as applicable';
        RequestDateCaptionLbl: Label 'REQUEST DATE';
        DeliveryDateCaptionLbl: Label 'DELIVERY DATE';
        Var_Count: Integer;
        GSTlabelCaptionlbl: Label 'Total GST';
        Item: Record "27";
        DetailedGSTEntryBuffer: Record "16412";
        CGSTRate: Decimal;
        CGSTAmount: Decimal;
        SGSTRate: Decimal;
        SGSTAmount: Decimal;
        IGSTRate: Decimal;
        IGSTAmount: Decimal;
        TotalCGSTAmount: Decimal;
        TotalSGSTAmount: Decimal;
        TotalIGSTAmount: Decimal;
        TotalGST: Decimal;
        InventoryStock: Integer;
}

