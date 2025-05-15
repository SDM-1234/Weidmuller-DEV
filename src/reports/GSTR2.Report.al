report 16403 "GSTR-2"
{
    DefaultLayout = RDLC;
    RDLCLayout = './GSTR2.rdlc';
    Caption = 'GSTR-2';

    dataset
    {
        dataitem(DataItem1500000; Table2000000026)
        {
            DataItemTableView = SORTING (Number)
                                ORDER(Ascending)
                                WHERE (Number = FILTER (1));
            column(TitleLbl; TitleLbl)
            {
            }
            column(Title2Lbl; Title2Lbl)
            {
            }
            column(Title3Lbl; Title3Lbl)
            {
            }
            column(Title4Lbl; Title4Lbl)
            {
            }
            column(HeadingLbl; HeadingLbl)
            {
            }
            column(GSTLbl; GSTLbl)
            {
            }
            column(PersonNameLbl; PersonNameLbl)
            {
            }
            column(PersonSubLbl; PersonSubLbl)
            {
            }
            column(PeriodLbl; PeriodLbl)
            {
            }
            column(TaxablePersonsHeadingLbl; TaxablePersonsHeadingLbl)
            {
            }
            column(FiguresLbl; FiguresLbl)
            {
            }
            column(GSTINLbl; GSTINLbl)
            {
            }
            column(InvoiceLbl; InvoiceLbl)
            {
            }
            column(NoLbl; NoLbl)
            {
            }
            column(DateLbl; DateLbl)
            {
            }
            column(ValueLbl; ValueLbl)
            {
            }
            column(GoodSerLbl; GoodSerLbl)
            {
            }
            column(HSNSACLbl; HSNSACLbl)
            {
            }
            column(TaxableLbl; TaxableLbl)
            {
            }
            column(IGSTLbl; IGSTLbl)
            {
            }
            column(CGSTLbl; CGSTLbl)
            {
            }
            column(SGSTLbl; SGSTLbl)
            {
            }
            column(RateLbl; RateLbl)
            {
            }
            column(AmtLbl; AmtLbl)
            {
            }
            column(POSLbl; POSLbl)
            {
            }
            column(EligibilityOfITCLbl; EligibilityOfITCLbl)
            {
            }
            column(TotalTaxLbl; TotalTaxLbl)
            {
            }
            column(ITCAvailLbl; ITCAvailLbl)
            {
            }
            column(SuppliesAttractingLbl; SuppliesAttractingLbl)
            {
            }
            column(NoteLbl; NoteLbl)
            {
            }
            column(Note2Lbl; Note2Lbl)
            {
            }
            column(AmmendmentsHeading1Lbl; AmmendmentsHeading1Lbl)
            {
            }
            column(OriginalInvLbl; OriginalInvLbl)
            {
            }
            column(RevDetLbl; RevDetLbl)
            {
            }
            column(GSTINSuppLbl; GSTINSuppLbl)
            {
            }
            column(SuppliesAttractLbl; SuppliesAttractLbl)
            {
            }
            column(SuppliesAttract2Lbl; SuppliesAttract2Lbl)
            {
            }
            column(GoodsCapitalLbl; GoodsCapitalLbl)
            {
            }
            column(BillOfEntryLbl; BillOfEntryLbl)
            {
            }
            column(EligibilityOfITC2Lbl; EligibilityOfITC2Lbl)
            {
            }
            column(TotalIGSTLbl; TotalIGSTLbl)
            {
            }
            column(ITCAvail2Lbl; ITCAvail2Lbl)
            {
            }
            column(AmmendmentsHeading2Lbl; AmmendmentsHeading2Lbl)
            {
            }
            column(OriginalBillLbl; OriginalBillLbl)
            {
            }
            column(RevisedDetLbl; RevisedDetLbl)
            {
            }
            column(EligibilityOfITC3Lbl; EligibilityOfITC3Lbl)
            {
            }
            column(ServiceReceivedHeadlingLbl; ServiceReceivedHeadlingLbl)
            {
            }
            column(SACLbl; SACLbl)
            {
            }
            column(HSNLbl; HSNLbl)
            {
            }
            column(ITCAdmissLbl; ITCAdmissLbl)
            {
            }
            column(TotITCAdmissLbl; TotITCAdmissLbl)
            {
            }
            column(ITCAdmissMonthLbl; ITCAdmissMonthLbl)
            {
            }
            column(AmmendmentHeading3Lbl; AmmendmentHeading3Lbl)
            {
            }
            column(RevDetInvLbl; RevDetInvLbl)
            {
            }
            column(DetailsHeadingLbl; DetailsHeadingLbl)
            {
            }
            column(GSTnLbl; GSTnLbl)
            {
            }
            column(TypeofNoteLbl; TypeofNoteLbl)
            {
            }
            column(DebitCreditNoteLbl; DebitCreditNoteLbl)
            {
            }
            column(DiffValueLbl; DiffValueLbl)
            {
            }
            column(DiffTaxLbl; DiffTaxLbl)
            {
            }
            column(EligibilityTypeLbl; EligibilityTypeLbl)
            {
            }
            column(TotTaxLbl; TotTaxLbl)
            {
            }
            column(ITCAvailMonthLbl; ITCAvailMonthLbl)
            {
            }
            column(RevChargeLbl; RevChargeLbl)
            {
            }
            column(RevChrgLbl; RevChrgLbl)
            {
            }
            column(AmmendmentHeading4Lbl; AmmendmentHeading4Lbl)
            {
            }
            column(OrgDebitCreditNoteLbl; OrgDebitCreditNoteLbl)
            {
            }
            column(RevDetCreditDebitNoteLbl; RevDetCreditDebitNoteLbl)
            {
            }
            column(SuppRecLbl; SuppRecLbl)
            {
            }
            column(DescriptionLbl; DescriptionLbl)
            {
            }
            column(HSNSACCodeLbl; HSNSACCodeLbl)
            {
            }
            column(CompoundingLbl; CompoundingLbl)
            {
            }
            column(UnregTaxLbl; UnregTaxLbl)
            {
            }
            column(ExemptLbl; ExemptLbl)
            {
            }
            column(NilRateLbl; NilRateLbl)
            {
            }
            column(NonGSTLbl; NonGSTLbl)
            {
            }
            column(ValueSuppLbl; ValueSuppLbl)
            {
            }
            column(ISDCreditHeadingLbl; ISDCreditHeadingLbl)
            {
            }
            column(GSTINISDLbl; GSTINISDLbl)
            {
            }
            column(InvDocLbl; InvDocLbl)
            {
            }
            column(ISDCreditLbl; ISDCreditLbl)
            {
            }
            column(TDSCreditRecHeadingLbl; TDSCreditRecHeadingLbl)
            {
            }
            column(GSTINDetLbl; GSTINDetLbl)
            {
            }
            column(InvDoc2Lbl; InvDoc2Lbl)
            {
            }
            column(PaymentLbl; PaymentLbl)
            {
            }
            column(TDSIGST_Lbl; TDSIGST_Lbl)
            {
            }
            column(TDSCGST_Lbl; TDSCGST_Lbl)
            {
            }
            column(TDSSGST_Lbl; TDSSGST_Lbl)
            {
            }
            column(TCSCreditRevHeadingLbl; TCSCreditRevHeadingLbl)
            {
            }
            column(GSTINEcommerceLbl; GSTINEcommerceLbl)
            {
            }
            column(MerchantLbl; MerchantLbl)
            {
            }
            column(GrossValLbl; GrossValLbl)
            {
            }
            column(TaxableValLbl; TaxableValLbl)
            {
            }
            column(TCSIGST_Lbl; TCSIGST_Lbl)
            {
            }
            column(TCSCGST_Lbl; TCSCGST_Lbl)
            {
            }
            column(TCSSGST_Lbl; TCSSGST_Lbl)
            {
            }
            column(ITCRecHeadingLbl; ITCRecHeadingLbl)
            {
            }
            column(OrgInvDoc2Lbl; OrgInvDoc2Lbl)
            {
            }
            column(ITCAvail3Lbl; ITCAvail3Lbl)
            {
            }
            column(EarlierLbl; EarlierLbl)
            {
            }
            column(ThisMonthLbl; ThisMonthLbl)
            {
            }
            column(UnderRevChargeLbl; UnderRevChargeLbl)
            {
            }
            column(GSTINNameOfUnregLbl; GSTINNameOfUnregLbl)
            {
            }
            column(StateCodeLbl; StateCodeLbl)
            {
            }
            column(DocNoLbl; DocNoLbl)
            {
            }
            column(DocDateLbl; DocDateLbl)
            {
            }
            column(HSNSACSuppLbl; HSNSACSuppLbl)
            {
            }
            column(TAXLbl; TAXLbl)
            {
            }
            column(Note3Lbl; Note3Lbl)
            {
            }
            column(AmmendmentHeading5Lbl; AmmendmentHeading5Lbl)
            {
            }
            column(OrgDetLbl; OrgDetLbl)
            {
            }
            column(GSTINCustNameLbl; GSTINCustNameLbl)
            {
            }
            column(RevDet3Lbl; RevDet3Lbl)
            {
            }
            column(HSNSuppMadLbl; HSNSuppMadLbl)
            {
            }
            column(TaxAlreadyPaidHeadingLbl; TaxAlreadyPaidHeadingLbl)
            {
            }
            column(InvNoLbl; InvNoLbl)
            {
            }
            column(InvDateLbl; InvDateLbl)
            {
            }
            column(TransactionIDLbl; TransactionIDLbl)
            {
            }
            column(TaxPaidTimeLbl; TaxPaidTimeLbl)
            {
            }
            column(Note4Lbl; Note4Lbl)
            {
            }
            column(ITCRevHeadingLbl; ITCRevHeadingLbl)
            {
            }
            column(SNoLbl; SNoLbl)
            {
            }
            column(Description2Lbl; Description2Lbl)
            {
            }
            column(ITCRevLbl; ITCRevLbl)
            {
            }
            column(Note5Lbl; Note5Lbl)
            {
            }
            column(Note6Lbl; Note6Lbl)
            {
            }
            column(Note7Lbl; Note7Lbl)
            {
            }
            column(AmmendmentHeading6Lbl; AmmendmentHeading6Lbl)
            {
            }
            column(TaxPeriodLbl; TaxPeriodLbl)
            {
            }
            column(Declare2Lbl; Declare2Lbl)
            {
            }
            column(PlaceLbl; PlaceLbl)
            {
            }
            column(Date2Lbl; Date2Lbl)
            {
            }
            column(SignatureLbl; SignatureLbl)
            {
            }
            column(Note8Lbl; Note8Lbl)
            {
            }
            column(Note9Lbl; Note9Lbl)
            {
            }
            column(Note10Lbl; Note10Lbl)
            {
            }
            column(Note11Lbl; Note11Lbl)
            {
            }
            column(Note12Lbl; Note12Lbl)
            {
            }
            column(GSTComponent_1; GSTComp[1])
            {
            }
            column(GSTComponent_2; GSTComp[2])
            {
            }
            column(GSTComponent_3; GSTComp[3])
            {
            }
            column(GSTComponent_4; GSTComp[4])
            {
            }
            column(GSTComponent_5; GSTComp[5])
            {
            }
            column(GSTINLocation; GSTINLocation)
            {
            }
            column(TaxablePerson; TaxablePerson)
            {
            }
            column(AggregateTurnOver; AggregateTurnOver)
            {
            }
            column(Period; Period)
            {
            }
            column(PersonName; PersonName)
            {
            }
            column(Place; Place)
            {
            }
            column(Year; Year)
            {
            }
            column(Date; FORMAT(Date))
            {
            }
            column(Declare3Lbl; Declare3Lbl)
            {
            }

            trigger OnPreDataItem()
            begin
                i := 1;
                GSTComponent.SETCURRENTKEY("Report View");
                GSTComponent.ASCENDING(TRUE);
                IF GSTComponent.FINDSET THEN BEGIN
                    REPEAT
                        GSTComp[i] := GSTComponent.Code;
                        i += 1;
                    UNTIL GSTComponent.NEXT = 0;
                END ELSE
                    ERROR(ReportViewErr);
            end;
        }
        dataitem(DataItem1500144; Table16419)
        {
            column(BuyerSellerRegNo_1; BuyerSellerRegNo[1])
            {
            }
            column(InvoiceNo_1; InvoiceNo[1])
            {
            }
            column(GoodsService_1; GoodsService[1])
            {
            }
            column(HSNSAC_1; HSNSAC[1])
            {
            }
            column(Pos_1; Pos[1])
            {
            }
            column(GSTGroupType_1; FORMAT(GSTGroupType[1]))
            {
            }
            column(PostingDate_1; FORMAT(PostingDate[1]))
            {
            }
            column(GSTBaseAmt_1; GSTBaseAmt[1])
            {
            }
            column(GSTCompRate_1; GSTCompRate[1])
            {
            }
            column(GSTCompRate_2; GSTCompRate[2])
            {
            }
            column(GSTCompRate_3; GSTCompRate[3])
            {
            }
            column(GSTCompAmt_1; GSTCompAmt[1])
            {
            }
            column(GSTCompAmt_2; GSTCompAmt[2])
            {
            }
            column(GSTCompAmt_3; GSTCompAmt[3])
            {
            }
            column(ITCAmt_1; ITCAmt[1])
            {
            }
            column(ITCAmt_2; ITCAmt[2])
            {
            }
            column(ITCAmt_3; ITCAmt[3])
            {
            }
            column(BuyerSellerRegNo_7; BuyerSellerRegNo[7])
            {
            }
            column(InvoiceNo_7; InvoiceNo[7])
            {
            }
            column(GoodsService_7; GoodsService[7])
            {
            }
            column(HSNSAC_7; HSNSAC[7])
            {
            }
            column(Pos_7; Pos[7])
            {
            }
            column(GSTGroupType_7; FORMAT(GSTGroupType[7]))
            {
            }
            column(PostingDate_7; FORMAT(PostingDate[7]))
            {
            }
            column(GSTBaseAmt_8; GSTBaseAmt[8])
            {
            }
            column(GSTCompRate_22; GSTCompRate[22])
            {
            }
            column(GSTCompRate_23; GSTCompRate[23])
            {
            }
            column(GSTCompRate_24; GSTCompRate[24])
            {
            }
            column(GSTCompAmt_22; GSTCompAmt[22])
            {
            }
            column(GSTCompAmt_23; GSTCompAmt[23])
            {
            }
            column(GSTCompAmt_24; GSTCompAmt[24])
            {
            }
            column(BillofEntryNo; BillofEntryNo)
            {
            }
            column(BillofEntryDate; BillofEntryDate)
            {
            }
            column(BillofEntryValue; BillofEntryValue)
            {
            }
            column(HSNSAC_2; HSNSAC[2])
            {
            }
            column(GSTBaseAmt_2; GSTBaseAmt[2])
            {
            }
            column(GSTGroupType_2; FORMAT(GSTGroupType[2]))
            {
            }
            column(GSTCompRate_4; GSTCompRate[4])
            {
            }
            column(GSTCompRate_5; GSTCompRate[5])
            {
            }
            column(GSTCompRate_6; GSTCompRate[6])
            {
            }
            column(GSTCompAmt_4; GSTCompAmt[4])
            {
            }
            column(GSTCompAmt_5; GSTCompAmt[5])
            {
            }
            column(GSTCompAmt_6; GSTCompAmt[6])
            {
            }
            column(ITCAmt_4; ITCAmt[4])
            {
            }
            column(ITCAmt_5; ITCAmt[5])
            {
            }
            column(ITCAmt_6; ITCAmt[6])
            {
            }
            column(InvoiceNo_2; InvoiceNo[2])
            {
            }
            column(GSTBaseAmt_3; GSTBaseAmt[3])
            {
            }
            column(HSNSAC_3; HSNSAC[3])
            {
            }
            column(PostingDate_8; PostingDate[8])
            {
            }
            column(GSTCompRate_7; GSTCompRate[7])
            {
            }
            column(GSTCompRate_8; GSTCompRate[8])
            {
            }
            column(GSTCompRate_9; GSTCompRate[9])
            {
            }
            column(GSTCompAmt_7; GSTCompAmt[7])
            {
            }
            column(GSTCompAmt_8; GSTCompAmt[8])
            {
            }
            column(GSTCompAmt_9; GSTCompAmt[9])
            {
            }
            column(ITCAmt_7; ITCAmt[7])
            {
            }
            column(ITCAmt_8; ITCAmt[8])
            {
            }
            column(ITCAmt_9; ITCAmt[9])
            {
            }
            column(BuyerSellerRegNo_2; BuyerSellerRegNo[2])
            {
            }
            column(DocumentType_1; DocumentType[1])
            {
            }
            column(DocumentNo_1; DocumentNo[1])
            {
            }
            column(PostingDate_2; FORMAT(PostingDate[2]))
            {
            }
            column(GSTBaseAmt_4; GSTBaseAmt[4])
            {
            }
            column(GSTGroupType_3; FORMAT(GSTGroupType[3]))
            {
            }
            column(OriginalInvNo_1; OriginalInvNo[1])
            {
            }
            column(OriginalInvDate_1; OriginalInvDate[1])
            {
            }
            column(GSTCompRate_10; GSTCompRate[10])
            {
            }
            column(GSTCompRate_11; GSTCompRate[11])
            {
            }
            column(GSTCompRate_12; GSTCompRate[12])
            {
            }
            column(GSTCompAmt_10; GSTCompAmt[10])
            {
            }
            column(GSTCompAmt_11; GSTCompAmt[11])
            {
            }
            column(GSTCompAmt_12; GSTCompAmt[12])
            {
            }
            column(ITCAmt_10; ITCAmt[10])
            {
            }
            column(ITCAmt_11; ITCAmt[11])
            {
            }
            column(ITCAmt_12; ITCAmt[12])
            {
            }
            column(BuyerSellerRegNo_3; BuyerSellerRegNo[3])
            {
            }
            column(DocumentType_2; DocumentType[2])
            {
            }
            column(DocumentNo_2; DocumentNo[2])
            {
            }
            column(PostingDate_3; FORMAT(PostingDate[3]))
            {
            }
            column(GSTBaseAmt_5; GSTBaseAmt[5])
            {
            }
            column(GSTGroupType_4; FORMAT(GSTGroupType[4]))
            {
            }
            column(OriginalInvNo_2; OriginalInvNo[2])
            {
            }
            column(OriginalInvDate_2; OriginalInvDate[2])
            {
            }
            column(GSTCompRate_13; GSTCompRate[13])
            {
            }
            column(GSTCompRate_14; GSTCompRate[14])
            {
            }
            column(GSTCompRate_15; GSTCompRate[15])
            {
            }
            column(GSTCompAmt_13; GSTCompAmt[13])
            {
            }
            column(GSTCompAmt_14; GSTCompAmt[14])
            {
            }
            column(GSTCompAmt_15; GSTCompAmt[15])
            {
            }
            column(ITCAmt_13; ITCAmt[13])
            {
            }
            column(ITCAmt_14; ITCAmt[14])
            {
            }
            column(ITCAmt_15; ITCAmt[15])
            {
            }
            column(BuyerSellerRegNo_4; BuyerSellerRegNo[4])
            {
            }
            column(DocumentNo_3; DocumentNo[3])
            {
            }
            column(PostingDate_4; FORMAT(PostingDate[4]))
            {
            }
            column(GSTBaseAmt_6; GSTBaseAmt[6])
            {
            }
            column(HSNSAC_4; HSNSAC[4])
            {
            }
            column(GoodsService_2; GoodsService[2])
            {
            }
            column(LocStateCode_1; LocStateCode[1])
            {
            }
            column(GSTCompRate_16; GSTCompRate[16])
            {
            }
            column(GSTCompRate_17; GSTCompRate[17])
            {
            }
            column(GSTCompRate_18; GSTCompRate[18])
            {
            }
            column(GSTCompAmt_16; GSTCompAmt[16])
            {
            }
            column(GSTCompAmt_17; GSTCompAmt[17])
            {
            }
            column(GSTCompAmt_18; GSTCompAmt[18])
            {
            }
            column(GSTBaseAmt_7; GSTBaseAmt[7])
            {
            }
            column(DocumentNo_4; DocumentNo[4])
            {
            }
            column(PostingDate_5; PostingDate[5])
            {
            }
            column(PaymentDocNo_1; PaymentDocNo[1])
            {
            }
            column(GSTCompRate_19; GSTCompRate[19])
            {
            }
            column(GSTCompRate_20; GSTCompRate[20])
            {
            }
            column(GSTCompRate_21; GSTCompRate[21])
            {
            }
            column(GSTCompAmt_19; GSTCompAmt[19])
            {
            }
            column(GSTCompAmt_20; GSTCompAmt[20])
            {
            }
            column(GSTCompAmt_21; GSTCompAmt[21])
            {
            }
            column(HSNSAC_5; HSNSAC[5])
            {
            }
            column(GSTBaseAmt_9; GSTBaseAmt[9])
            {
            }
            column(HSNSAC_6; HSNSAC[6])
            {
            }
            column(GSTBaseAmt_10; GSTBaseAmt[10])
            {
            }
            column(GSTBaseAmt_11; GSTBaseAmt[11])
            {
            }
            column(Description_1; Description[1])
            {
            }
            column(Description_2; Description[2])
            {
            }
            column(HSNSAC_8; HSNSAC[8])
            {
            }
            column(HSNSAC_9; HSNSAC[9])
            {
            }

            trigger OnAfterGetRecord()
            begin
                ClearData;
                GetRegisteredTaxablePerson(
                  "Detailed GST Ledger Entry", GSTCompRate[1], GSTCompRate[2], GSTCompRate[3], GSTCompAmt[1], GSTCompAmt[2],
                  GSTCompAmt[3], GSTComp[1], GSTComp[2], GSTComp[3]);
                GetUnRegisteredTaxablePerson(
                  "Detailed GST Ledger Entry", GSTCompRate[22], GSTCompRate[23], GSTCompRate[24], GSTCompAmt[22], GSTCompAmt[23],
                  GSTCompAmt[24], GSTComp[1], GSTComp[2], GSTComp[3]);
                GetGoodsAndCapitalGoods(
                  "Detailed GST Ledger Entry", GSTCompRate[5], GSTCompRate[5], GSTCompRate[6], GSTCompAmt[4],
                  GSTCompAmt[5], GSTCompAmt[6], GSTComp[1], GSTComp[2], GSTComp[3]);
                ServiceReceivedfromSupplier(
                  "Detailed GST Ledger Entry", GSTCompRate[7], GSTCompRate[8], GSTCompRate[9], GSTCompAmt[7],
                  GSTCompAmt[8], GSTCompAmt[9], GSTComp[1], GSTComp[2], GSTComp[3]);
                DetailsOfCreditAndDebitWithRevCharge(
                  "Detailed GST Ledger Entry", GSTCompRate[10], GSTCompRate[11], GSTCompRate[12], GSTCompAmt[10],
                  GSTCompAmt[11], GSTCompAmt[12], GSTComp[1], GSTComp[2], GSTComp[3]);
                DetailsOfCreditAndDebitWithoutRevCharge(
                  "Detailed GST Ledger Entry", GSTCompRate[13], GSTCompRate[14], GSTCompRate[15],
                  GSTCompAmt[13], GSTCompAmt[14], GSTCompAmt[15], GSTComp[1], GSTComp[2], GSTComp[3]);
                IF ("Entry Type" = "Entry Type"::"Initial Entry") AND
                   ("Document Type" = "Document Type"::Payment) AND "GST on Advance Payment"
                THEN BEGIN
                    BuyerSellerRegNo[4] := "Buyer/Seller Reg. No.";
                    AdvancePaymentAfterPosting(
                      "Detailed GST Ledger Entry", GSTCompRate[16], GSTCompRate[17], GSTCompRate[18],
                      GSTCompAmt[16], GSTCompAmt[17], GSTCompAmt[18], GSTComp[1], GSTComp[2], GSTComp[3]);
                END;
                IF ("Entry Type" = "Entry Type"::Application) AND
                   ("Document Type" = "Document Type"::Invoice) AND "Reverse Charge" AND Paid AND "GST on Advance Payment"
                THEN
                    AdvancePaymentBeforePosting(
                      "Detailed GST Ledger Entry", GSTCompRate[19], GSTCompRate[20], GSTCompRate[21],
                      GSTCompAmt[19], GSTCompAmt[20], GSTCompAmt[21], GSTComp[1], GSTComp[2], GSTComp[3]);
                SuppliesRecFromDiffRegVendors("Detailed GST Ledger Entry", GSTComp[1], GSTComp[2], GSTComp[3]);
                SuppliesRecFromDiffUnRegVendors("Detailed GST Ledger Entry", GSTComp[1], GSTComp[2], GSTComp[3]);
            end;

            trigger OnPreDataItem()
            begin
                GSTReturnsManagement.PostingDateFilter(
                  "Detailed GST Ledger Entry", Year, GSTINLocation, "Source Type"::Vendor, Period);
            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                group(Options)
                {
                    Caption = 'Options';
                    field(GSTINLocation; GSTINLocation)
                    {
                        Caption = 'GSTIN of the location';
                        TableRelation = "GST Registration Nos.".Code;

                        trigger OnValidate()
                        begin
                            Location.SETRANGE("GST Registration No.", GSTINLocation);
                            IF Location.FINDFIRST THEN
                                TaxablePerson := Location.Name
                        end;
                    }
                    field(TaxablePerson; TaxablePerson)
                    {
                        Caption = 'Name of the Taxable Person';
                        TableRelation = Location.Name;
                    }
                    field(AggregateTurnover; AggregateTurnOver)
                    {
                        Caption = 'Aggregate Turnover of the Taxable person in the previous financial year';
                    }
                    field(Period; Period)
                    {
                        Caption = 'Period';
                    }
                    field(PersonName; PersonName)
                    {
                        Caption = 'Name of the Authorized Person';
                    }
                    field(Place; Place)
                    {
                        Caption = 'Place';
                    }
                    field(Date; Date)
                    {
                        Caption = 'Date';

                        trigger OnValidate()
                        begin
                            Year := DATE2DMY(Date, 3);
                        end;
                    }
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

    var
        TitleLbl: Label 'Government of India/State';
        Title2Lbl: Label 'Department of';
        Title3Lbl: Label 'Form GSTR-2';
        Title4Lbl: Label '[See Rule…..]';
        HeadingLbl: Label 'DETAILS OF INWARD SUPPLIES/PURCHASES RECEIVED';
        GSTLbl: Label '1.  GSTIN:';
        PersonNameLbl: Label '2.  Name of the Taxable Person:';
        PersonSubLbl: Label ' (S. No. 1 and 2 will be auto-populated on logging)';
        PeriodLbl: Label 'Period:';
        TaxablePersonsHeadingLbl: Label '4. From  Registered Taxable Persons including supplies received from unregistered person in case of reverse charge';
        FiguresLbl: Label '(figures in Rs)';
        GSTINLbl: Label 'GSTIN/ Name of unregistered supplier';
        InvoiceLbl: Label 'Invoice';
        NoLbl: Label 'No.';
        DateLbl: Label 'Date';
        ValueLbl: Label 'Value';
        GoodSerLbl: Label 'Goods/Services';
        HSNSACLbl: Label 'HSN/SAC';
        TaxableLbl: Label 'Taxable Value';
        IGSTLbl: Label 'Igst';
        CGSTLbl: Label 'Cgst';
        SGSTLbl: Label 'Sgst';
        RateLbl: Label 'Rate';
        AmtLbl: Label 'Amt';
        POSLbl: Label 'POS(Only if different from the location of recipient)';
        EligibilityOfITCLbl: Label 'Eligibility of   ITC as inputs/capital goods/ input services/no ne';
        TotalTaxLbl: Label 'Total Tax available as ITC $';
        ITCAvailLbl: Label 'ITC available this month $';
        SuppliesAttractingLbl: Label 'Supplies attracting reverse charge (Others claimed by the receiver Taxable Person would include supplies received from unregistered Taxable person) ';
        NoteLbl: Label '  $       Taxable person will have to enter the amount of credit to be availed for CGST/SGST or IGST as the case may be';
        Note2Lbl: Label 'Note: If the supply is received in more than one lot, the invoice information should be reported in the return period in which the last lot is received and recorded in the books of accounts. ';
        AmmendmentsHeading1Lbl: Label '4A. Amendments to details of inward supplies received in earlier tax periods ';
        OriginalInvLbl: Label 'Original Invoice';
        RevDetLbl: Label 'Revised Details';
        GSTINSuppLbl: Label 'GSTIN of supplier';
        SuppliesAttractLbl: Label 'Other than supplies attracting reverse charge';
        SuppliesAttract2Lbl: Label 'Supplies attracting reverse charge (Others claimed by the receiver Taxable Person would include supplies received from unregistered Taxable person)';
        GoodsCapitalLbl: Label '5. Goods /Capital goods received from Overseas (Import of goods)';
        BillOfEntryLbl: Label 'Bill of entry/ Import report';
        EligibilityOfITC2Lbl: Label 'Eligibility of   ITC as inputs/capital';
        TotalIGSTLbl: Label 'Total IGST available as  ITC ';
        ITCAvail2Lbl: Label 'ITC available this month';
        AmmendmentsHeading2Lbl: Label '5A. Amendments in Goods /Capital goods received from Overseas (Import of goods) of earlier tax periods';
        OriginalBillLbl: Label 'Original Bill of Entry/ Import Report';
        RevisedDetLbl: Label 'Revised Details of Bill of entry/ Import Report';
        EligibilityOfITC3Lbl: Label 'Eligibility of ITC as inputs/capital goods/none ';
        ServiceReceivedHeadlingLbl: Label '6. Services received from a supplier located outside India (Import of services)';
        SACLbl: Label 'SAC';
        HSNLbl: Label 'HSN';
        ITCAdmissLbl: Label 'ITC Admissibility';
        TotITCAdmissLbl: Label 'Total ITC Admissible as input services/none';
        ITCAdmissMonthLbl: Label 'ITC Admissible this month';
        AmmendmentHeading3Lbl: Label '6A. Amendments in Services received from a supplier located outside India (Import of services) of earlier tax periods ';
        RevDetInvLbl: Label 'Revised details of Invoice';
        DetailsHeadingLbl: Label '7. Details of Credit/Debit Notes';
        GSTnLbl: Label 'GSTin';
        TypeofNoteLbl: Label 'Type of note (Debit /Credit)';
        DebitCreditNoteLbl: Label 'Debit Note/ credit note ';
        DiffValueLbl: Label 'Differe ntial Value  (Plus or Minus) ';
        DiffTaxLbl: Label 'Differential Tax';
        EligibilityTypeLbl: Label 'Eligibili ty for   ITC (select from drop down as in Table 5 above)';
        TotTaxLbl: Label 'Total Tax available as  ITC ';
        ITCAvailMonthLbl: Label 'ITC available this month';
        RevChargeLbl: Label 'Other than reverse charge';
        RevChrgLbl: Label 'Reverse charge';
        AmmendmentHeading4Lbl: Label '7A.   Amendment to Details of Credit/Debit Notes of earlier tax periods';
        OrgDebitCreditNoteLbl: Label 'Original Debit Note/ credit note';
        RevDetCreditDebitNoteLbl: Label 'Revised  Details of original Debit Note/ credit note ';
        SuppRecLbl: Label '8. Supplies received from composition taxable person/unregistered person & other exempt/nil/non GST supplies';
        DescriptionLbl: Label 'Description ';
        HSNSACCodeLbl: Label 'HSN Code/ SAC code';
        CompoundingLbl: Label 'Compounding Taxable person';
        UnregTaxLbl: Label 'Unregistered Taxable person not included in Table 4 above';
        ExemptLbl: Label 'Any exempt supply not included in Table 4 above';
        NilRateLbl: Label 'Any nil rated supply not included in Table 4  above ';
        NonGSTLbl: Label 'Non GST Supply ';
        ValueSuppLbl: Label 'Value of supplies received from ';
        ISDCreditHeadingLbl: Label '9.  ISD credit received ';
        GSTINISDLbl: Label 'GSTIN_ISD ';
        InvDocLbl: Label 'Invoice/Document details';
        ISDCreditLbl: Label 'ISD Credit ';
        TDSCreditRecHeadingLbl: Label '10(1) TDS Credit received';
        GSTINDetLbl: Label 'GSTIN of deductor';
        InvDoc2Lbl: Label 'Invoice/Document';
        PaymentLbl: Label 'Payment made to the deductee';
        TDSIGST_Lbl: Label 'tds_IGST';
        TDSCGST_Lbl: Label 'tds_CGST';
        TDSSGST_Lbl: Label 'tds_SGST';
        TCSCreditRevHeadingLbl: Label '10(2) TCS Credit received ';
        GSTINEcommerceLbl: Label 'GSTIN of Ecommerce portal ';
        MerchantLbl: Label 'Merchant ID allocated by e-commerce portal ';
        GrossValLbl: Label 'Gross Value of Supplies';
        TaxableValLbl: Label 'Taxable value on which TCS has been deducte';
        TCSIGST_Lbl: Label 'tcs_IGST';
        TCSCGST_Lbl: Label 'tcs_CGST';
        TCSSGST_Lbl: Label 'tcs_SGST';
        ITCRecHeadingLbl: Label '11. ITC Received on an invoice on which partial credit availed earlier';
        OrgInvDoc2Lbl: Label 'Original invoice/ doc.';
        ITCAvail3Lbl: Label 'ITC availed';
        EarlierLbl: Label 'Earlier ';
        ThisMonthLbl: Label 'This month';
        UnderRevChargeLbl: Label '12. Tax liability under Reverse Charge arising on account of time of Supply without receipt of Invoice ';
        GSTINNameOfUnregLbl: Label 'GSTIN/Name of unregistered supplier ';
        StateCodeLbl: Label 'State Code ';
        DocNoLbl: Label 'Document No.';
        DocDateLbl: Label 'Document Date ';
        HSNSACSuppLbl: Label 'HSN/SAC  of supply ';
        TAXLbl: Label 'TAX ';
        Note3Lbl: Label 'Note: A transaction id would be generated by system for each transaction on which tax is paid in advance/on account of time of supply';
        AmmendmentHeading5Lbl: Label '12A. Amendment in Tax liability under Reverse Charge arising on account of time of Supply without receipt of Invoice ';
        OrgDetLbl: Label 'Original Details ';
        GSTINCustNameLbl: Label 'GSTIN/ Name of customer ';
        RevDet3Lbl: Label 'Revised Details  ';
        HSNSuppMadLbl: Label 'HSN/S AC of supply  to be made ';
        TaxAlreadyPaidHeadingLbl: Label '13. Tax already paid under Reverse Charge in earlier tax periods on account of time of supply for which invoices issued in the current period  (';
        InvNoLbl: Label 'Invoice No.';
        InvDateLbl: Label 'Invoice Date';
        TransactionIDLbl: Label 'Transaction id (A number assigned by the system when tax was paid) ';
        TaxPaidTimeLbl: Label ' TAX Paid on Time of Supply ';
        Note4Lbl: Label 'Note: Tax liability in respect of invoices issued in this period shall be net of tax already paid on occurrence of time of supply ';
        ITCRevHeadingLbl: Label '14. ITC Reversal  ';
        SNoLbl: Label 'S.No';
        Description2Lbl: Label 'Description* ';
        ITCRevLbl: Label 'ITC Reversal ';
        Note5Lbl: Label '  *        A drop down will be provided to select the reason for reversal ';
        Note6Lbl: Label 'Note: Tax liability in respect of invoices issued in this period shall be net of tax already paid on occurrence of time of supply  ';
        Note7Lbl: Label 'Table shall include ITC reversal on account of exempt and non-business supplies ';
        AmmendmentHeading6Lbl: Label '14A. Amendment to ITC Reversal ';
        TaxPeriodLbl: Label 'Tax period ';
        Declare2Lbl: Label 'hereby declare that the information given in this statement is true, correct and complete in every respect.';
        Declare3Lbl: Label 'I further declare that I have the legal authority to submit this statement. ';
        PlaceLbl: Label 'Place:';
        Date2Lbl: Label 'Date:';
        SignatureLbl: Label '(Signature of Authorized Person) ';
        Note8Lbl: Label 'Note: ';
        Note9Lbl: Label '1. To be furnished by the 15th of the month succeeding the tax period ';
        Note10Lbl: Label '2. Not to be furnished by compounding Taxable Person /ISD ';
        Note11Lbl: Label '3. Auto-population would be done, on the basis of GSTR1 of counter-party supplier. ';
        Note12Lbl: Label '4. Further the other details that are not auto-populated, i.e. import of services, eligibility of ITC and quantum thereof and purchases from unregistered Taxable Person shall be furnished. ';
        Location: Record "14";
        GSTComponent: Record "16405";
        GSTReturnsManagement: Codeunit "16404";
        GSTINLocation: Code[15];
        GSTComp: array[5] of Code[10];
        InvoiceNo: array[50] of Code[35];
        HSNSAC: array[50] of Code[10];
        BuyerSellerRegNo: array[50] of Code[15];
        BillofEntryNo: Code[20];
        DocumentNo: array[50] of Code[20];
        PaymentDocNo: array[20] of Code[20];
        Pos: array[20] of Code[10];
        OriginalInvNo: array[20] of Code[20];
        LocStateCode: array[10] of Code[10];
        GSTCompRate: array[50] of Decimal;
        GSTCompAmt: array[50] of Decimal;
        ITCAmt: array[50] of Decimal;
        GSTBaseAmt: array[50] of Decimal;
        BillofEntryValue: Decimal;
        AggregateTurnOver: Integer;
        Year: Integer;
        i: Integer;
        TaxablePerson: Text;
        PersonName: Text;
        GoodsService: array[50] of Text;
        Place: Text;
        Description: array[2] of Text;
        Period: Option Jan,Feb,March,Apr,May,June,July,Agu,Sept,Oct,Nov,Dec;
        GSTGroupType: array[50] of Option Goods,Service;
        DocumentType: array[50] of Option;
        PostingDate: array[50] of Date;
        BillofEntryDate: Date;
        ReportViewErr: Label 'GST Component setup must have value in the Report View field.';
        InterTxt: Label 'Interstate Supplies';
        Date: Date;
        OriginalInvDate: array[20] of Date;
        IntraTxt: Label 'Intrastate Supplies';

    local procedure AssignGSTAmt(DetailedGSTLedgerEntry1: Record "16419"; var GSTCompRate1: Decimal; var GSTCompRate2: Decimal; var GSTCompRate3: Decimal; var GSTCompAmt1: Decimal; var GSTCompAmt2: Decimal; var GSTCompAmt3: Decimal; var GSTBaseAmt: Decimal; GSTComp1: Code[10]; GSTComp2: Code[10]; GSTComp3: Code[10])
    var
        DetailedGSTLedgerEntry: Record "16419";
        DetailedGSTLedgerEntry2: Record "16419";
    begin
        WITH DetailedGSTLedgerEntry DO BEGIN
            SETCURRENTKEY(
              "Document Type", "Document No.", "Document Line No.", "Nature of Supply", "GST Jurisdiction Type");
            SETRANGE("Document Type", DetailedGSTLedgerEntry1."Document Type");
            SETRANGE("Document No.", DetailedGSTLedgerEntry1."Document No.");
            SETRANGE("Nature of Supply", DetailedGSTLedgerEntry1."Nature of Supply");
            SETRANGE("GST Jurisdiction Type", DetailedGSTLedgerEntry1."GST Jurisdiction Type");
            SETRANGE("HSN/SAC Code", DetailedGSTLedgerEntry1."HSN/SAC Code");
            IF FINDSET THEN
                REPEAT
                    IF "GST Component Code" = GSTComp1 THEN BEGIN
                        GSTCompRate1 += "GST %";
                        GSTCompAmt1 += "GST Amount";
                    END;
                    IF "GST Component Code" = GSTComp2 THEN BEGIN
                        GSTCompRate2 += "GST %";
                        GSTCompAmt2 += "GST Amount";
                    END;
                    IF "GST Component Code" = GSTComp3 THEN BEGIN
                        GSTCompRate3 += "GST %";
                        GSTCompAmt3 += "GST Amount";
                    END;
                UNTIL NEXT = 0;
        END;
        WITH DetailedGSTLedgerEntry2 DO BEGIN
            SETRANGE("Document Type", DetailedGSTLedgerEntry1."Document Type");
            SETRANGE("Document No.", DetailedGSTLedgerEntry1."Document No.");
            SETRANGE("GST Component Code", DetailedGSTLedgerEntry1."GST Component Code");
            SETRANGE("No.", DetailedGSTLedgerEntry1."No.");
            IF FINDFIRST THEN
                IF "GST Jurisdiction Type" = "GST Jurisdiction Type"::Intrastate THEN
                    GSTBaseAmt += "GST Base Amount" / 2
                ELSE
                    GSTBaseAmt += "GST Base Amount";
        END;
    end;

    local procedure GetRegisteredTaxablePerson(DetailedGSTLedgerEntry: Record "16419"; var GSTCompRate1: Decimal; var GSTCompRate2: Decimal; var GSTCompRate3: Decimal; var GSTCompAmt1: Decimal; var GSTCompAmt2: Decimal; var GSTCompAmt3: Decimal; GSTComp1: Code[10]; GSTComp2: Code[10]; GSTComp3: Code[10])
    begin
        WITH DetailedGSTLedgerEntry DO
            IF "GST Vendor Type" = "GST Vendor Type"::Registered THEN BEGIN
                BuyerSellerRegNo[1] := "Buyer/Seller Reg. No.";
                InvoiceNo[1] := "External Document No.";
                GetGoodsAndService(DetailedGSTLedgerEntry, GoodsService[1]);
                HSNSAC[1] := "HSN/SAC Code";
                IF "GST Credit" = "GST Credit"::Availment THEN
                    GSTGroupType[1] := "GST Group Type";
                PostingDate[1] := "Posting Date";
                IF "Buyer/Seller State Code" <> "Shipping Address State Code" THEN
                    Pos[1] := "Shipping Address State Code";
                AssignGSTAmt(
                  DetailedGSTLedgerEntry, GSTCompRate1, GSTCompRate2, GSTCompRate3, GSTCompAmt1, GSTCompAmt2,
                  GSTCompAmt3, GSTBaseAmt[1], GSTComp1, GSTComp2, GSTComp3);
            END;
    end;

    local procedure GetUnRegisteredTaxablePerson(DetailedGSTLedgerEntry: Record "16419"; var GSTCompRate1: Decimal; var GSTCompRate2: Decimal; var GSTCompRate3: Decimal; var GSTCompAmt1: Decimal; var GSTCompAmt2: Decimal; var GSTCompAmt3: Decimal; GSTComp1: Code[10]; GSTComp2: Code[10]; GSTComp3: Code[10])
    begin
        WITH DetailedGSTLedgerEntry DO
            IF ("GST Vendor Type" = "GST Vendor Type"::Unregistered) AND "Reverse Charge" THEN BEGIN
                BuyerSellerRegNo[7] := "Buyer/Seller Reg. No.";
                InvoiceNo[7] := "Document No.";
                GetGoodsAndService(DetailedGSTLedgerEntry, GoodsService[7]);
                HSNSAC[7] := "HSN/SAC Code";
                IF "GST Credit" = "GST Credit"::Availment THEN
                    GSTGroupType[7] := "GST Group Type";
                PostingDate[7] := "Posting Date";
                IF "Buyer/Seller State Code" <> "Shipping Address State Code" THEN
                    Pos[7] := "Shipping Address State Code";
                AssignGSTAmt(
                  DetailedGSTLedgerEntry, GSTCompRate1, GSTCompRate2, GSTCompRate3, GSTCompAmt1, GSTCompAmt2,
                  GSTCompAmt3, GSTBaseAmt[8], GSTComp1, GSTComp2, GSTComp3);
            END;
    end;

    local procedure GetGoodsAndService(var DetailedGSTLedgerEntry: Record "16419"; var GoodService: Text)
    var
        Item: Record "27";
        GLAccount: Record "15";
        FixedAsset: Record "5600";
        Resource: Record "156";
    begin
        IF DetailedGSTLedgerEntry.Type = DetailedGSTLedgerEntry.Type::Item THEN BEGIN
            Item.GET(DetailedGSTLedgerEntry."No.");
            GoodService := Item.Description;
        END;
        IF DetailedGSTLedgerEntry.Type = DetailedGSTLedgerEntry.Type::"G/L Account" THEN BEGIN
            GLAccount.GET(DetailedGSTLedgerEntry."No.");
            GoodService := GLAccount.Name;
        END;
        IF DetailedGSTLedgerEntry.Type = DetailedGSTLedgerEntry.Type::"Fixed Asset" THEN BEGIN
            FixedAsset.GET(DetailedGSTLedgerEntry."No.");
            GoodService := FixedAsset.Description;
        END;
        IF DetailedGSTLedgerEntry.Type = DetailedGSTLedgerEntry.Type::Resource THEN BEGIN
            Resource.GET(DetailedGSTLedgerEntry."No.");
            GoodService := Resource.Name;
        END;
    end;

    local procedure GetGoodsAndCapitalGoods(DetailedGSTLedgerEntry: Record "16419"; var GSTCompRate1: Decimal; var GSTCompRate2: Decimal; var GSTCompRate3: Decimal; var GSTCompAmt1: Decimal; var GSTCompAmt2: Decimal; var GSTCompAmt3: Decimal; GSTComp1: Code[10]; GSTComp2: Code[10]; GSTComp3: Code[10])
    var
        PurchaseHeader: Record "38";
    begin
        WITH DetailedGSTLedgerEntry DO
            IF ("GST Jurisdiction Type" = "GST Jurisdiction Type"::Interstate) AND
               ("GST Vendor Type" <> "GST Vendor Type"::Import) AND ("GST Group Type" = "GST Group Type"::Goods)
            THEN BEGIN
                IF PurchaseHeader.GET("Document Type", "Document No.") THEN BEGIN
                    BillofEntryNo := PurchaseHeader."Bill of Entry No.";
                    BillofEntryDate := PurchaseHeader."Bill of Entry Date";
                    BillofEntryValue := PurchaseHeader."Bill of Entry Value";
                END;
                HSNSAC[2] := "HSN/SAC Code";
                GSTGroupType[2] := "GST Group Type";
                AssignGSTAmt(
                  DetailedGSTLedgerEntry, GSTCompRate1, GSTCompRate2, GSTCompRate3, GSTCompAmt1,
                  GSTCompAmt2, GSTCompAmt3, GSTBaseAmt[2], GSTComp1, GSTComp2, GSTComp3);
            END;
    end;

    local procedure ServiceReceivedfromSupplier(DetailedGSTLedgerEntry: Record "16419"; var GSTCompRate1: Decimal; var GSTCompRate2: Decimal; var GSTCompRate3: Decimal; var GSTCompAmt1: Decimal; var GSTCompAmt2: Decimal; var GSTCompAmt3: Decimal; GSTComp1: Code[10]; GSTComp2: Code[10]; GSTComp3: Code[10])
    begin
        WITH DetailedGSTLedgerEntry DO
            IF ("GST Vendor Type" = "GST Vendor Type"::Import) AND
               ("GST Group Type" = "GST Group Type"::Service)
            THEN BEGIN
                InvoiceNo[2] := "External Document No.";
                PostingDate[8] := "Posting Date";
                HSNSAC[3] := "HSN/SAC Code";
                AssignGSTAmt(
                  DetailedGSTLedgerEntry, GSTCompRate1, GSTCompRate2, GSTCompRate3,
                  GSTCompAmt1, GSTCompAmt2, GSTCompAmt3, GSTBaseAmt[3], GSTComp1, GSTComp2, GSTComp3);
            END;
    end;

    local procedure DetailsOfCreditAndDebitWithRevCharge(DetailedGSTLedgerEntry: Record "16419"; var GSTCompRate1: Decimal; var GSTCompRate2: Decimal; var GSTCompRate3: Decimal; var GSTCompAmt1: Decimal; var GSTCompAmt2: Decimal; var GSTCompAmt3: Decimal; GSTComp1: Code[10]; GSTComp2: Code[10]; GSTComp3: Code[10])
    begin
        WITH DetailedGSTLedgerEntry DO
            IF ("GST Vendor Type" = "GST Vendor Type"::Registered) AND
               ("Sales Invoice Type" IN ["Sales Invoice Type"::Supplementary, "Sales Invoice Type"::"Debit Note"]) AND
               NOT "Reverse Charge"
            THEN BEGIN
                BuyerSellerRegNo[2] := "Buyer/Seller Reg. No.";
                DocumentType[1] := "Document Type";
                DocumentNo[1] := "Document No.";
                PostingDate[2] := "Posting Date";
                GSTGroupType[3] := "GST Group Type";
                OriginalInvNo[1] := "Original Invoice No.";
                OriginalInvDate[1] := "Original Invoice Date";
                HSNSAC[8] := "HSN/SAC Code";
                AssignGSTAmt(
                  DetailedGSTLedgerEntry, GSTCompRate1, GSTCompRate2, GSTCompRate3,
                  GSTCompAmt1, GSTCompAmt2, GSTCompAmt3, GSTBaseAmt[4], GSTComp1, GSTComp2, GSTComp3);
            END;
    end;

    local procedure DetailsOfCreditAndDebitWithoutRevCharge(DetailedGSTLedgerEntry: Record "16419"; var GSTCompRate1: Decimal; var GSTCompRate2: Decimal; var GSTCompRate3: Decimal; var GSTCompAmt1: Decimal; var GSTCompAmt2: Decimal; var GSTCompAmt3: Decimal; GSTComp1: Code[10]; GSTComp2: Code[10]; GSTComp3: Code[10])
    begin
        WITH DetailedGSTLedgerEntry DO
            IF ("GST Vendor Type" = "GST Vendor Type"::Unregistered) AND
               ("Sales Invoice Type" IN ["Sales Invoice Type"::Supplementary, "Sales Invoice Type"::"Debit Note"]) AND
               "Reverse Charge"
            THEN BEGIN
                BuyerSellerRegNo[3] := "Buyer/Seller Reg. No.";
                DocumentType[2] := "Document Type";
                DocumentNo[2] := "Document No.";
                PostingDate[3] := "Posting Date";
                GSTGroupType[4] := "GST Group Type";
                OriginalInvNo[2] := "Original Invoice No.";
                OriginalInvDate[2] := "Original Invoice Date";
                HSNSAC[9] := "HSN/SAC Code";
                AssignGSTAmt(
                  DetailedGSTLedgerEntry, GSTCompRate1, GSTCompRate2, GSTCompRate3,
                  GSTCompAmt1, GSTCompAmt2, GSTCompAmt3, GSTBaseAmt[5], GSTComp1, GSTComp2, GSTComp3);
            END;
    end;

    local procedure AdvancePaymentAfterPosting(var DetailedGSTLedgerEntry: Record "16419"; var GSTCompRate1: Decimal; var GSTCompRate2: Decimal; var GSTCompRate3: Decimal; var GSTCompAmt1: Decimal; var GSTCompAmt2: Decimal; var GSTCompAmt3: Decimal; GSTComp1: Code[10]; GSTComp2: Code[10]; GSTComp3: Code[10])
    begin
        WITH DetailedGSTLedgerEntry DO BEGIN
            DocumentNo[3] := "Document No.";
            PostingDate[4] := "Posting Date";
            HSNSAC[4] := "HSN/SAC Code";
            LocStateCode[1] := "Location State Code";
            AssignGSTAmt(
              DetailedGSTLedgerEntry, GSTCompRate1, GSTCompRate2, GSTCompRate3,
              GSTCompAmt1, GSTCompAmt2, GSTCompAmt3, GSTBaseAmt[6], GSTComp1, GSTComp2, GSTComp3);
            GetGoodsAndService(DetailedGSTLedgerEntry, GoodsService[2]);
        END;
    end;

    local procedure AdvancePaymentBeforePosting(var DetailedGSTLedgerEntry: Record "16419"; var GSTCompRate1: Decimal; var GSTCompRate2: Decimal; var GSTCompRate3: Decimal; var GSTCompAmt1: Decimal; var GSTCompAmt2: Decimal; var GSTCompAmt3: Decimal; GSTComp1: Code[10]; GSTComp2: Code[10]; GSTComp3: Code[10])
    begin
        WITH DetailedGSTLedgerEntry DO BEGIN
            DocumentNo[4] := "Document No.";
            PostingDate[5] := "Posting Date";
            PaymentDocNo[1] := "Payment Document No.";
            AssignGSTAmt(
              DetailedGSTLedgerEntry, GSTCompRate1, GSTCompRate2, GSTCompRate3,
              GSTCompAmt1, GSTCompAmt2, GSTCompAmt3, GSTBaseAmt[7], GSTComp1, GSTComp2, GSTComp3);
        END;
    end;

    local procedure SuppliesRecFromDiffRegVendors(var DetailedGSTLedgerEntry: Record "16419"; GSTComp1: Code[10]; GSTComp2: Code[10]; GSTComp3: Code[10])
    var
        DummyAmt: Decimal;
    begin
        WITH DetailedGSTLedgerEntry DO BEGIN
            Description[1] := InterTxt;
            HSNSAC[5] := "HSN/SAC Code";
            IF "Sales Invoice Type" = "Sales Invoice Type"::"Non-GST" THEN
                AssignGSTAmt(
                  DetailedGSTLedgerEntry, DummyAmt, DummyAmt, DummyAmt,
                  DummyAmt, DummyAmt, DummyAmt, GSTBaseAmt[9], GSTComp1, GSTComp2, GSTComp3);
        END;
    end;

    local procedure SuppliesRecFromDiffUnRegVendors(var DetailedGSTLedgerEntry: Record "16419"; GSTComp1: Code[10]; GSTComp2: Code[10]; GSTComp3: Code[10])
    var
        DummyAmt: Decimal;
    begin
        WITH DetailedGSTLedgerEntry DO BEGIN
            Description[2] := IntraTxt;
            HSNSAC[6] := "HSN/SAC Code";
            IF "Sales Invoice Type" = "Sales Invoice Type"::"Non-GST" THEN
                AssignGSTAmt(
                  DetailedGSTLedgerEntry, DummyAmt, DummyAmt, DummyAmt,
                  DummyAmt, DummyAmt, DummyAmt, GSTBaseAmt[10], GSTComp1, GSTComp2, GSTComp3);
            IF "GST Vendor Type" = "GST Vendor Type"::Composite THEN
                AssignGSTAmt(
                  DetailedGSTLedgerEntry, DummyAmt, DummyAmt, DummyAmt,
                  DummyAmt, DummyAmt, DummyAmt, GSTBaseAmt[11], GSTComp1, GSTComp2, GSTComp3);
        END;
    end;

    local procedure ClearData()
    begin
        FOR i := 1 TO 25 DO BEGIN
            GSTCompRate[i] := 0;
            GSTCompAmt[i] := 0;
            ITCAmt[i] := 0;
            GSTBaseAmt[i] := 0;
        END;
    end;
}

