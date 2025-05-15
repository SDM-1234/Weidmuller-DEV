report 50006 GRN
{
    DefaultLayout = RDLC;
    RDLCLayout = './GRN.rdlc';

    dataset
    {
        dataitem(DataItem1000000000; Table120)
        {
            RequestFilterFields = "No.";
            column(PurchRcptHeader_No; "Purch. Rcpt. Header"."No.")
            {
            }
            column(BuyfromVendorNo_PurchRcptHeader; "Purch. Rcpt. Header"."Buy-from Vendor No.")
            {
            }
            column(TotalWeight; TotalWeight)
            {
            }
            column(PurchRcptHeader_OrderDate; "Purch. Rcpt. Header"."Order Date")
            {
            }
            column(PurchRcptHeader_PostingDate; "Purch. Rcpt. Header"."Posting Date")
            {
            }
            column(PurchRcptHeader_OrderNo; "Purch. Rcpt. Header"."Order No.")
            {
            }
            column(VendorShipmentNo_PurchRcptHeader; "Purch. Rcpt. Header"."Vendor Shipment No.")
            {
            }
            column(Description_Payment_Terms; PaymentTerms.Description)
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
            column(PhoneNo2_CompanyInfo; CompanyInfo."Phone No. 2")
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
            column(Receivedbylblcaption; Receivedbylblcaption)
            {
            }
            column(GoodsReceiptCaption; GoodsReceiptCaptionLbl)
            {
            }
            column(CheckedbycaptionLbl; CheckedbycaptionLbl)
            {
            }
            column(Tcaption; Tcaption)
            {
            }
            column(CINCaption; CINCaption)
            {
            }
            column(SupplierNameCaption; SupplierNameCaptionLbl)
            {
            }
            column(SupplierCaption; SupplierCaptionLbl)
            {
            }
            column(GoodsReceiptDateCaption; GoodsReceiptDateCaptionLbl)
            {
            }
            column(TotalWeightCaption; TotalWeightCaptionLbl)
            {
            }
            column(TotalNoofBoxesCaption; TotalNoofBoxesCaptionLbl)
            {
            }
            column(PurchaseOrderCaption; PurchaseOrderCaptionLbl)
            {
            }
            column(SupplierInvoiceCaption; SupplierInvoiceCaptionLbl)
            {
            }
            column(GRNCaption; GRNCaptionLbl)
            {
            }
            column(DateCaption; DateCaption)
            {
            }
            column(ItemCaption; ItemCaptionLbl)
            {
            }
            column(DescCaption; DescCaptionLbl)
            {
            }
            column(POQtyCaption; POQtyCaptionLbl)
            {
            }
            column(RecdQtyCaption; RecdQtyCaptionLbl)
            {
            }
            column(RejectedQtyCaption; RejectedQtyCaptionLbl)
            {
            }
            column(RemarksCaption; RemarksCaptionLbl)
            {
            }
            column(BinCaption; BinCaptionLbl)
            {
            }
            column(SLNoCaption; SLNoCaptionLbl)
            {
            }
            dataitem(DataItem1000000001; Table121)
            {
                DataItemLink = Document No.=FIELD(No.);
                DataItemTableView = SORTING (Document No., Line No.)
                                    ORDER(Ascending)
                                    WHERE (Quantity = FILTER (> 0));
                column(SNo; SNo)
                {
                }
                column(No_PurchRcptLine; "Purch. Rcpt. Line"."No.")
                {
                }
                column(Description_PurchRcptLine; "Purch. Rcpt. Line".Description)
                {
                }
                column(Quantity_PurchRcptLine; "Purch. Rcpt. Line".Quantity)
                {
                }
                column(TotalNoofBoxes_PurchRcptLine; "Purch. Rcpt. Line"."Total No of Boxes")
                {
                }
                column(BinCode_PurchRcptLine; "Purch. Rcpt. Line"."Bin Code")
                {
                }

                trigger OnAfterGetRecord()
                begin
                    SNo := SNo + 1;
                    IF tempint >= loopint THEN BEGIN
                        CurrReport.NEWPAGE;
                        tempint := 0;
                    END;
                    tempint := tempint + 1;

                    Var_Count := "Purch. Rcpt. Line".COUNT;
                end;

                trigger OnPreDataItem()
                begin
                    SNo := 0;
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
                PurchRcptLine: Record "121";
            begin
                /*PurchCommentLine.RESET;
                PurchCommentLine.SETRANGE(PurchCommentLine."Document Type","Document Type");
                PurchCommentLine.SETRANGE(PurchCommentLine."No.","No.");
                CommentCounter:=PurchCommentLine.COUNT;
                tempint :=CommentCounter;
                
                IF "Payment Terms Code" = '' THEN
                  PaymentTerms.INIT
                ELSE BEGIN
                  PaymentTerms.GET("Payment Terms Code");
                  PaymentTerms.TranslateDescription(PaymentTerms,"Purchase Header"."Language Code");
                END;
                
                IF "Shipment Method Code" = '' THEN
                  ShipmentMethod.INIT
                ELSE BEGIN
                  ShipmentMethod.GET("Shipment Method Code");
                  ShipmentMethod.TranslateDescription(ShipmentMethod,"Purchase Header"."Language Code");
                  Shipmentcode :=ShipmentMethod.Description;
                END;
                
                IF Vendor.GET("Purchase Header"."Buy-from Vendor No.") THEN;
                
                Loc.RESET;
                Loc.SETRANGE(Code,"Purchase Header"."Location Code");
                IF Loc.FINDFIRST THEN
                  Name_Location := Loc.Name;
                  Name2_Location := Loc."Name 2";
                  Address_Location  := Loc.Address;
                  Address2_Location :=Loc."Address 2";
                  City_Location :=Loc.City;
                  PostCode_Location := Loc."Post Code";
                  Country_Location := Loc."Country/Region Code";
                
                
                IF "Purchase Header"."Currency Code" = '' THEN BEGIN
                    CurrencyCode := 'INR';
                    CurrencyCaption :='INR';
                END ELSE
                IF "Purchase Header"."Currency Code" = 'USD' THEN BEGIN
                    CurrencyCode := "Purchase Header"."Currency Code";
                    CurrencyCaption :='USD';
                END ELSE
                IF "Purchase Header"."Currency Code" = 'EUR' THEN BEGIN
                    CurrencyCode := "Purchase Header"."Currency Code";
                    CurrencyCaption :='EURO';
                END;
                
                StructureOrderDetails.RESET;
                StructureOrderDetails.SETRANGE(StructureOrderDetails."Document No.","No.");
                IF StructureOrderDetails.FINDFIRST THEN REPEAT
                  IF StructureOrderDetails."Tax/Charge Group"='PACK' THEN  BEGIN
                      PackingCharges :=StructureOrderDetails."Calculation Value";
                  END
                   ELSE IF StructureOrderDetails."Tax/Charge Group"='INSURANCE' THEN BEGIN
                     InsuranceCharges :=StructureOrderDetails."Calculation Value";
                  END
                   ELSE IF StructureOrderDetails."Tax/Charge Group"='CARRIAGE' THEN
                     carriagecost :=StructureOrderDetails."Calculation Value";
                UNTIL StructureOrderDetails.NEXT=0;
                
                PurchCommentLine.RESET;
                PurchCommentLine.SETRANGE(PurchCommentLine."Document Type","Document Type");
                PurchCommentLine.SETRANGE(PurchCommentLine."No.","No.");
                IF PurchCommentLine.FINDFIRST THEN REPEAT
                  Comnt:=Comnt + '<BR>' + PurchCommentLine.Comment;
                UNTIL PurchCommentLine.NEXT=0;
                
                //SE
                PurchaseHeaderArchive.SETRANGE(PurchaseHeaderArchive."No.","Purchase Header"."No.");
                IF PurchaseHeaderArchive.FINDLAST THEN
                  PurchaseHeadNo := "Purchase Header"."No." + ' - R '+ FORMAT(PurchaseHeaderArchive."Version No.")
                ELSE
                  PurchaseHeadNo := "Purchase Header"."No.";
                
                //SE
                
                Currency.RESET;
                Currency.SETRANGE(Currency.Code,"Currency Code");
                IF Currency.FINDFIRST THEN
                  CurrencyDesc :=Currency.Description;
                */
                TotalWeight := 0;
                PurchRcptLine.RESET;
                PurchRcptLine.SETRANGE("Document No.", "Purch. Rcpt. Header"."No.");
                IF PurchRcptLine.FINDSET THEN
                    REPEAT
                        TotalWeight += PurchRcptLine.Weight;
                    UNTIL PurchRcptLine.NEXT = 0;

            end;

            trigger OnPreDataItem()
            begin
                loopint := 15;
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
        CompanyInfo.CALCFIELDS(Picture)
    end;

    var
        PaymentTerms: Record "3";
        CompanyInfo: Record "79";
        Approvedbylblcaption: Label 'Approved By';
        Receivedbylblcaption: Label 'Received By';
        CheckedbycaptionLbl: Label 'Checked By';
        GoodsReceiptCaptionLbl: Label 'Goods Receipts Note';
        SNo: Integer;
        TermsDescription: Text;
        DeliveryDescription: Text;
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
        PurchaseHeaderArchive: Record "5109";
        PurchaseHeadNo: Code[50];
        Tcaption: Label 'T+';
        CINCaption: Label 'CIN:';
        GSTnoCaption: Label 'GST No.';
        Phonecaption: Label 'Phone : +';
        Vendor: Record "23";
        Var_Count: Integer;
        Currency: Record "4";
        CurrencyDesc: Text;
        ShipmentMethod: Record "10";
        Shipmentcode: Text;
        SupplierNameCaptionLbl: Label 'Supplier Name:';
        SupplierCaptionLbl: Label 'Supplier #:';
        GoodsReceiptDateCaptionLbl: Label 'Goods Receipts Date:';
        TotalWeightCaptionLbl: Label 'Total Weight of the consignment:';
        TotalNoofBoxesCaptionLbl: Label 'Total No of Boxes';
        PurchaseOrderCaptionLbl: Label 'Purchase Order#:';
        SupplierInvoiceCaptionLbl: Label 'Supplier Invoice #:';
        GRNCaptionLbl: Label 'GRN#:';
        DateCaption: Label 'Date:';
        ItemCaptionLbl: Label 'Item #';
        DescCaptionLbl: Label 'Description';
        POQtyCaptionLbl: Label 'P O Qty';
        RecdQtyCaptionLbl: Label 'Recd Qty';
        RejectedQtyCaptionLbl: Label 'Rejected Qty';
        RemarksCaptionLbl: Label 'Remarks';
        TotalWeight: Decimal;
        BinCaptionLbl: Label 'BIN';
        SLNoCaptionLbl: Label 'Sl. No.';
}

