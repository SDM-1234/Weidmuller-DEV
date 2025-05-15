report 50024 "Customer-wise Dunning"
{
    DefaultLayout = RDLC;
    RDLCLayout = './CustomerwiseDunning.rdlc';
    PreviewMode = PrintLayout;

    dataset
    {
        dataitem(DataItem1000000001; Table18)
        {
            column(Name_Customer; Customer.Name)
            {
            }
            column(Address_Customer; Customer.Address)
            {
            }
            column(Address2_Customer; Customer."Address 2")
            {
            }
            column(City_Customer; Customer.City)
            {
            }
            column(PaymentTermsCode_Customer; Customer."Payment Terms Code")
            {
            }
            column(PostCode_Customer; Customer."Post Code")
            {
            }
            column(Txt00001; Txt00001)
            {
            }
            column(Txt00002; Txt00002)
            {
            }
            column(Txt00003; Txt00003)
            {
            }
            column(Txt00004; Txt00004)
            {
            }
            column(Txt00005; Txt00005)
            {
            }
            column(Txt00006; Txt00006)
            {
            }
            column(PayTermsDesc; PayTermsDesc)
            {
            }
            column(TDate; TODAY)
            {
            }
            column(Balance; Balance)
            {
            }
            dataitem(DataItem1000000000; Table21)
            {
                DataItemLink = Customer No.=FIELD(No.);
                DataItemTableView = WHERE (Open = CONST (Yes),
                                          Remaining Amount=FILTER(>10|<-10));
                column(Picture_CompanyInfo;CompanyInfo.Picture)
                {
                }
                column(CustomerNo_CustLedgerEntry;"Cust. Ledger Entry"."Customer No.")
                {
                }
                column(PostingDate_CustLedgerEntry;"Cust. Ledger Entry"."Posting Date")
                {
                }
                column(DocumentNo_CustLedgerEntry;"Cust. Ledger Entry"."Document No.")
                {
                }
                column(Description_CustLedgerEntry;"Cust. Ledger Entry".Description)
                {
                }
                column(RemainingAmount_CustLedgerEntry;"Cust. Ledger Entry"."Remaining Amount")
                {
                }
                column(DueDate_CustLedgerEntry;"Cust. Ledger Entry"."Due Date")
                {
                }
                column(CurrencyCode_CustLedgerEntry;"Cust. Ledger Entry"."Currency Code")
                {
                }
                column(Arrears;Arrears)
                {
                }
                column(Dunning;Dunning)
                {
                }
                column(TINNO_CompanyInfo;CompanyInfo."T.I.N. No.")
                {
                }
                column(CSTNO_CompanyInfo;CompanyInfo."C.S.T No.")
                {
                }
                column(Name_CompanyInfo;CompanyInfo.Name)
                {
                }
                column(Name2_CompanyInfo;CompanyInfo."Name 2")
                {
                }
                column(Address_CompanyInfo;CompanyInfo.Address)
                {
                }
                column(Address2_CompanyInfo;CompanyInfo."Address 2")
                {
                }
                column(City_CompanyInfo;CompanyInfo.City)
                {
                }
                column(PhoneNo_CompanyInfo;CompanyInfo."Phone No.")
                {
                }
                column(HomePage_CompanyInfo;CompanyInfo."Home Page")
                {
                }
                column(PhoneNo2_CompanyInfo;CompanyInfo."Phone No. 2")
                {
                }
                column(HomePage2_CompanyInfo;CompanyInfo."Home Page 2")
                {
                }
                column(CIN_CompanyInfo;CompanyInfo.CIN)
                {
                }
                column(Country_CompanyInfo;CompanyInfo.County)
                {
                }
                column(PostCode_CompanyInfo;CompanyInfo."Post Code")
                {
                }
                column(OriginalAmount_CustLedgerEntry;"Cust. Ledger Entry"."Original Amount")
                {
                }
                column(DunReminder;DunReminder)
                {
                }

                trigger OnAfterGetRecord()
                begin
                    Arrears:=TODAY-"Cust. Ledger Entry"."Due Date";
                    IF (Arrears>=1) AND (Arrears<8) THEN
                      Dunning:=Dunning::"Dunning 1"
                    ELSE IF (Arrears>=8) AND (Arrears<16) THEN
                      Dunning:=Dunning::"Dunning 2"
                    ELSE IF (Arrears>=16) AND (Arrears<31) THEN
                      Dunning:=Dunning::"Dunning 3"
                    ELSE IF  Arrears>=31 THEN BEGIN
                      Dunning:=Dunning::"Dunning 4";
                      DunReminder:=TRUE;
                    END ELSE
                      Dunning:=Dunning::"Dunning 0";
                end;

                trigger OnPreDataItem()
                begin
                    CLEAR(Arrears);
                    "Cust. Ledger Entry".SETFILTER("Cust. Ledger Entry"."Due Date",'<%1',TODAY);//ZE.RSF.1095
                end;
            }

            trigger OnAfterGetRecord()
            begin
                //++ 15.06.2020
                Customer.CALCFIELDS(Balance);
                Balance:= Customer.Balance;
                //--
                DunReminder:=FALSE;
                PayTerms.RESET;
                PayTerms.SETFILTER(PayTerms.Code,Customer."Payment Terms Code");
                IF PayTerms.FINDFIRST THEN
                  PayTermsDesc := PayTerms.Description;
            end;

            trigger OnPreDataItem()
            begin
                IF STRLEN(Customer.GETFILTER("No."))<3 THEN BEGIN
                  ERROR('Customer filter is not applied');
                  CurrReport.SKIP;
                END;
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
        //TDate := TODAY;
    end;

    var
        Txt00001: Label 'Statement of overdue outstanding as on';
        Txt00002: Label 'Please release the payments as per the below open items at the earliest.';
        Txt00003: Label 'Dear Sir / Madam,';
        Txt00004: Label 'Please remit your payment of';
        Txt00005: Label 'as soon as possible.';
        Txt00006: Label 'Terms:';
        CompanyInfo: Record "79";
        Arrears: Integer;
        Dunning: Option "Dunning 0","Dunning 1","Dunning 2","Dunning 3","Dunning 4";
        PayTerms: Record "3";
        PayTermsDesc: Text[200];
        TDate: Date;
        DunReminder: Boolean;
        Balance: Decimal;
}

