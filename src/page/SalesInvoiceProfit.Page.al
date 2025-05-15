page 50010 "Sales Invoice Profit"
{
    Caption = 'Sales Invoice Statistics';
    Editable = false;
    LinksAllowed = false;
    PageType = Worksheet;
    SourceTable = Table112;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                Caption = 'General';
                field("No."; "No.")
                {
                }
                field("Sell-to Customer No."; "Sell-to Customer No.")
                {
                }
                field("Bill-to Name"; "Bill-to Name")
                {
                }
                field(TotalAdjCostLCY; TotalAdjCostLCY)
                {
                    Caption = 'Original Cost (LCY)';
                }
                field(AmountLCY; AmountLCY)
                {
                    AutoFormatType = 1;
                    Caption = 'Sales (LCY)';
                }
                field(AdjProfitLCY; AdjProfitLCY)
                {
                    Caption = 'Profit LCY';
                }
                field(AdjProfitPct; AdjProfitPct)
                {
                    Caption = 'Profit %';
                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetRecord()
    var
        CostCalcMgt: Codeunit "5836";
        CustLedgEntry: Record "21";
        ServiceTaxEntry: Record "16473";
    begin
        CLEARALL;

        IF "Currency Code" = '' THEN
            currency.InitRoundingPrecision
        ELSE
            currency.GET("Currency Code");

        SalesInvLine.SETRANGE("Document No.", "No.");
        IF SalesInvLine.FIND('-') THEN
            REPEAT
                CustAmount := CustAmount + SalesInvLine.Amount;
                ExciseAmount := ExciseAmount + SalesInvLine."Excise Amount";
                TaxAmount := TaxAmount + SalesInvLine."Tax Amount";
                // VATAmt := VATAmt + SalesInvLine."VAT Amount";
                ServiceTaxAmount := ServiceTaxAmount + SalesInvLine."Service Tax Amount";
                ServiceTaxSBCAmount := ServiceTaxSBCAmount + SalesInvLine."Service Tax SBC Amount";
                ServiceTaxeCessAmount := ServiceTaxeCessAmount + SalesInvLine."Service Tax eCess Amount";
                ServiceTaxSHECessAmount := ServiceTaxSHECessAmount + SalesInvLine."Service Tax SHE Cess Amount";
                KKCessAmount := KKCessAmount + SalesInvLine."KK Cess Amount";
                ChargeAmount := ChargeAmount + SalesInvLine."Charges To Customer";
                NetTotal := NetTotal + SalesInvLine."Amount To Customer";
                GSTAmount := GSTAmount + SalesInvLine."Total GST Amount";
                // AmountInclVAT := AmountInclVAT + SalesInvLine."Amount Including VAT";
                AmountInclVAT := CustAmount;
                IF "Prices Including VAT" THEN
                    InvDiscAmount := InvDiscAmount + SalesInvLine."Inv. Discount Amount" / (1 + SalesInvLine."VAT %" / 100)
                ELSE
                    InvDiscAmount := InvDiscAmount + SalesInvLine."Inv. Discount Amount";
                CostLCY := CostLCY + (SalesInvLine.Quantity * SalesInvLine."Unit Cost (LCY)");
                LineQty := LineQty + SalesInvLine.Quantity;
                TotalNetWeight := TotalNetWeight + (SalesInvLine.Quantity * SalesInvLine."Net Weight");
                TotalGrossWeight := TotalGrossWeight + (SalesInvLine.Quantity * SalesInvLine."Gross Weight");
                TotalVolume := TotalVolume + (SalesInvLine.Quantity * SalesInvLine."Unit Volume");
                IF SalesInvLine."Units per Parcel" > 0 THEN
                    TotalParcels := TotalParcels + ROUND(SalesInvLine.Quantity / SalesInvLine."Units per Parcel", 1, '>');
                IF SalesInvLine."VAT %" <> VATPercentage THEN
                    IF VATPercentage = 0 THEN
                        VATPercentage := SalesInvLine."VAT %"
                    ELSE
                        VATPercentage := -1;
                TCSAmount += SalesInvLine."Total TDS/TCS Incl. SHE CESS";
                TotalAdjCostLCY := TotalAdjCostLCY + CostCalcMgt.CalcSalesInvLineCostLCY(SalesInvLine);
            UNTIL SalesInvLine.NEXT = 0;
        VATAmount := AmountInclVAT - CustAmount;
        InvDiscAmount := ROUND(InvDiscAmount, currency."Amount Rounding Precision");

        IF VATPercentage <= 0 THEN
            VATAmountText := Text000
        ELSE
            VATAmountText := STRSUBSTNO(Text001, VATPercentage);

        IF "Currency Code" = '' THEN
            AmountLCY := CustAmount
        ELSE
            AmountLCY :=
              CurrExchRate.ExchangeAmtFCYToLCY(
                WORKDATE, "Currency Code", CustAmount, "Currency Factor");

        CustLedgEntry.SETCURRENTKEY("Document No.");
        CustLedgEntry.SETRANGE("Document No.", "No.");
        CustLedgEntry.SETRANGE("Document Type", CustLedgEntry."Document Type"::Invoice);
        CustLedgEntry.SETRANGE("Customer No.", "Bill-to Customer No.");
        IF CustLedgEntry.FINDFIRST THEN
            AmountLCY := CustLedgEntry."Sales (LCY)";

        ProfitLCY := AmountLCY - CostLCY;
        IF AmountLCY <> 0 THEN
            ProfitPct := ROUND(100 * ProfitLCY / AmountLCY, 0.1);

        AdjProfitLCY := AmountLCY - TotalAdjCostLCY;
        IF AmountLCY <> 0 THEN
            AdjProfitPct := ROUND(100 * AdjProfitLCY / AmountLCY, 0.1);

        IF Cust.GET("Bill-to Customer No.") THEN
            Cust.CALCFIELDS("Balance (LCY)")
        ELSE
            CLEAR(Cust);

        CASE TRUE OF
            Cust."Credit Limit (LCY)" = 0:
                CreditLimitLCYExpendedPct := 0;
            Cust."Balance (LCY)" / Cust."Credit Limit (LCY)" < 0:
                CreditLimitLCYExpendedPct := 0;
            Cust."Balance (LCY)" / Cust."Credit Limit (LCY)" > 1:
                CreditLimitLCYExpendedPct := 10000;
            ELSE
                CreditLimitLCYExpendedPct := ROUND(Cust."Balance (LCY)" / Cust."Credit Limit (LCY)" * 10000, 1);
        END;

        SalesInvLine.CalcVATAmountLines(Rec, TempVATAmountLine);
        // CurrForm.Subform.PAGE.SetTempVATAmountLine(TempVATAmountLine);
        // CurrForm.Subform.PAGE.InitGlobals("Currency Code",FALSE,FALSE,FALSE,FALSE,"VAT Base Discount %");

        IF "Transaction No. Serv. Tax" <> 0 THEN BEGIN
            ServiceTaxAmount2 := ServiceTaxAmount;
            ServiceTaxeCessAmount2 := ServiceTaxeCessAmount;
            ServiceTaxSHECessAmount2 := ServiceTaxSHECessAmount;
            ServiceTaxSBCAmount2 := ServiceTaxSBCAmount;
            KKCessAmount2 := KKCessAmount;
            ServiceTaxEntry.RESET;
            ServiceTaxEntry.SETRANGE(Type, ServiceTaxEntry.Type::Sale);
            ServiceTaxEntry.SETRANGE("Document Type", ServiceTaxEntry."Document Type"::Invoice);
            ServiceTaxEntry.SETRANGE("Document No.", "No.");
            IF ServiceTaxEntry.FINDFIRST THEN BEGIN

                IF "Currency Code" <> '' THEN BEGIN
                    ServiceTaxEntry."Service Tax Amount" :=
                      ROUND(CurrExchRate.ExchangeAmtLCYToFCY(
                          "Posting Date", "Currency Code",
                          ServiceTaxEntry."Service Tax Amount", "Currency Factor"));
                    ServiceTaxEntry."eCess Amount" :=
                      ROUND(CurrExchRate.ExchangeAmtLCYToFCY(
                          "Posting Date", "Currency Code",
                          ServiceTaxEntry."eCess Amount", "Currency Factor"));
                    ServiceTaxEntry."SHE Cess Amount" :=
                      ROUND(CurrExchRate.ExchangeAmtLCYToFCY(
                          "Posting Date", "Currency Code",
                          ServiceTaxEntry."SHE Cess Amount", "Currency Factor"));
                    ServiceTaxEntry."Service Tax SBC Amount" :=
                      ROUND(CurrExchRate.ExchangeAmtLCYToFCY(
                          "Posting Date", "Currency Code",
                          ServiceTaxEntry."Service Tax SBC Amount", "Currency Factor"));
                    ServiceTaxEntry."KK Cess Amount" :=
                      ROUND(CurrExchRate.ExchangeAmtLCYToFCY(
                          "Posting Date", "Currency Code",
                          ServiceTaxEntry."KK Cess Amount", "Currency Factor"));

                END;

                ServiceTaxAmount := ABS(ServiceTaxEntry."Service Tax Amount");
                ServiceTaxSBCAmount := ABS(ServiceTaxEntry."Service Tax SBC Amount");
                ServiceTaxeCessAmount := ABS(ServiceTaxEntry."eCess Amount");
                ServiceTaxSHECessAmount := ABS(ServiceTaxEntry."SHE Cess Amount");
                KKCessAmount := ABS(ServiceTaxEntry."KK Cess Amount");
                NetTotal := NetTotal - ServiceTaxAmount2 - ServiceTaxSBCAmount2 - ServiceTaxeCessAmount2 -
                  KKCessAmount2 - ServiceTaxSHECessAmount2 +
                  ServiceTaxAmount + ServiceTaxSBCAmount + ServiceTaxeCessAmount + ServiceTaxSHECessAmount + KKCessAmount;
            END ELSE BEGIN
                ServiceTaxAmount := ServiceTaxAmount - ServiceTaxAmount2;
                ServiceTaxSBCAmount := ServiceTaxSBCAmount - ServiceTaxSBCAmount2;
                ServiceTaxeCessAmount := ServiceTaxeCessAmount - ServiceTaxeCessAmount2;
                ServiceTaxSHECessAmount := ServiceTaxSHECessAmount - ServiceTaxSHECessAmount2;
                KKCessAmount := KKCessAmount - KKCessAmount2;
                NetTotal := NetTotal - ServiceTaxAmount2 - ServiceTaxeCessAmount2 - ServiceTaxSHECessAmount2 -
                  ServiceTaxSBCAmount2 - KKCessAmount2;
            END;
        END;

        // NetTotal := NetTotal + VATAmount;

        VATAmount := 0;
    end;

    var
        Text000: Label 'VAT Amount';
        Text001: Label '%1% VAT';
        CurrExchRate: Record "330";
        SalesInvLine: Record "113";
        Cust: Record "18";
        TempVATAmountLine: Record "290" temporary;
        currency: Record "4";
        TotalAdjCostLCY: Decimal;
        CustAmount: Decimal;
        AmountInclVAT: Decimal;
        InvDiscAmount: Decimal;
        VATAmount: Decimal;
        CostLCY: Decimal;
        ProfitLCY: Decimal;
        ProfitPct: Decimal;
        AdjProfitLCY: Decimal;
        AdjProfitPct: Decimal;
        LineQty: Decimal;
        TotalNetWeight: Decimal;
        TotalGrossWeight: Decimal;
        TotalVolume: Decimal;
        TotalParcels: Decimal;
        AmountLCY: Decimal;
        CreditLimitLCYExpendedPct: Decimal;
        VATPercentage: Decimal;
        VATAmountText: Text[30];
        ExciseAmount: Decimal;
        TaxAmount: Decimal;
        NetTotal: Decimal;
        ChargeAmount: Decimal;
        ServiceTaxAmount: Decimal;
        ServiceTaxeCessAmount: Decimal;
        TCSAmount: Decimal;
        ServiceTaxAmount2: Decimal;
        ServiceTaxeCessAmount2: Decimal;
        ServiceTaxSHECessAmount: Decimal;
        ServiceTaxSHECessAmount2: Decimal;
        ServiceTaxSBCAmount: Decimal;
        ServiceTaxSBCAmount2: Decimal;
        KKCessAmount: Decimal;
        KKCessAmount2: Decimal;
        GSTAmount: Decimal;
}

