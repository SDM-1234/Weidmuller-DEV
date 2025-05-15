page 50015 "Open Sales Quote Lines"
{
    // Project: Weidmuller
    // ********************************************************************************************************************************
    // Developer: SourceEdge
    // ********************************************************************************************************************************
    // -+--------+---------+--------+---------+----+--------------------------------------
    // T|ID_RIC  |MOD  REL |DATE    |SEARCH   |Developer|DESCRIPTION
    // -+--------+---------+--------+---------+----+--------------------------------------
    // ?|ZE_LIJO |         |26.06.19|         |Lijo     | Flowfield for Nippon and Quarantine stock

    PageType = List;
    SourceTable = Table37;
    SourceTableView = WHERE (Document Type=FILTER(Quote));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document Type";"Document Type")
                {
                }
                field("Sell-to Customer No.";"Sell-to Customer No.")
                {
                }
                field("Document No.";"Document No.")
                {
                }
                field("Line No.";"Line No.")
                {
                }
                field(Type;Type)
                {
                }
                field("No.";"No.")
                {
                }
                field(Inventory;InventoryStock)
                {
                    DecimalPlaces = 0:5;
                    Editable = false;
                }
                field("Inventory-FG";InventoryNippon)
                {
                    DecimalPlaces = 0:5;
                    Editable = false;
                }
                field("Inventory-Quarantine";InventoryQuarantine)
                {
                    DecimalPlaces = 0:5;
                    Editable = false;
                }
                field("Location Code";"Location Code")
                {
                }
                field("Posting Group";"Posting Group")
                {
                }
                field("Shipment Date";"Shipment Date")
                {
                }
                field(Description;Description)
                {
                }
                field("Description 2";"Description 2")
                {
                }
                field("Unit of Measure";"Unit of Measure")
                {
                }
                field(Quantity;Quantity)
                {
                }
                field("Item Availability";SalesInfoPaneMgt.CalcAvailability(Rec))
                {
                    Caption = 'Item Availability';
                    DecimalPlaces = 2:0;
                    DrillDown = true;

                    trigger OnDrillDown()
                    begin
                        ItemAvailFormsMgt.ShowItemAvailFromSalesLine(Rec,ItemAvailFormsMgt.ByEvent);
                        CurrPage.UPDATE(TRUE);
                    end;
                }
                field("Customer Name";"Customer Name")
                {
                }
                field("Outstanding Quantity";"Outstanding Quantity")
                {
                }
                field("Qty. to Invoice";"Qty. to Invoice")
                {
                }
                field("Qty. to Ship";"Qty. to Ship")
                {
                }
                field("Unit Price";"Unit Price")
                {
                }
                field("Unit Cost (LCY)";"Unit Cost (LCY)")
                {
                }
                field("PO No.";"PO No.")
                {
                }
                field("VAT %";"VAT %")
                {
                }
                field("Line Discount %";"Line Discount %")
                {
                }
                field("Line Discount Amount";"Line Discount Amount")
                {
                }
                field(Amount;Amount)
                {
                }
                field("Amount Including VAT";"Amount Including VAT")
                {
                }
                field("Allow Invoice Disc.";"Allow Invoice Disc.")
                {
                }
                field("Gross Weight";"Gross Weight")
                {
                }
                field("Net Weight";"Net Weight")
                {
                }
                field("Units per Parcel";"Units per Parcel")
                {
                }
                field("Unit Volume";"Unit Volume")
                {
                }
                field("Appl.-to Item Entry";"Appl.-to Item Entry")
                {
                }
                field("Shortcut Dimension 1 Code";"Shortcut Dimension 1 Code")
                {
                }
                field("Shortcut Dimension 2 Code";"Shortcut Dimension 2 Code")
                {
                }
                field("Customer Price Group";"Customer Price Group")
                {
                }
                field("Job No.";"Job No.")
                {
                }
                field("Work Type Code";"Work Type Code")
                {
                }
                field("Recalculate Invoice Disc.";"Recalculate Invoice Disc.")
                {
                }
                field("Outstanding Amount";"Outstanding Amount")
                {
                }
                field("Qty. Shipped Not Invoiced";"Qty. Shipped Not Invoiced")
                {
                }
                field("Shipped Not Invoiced";"Shipped Not Invoiced")
                {
                }
                field("Quantity Shipped";"Quantity Shipped")
                {
                }
                field("Quantity Invoiced";"Quantity Invoiced")
                {
                }
                field("Shipment No.";"Shipment No.")
                {
                }
                field("Shipment Line No.";"Shipment Line No.")
                {
                }
                field("Profit %";"Profit %")
                {
                }
                field("Bill-to Customer No.";"Bill-to Customer No.")
                {
                }
                field("Inv. Discount Amount";"Inv. Discount Amount")
                {
                }
                field("Purchase Order No.";"Purchase Order No.")
                {
                }
                field("Purch. Order Line No.";"Purch. Order Line No.")
                {
                }
                field("Drop Shipment";"Drop Shipment")
                {
                }
                field("Gen. Bus. Posting Group";"Gen. Bus. Posting Group")
                {
                }
                field("Gen. Prod. Posting Group";"Gen. Prod. Posting Group")
                {
                }
                field("VAT Calculation Type";"VAT Calculation Type")
                {
                }
                field("Transaction Type";"Transaction Type")
                {
                }
                field("Transport Method";"Transport Method")
                {
                }
                field("Attached to Line No.";"Attached to Line No.")
                {
                }
                field("Exit Point";"Exit Point")
                {
                }
                field(Area;Area)
                {
                }
                field("Transaction Specification";"Transaction Specification")
                {
                }
                field("Tax Category";"Tax Category")
                {
                }
                field("Tax Area Code";"Tax Area Code")
                {
                }
                field("Tax Liable";"Tax Liable")
                {
                }
                field("Tax Group Code";"Tax Group Code")
                {
                }
                field("VAT Clause Code";"VAT Clause Code")
                {
                }
                field("VAT Bus. Posting Group";"VAT Bus. Posting Group")
                {
                }
                field("VAT Prod. Posting Group";"VAT Prod. Posting Group")
                {
                }
                field("Currency Code";"Currency Code")
                {
                }
                field("Outstanding Amount (LCY)";"Outstanding Amount (LCY)")
                {
                }
                field("Shipped Not Invoiced (LCY)";"Shipped Not Invoiced (LCY)")
                {
                }
                field("Reserved Quantity";"Reserved Quantity")
                {
                }
                field(Reserve;Reserve)
                {
                }
                field("Blanket Order No.";"Blanket Order No.")
                {
                }
                field("Blanket Order Line No.";"Blanket Order Line No.")
                {
                }
                field("VAT Base Amount";"VAT Base Amount")
                {
                }
                field("Unit Cost";"Unit Cost")
                {
                }
                field("System-Created Entry";"System-Created Entry")
                {
                }
                field("Line Amount";"Line Amount")
                {
                }
                field("VAT Difference";"VAT Difference")
                {
                }
                field("Inv. Disc. Amount to Invoice";"Inv. Disc. Amount to Invoice")
                {
                }
                field("VAT Identifier";"VAT Identifier")
                {
                }
                field("IC Partner Ref. Type";"IC Partner Ref. Type")
                {
                }
                field("IC Partner Reference";"IC Partner Reference")
                {
                }
                field("Prepayment %";"Prepayment %")
                {
                }
                field("Prepmt. Line Amount";"Prepmt. Line Amount")
                {
                }
                field("Prepmt. Amt. Inv.";"Prepmt. Amt. Inv.")
                {
                }
                field("Prepmt. Amt. Incl. VAT";"Prepmt. Amt. Incl. VAT")
                {
                }
                field("Prepayment Amount";"Prepayment Amount")
                {
                }
                field("Prepmt. VAT Base Amt.";"Prepmt. VAT Base Amt.")
                {
                }
                field("Prepayment VAT %";"Prepayment VAT %")
                {
                }
                field("Prepmt. VAT Calc. Type";"Prepmt. VAT Calc. Type")
                {
                }
                field("Prepayment VAT Identifier";"Prepayment VAT Identifier")
                {
                }
                field("Prepayment Tax Area Code";"Prepayment Tax Area Code")
                {
                }
                field("Prepayment Tax Liable";"Prepayment Tax Liable")
                {
                }
                field("Prepayment Tax Group Code";"Prepayment Tax Group Code")
                {
                }
                field("Prepmt Amt to Deduct";"Prepmt Amt to Deduct")
                {
                }
                field("Prepmt Amt Deducted";"Prepmt Amt Deducted")
                {
                }
                field("Prepayment Line";"Prepayment Line")
                {
                }
                field("Prepmt. Amount Inv. Incl. VAT";"Prepmt. Amount Inv. Incl. VAT")
                {
                }
                field("Prepmt. Amount Inv. (LCY)";"Prepmt. Amount Inv. (LCY)")
                {
                }
                field("IC Partner Code";"IC Partner Code")
                {
                }
                field("Prepmt. VAT Amount Inv. (LCY)";"Prepmt. VAT Amount Inv. (LCY)")
                {
                }
                field("Prepayment VAT Difference";"Prepayment VAT Difference")
                {
                }
                field("Prepmt VAT Diff. to Deduct";"Prepmt VAT Diff. to Deduct")
                {
                }
                field("Prepmt VAT Diff. Deducted";"Prepmt VAT Diff. Deducted")
                {
                }
                field("Dimension Set ID";"Dimension Set ID")
                {
                }
                field("Qty. to Assemble to Order";"Qty. to Assemble to Order")
                {
                }
                field("Qty. to Asm. to Order (Base)";"Qty. to Asm. to Order (Base)")
                {
                }
                field("ATO Whse. Outstanding Qty.";"ATO Whse. Outstanding Qty.")
                {
                }
                field("ATO Whse. Outstd. Qty. (Base)";"ATO Whse. Outstd. Qty. (Base)")
                {
                }
                field("Job Task No.";"Job Task No.")
                {
                }
                field("Job Contract Entry No.";"Job Contract Entry No.")
                {
                }
                field("Posting Date";"Posting Date")
                {
                }
                field("Deferral Code";"Deferral Code")
                {
                }
                field("Returns Deferral Start Date";"Returns Deferral Start Date")
                {
                }
                field("Variant Code";"Variant Code")
                {
                }
                field("Bin Code";"Bin Code")
                {
                }
                field("Qty. per Unit of Measure";"Qty. per Unit of Measure")
                {
                }
                field(Planned;Planned)
                {
                }
                field("Unit of Measure Code";"Unit of Measure Code")
                {
                }
                field("Quantity (Base)";"Quantity (Base)")
                {
                }
                field("Outstanding Qty. (Base)";"Outstanding Qty. (Base)")
                {
                }
                field("Qty. to Invoice (Base)";"Qty. to Invoice (Base)")
                {
                }
                field("Qty. to Ship (Base)";"Qty. to Ship (Base)")
                {
                }
                field("Qty. Shipped Not Invd. (Base)";"Qty. Shipped Not Invd. (Base)")
                {
                }
                field("Qty. Shipped (Base)";"Qty. Shipped (Base)")
                {
                }
                field("Qty. Invoiced (Base)";"Qty. Invoiced (Base)")
                {
                }
                field("Reserved Qty. (Base)";"Reserved Qty. (Base)")
                {
                }
                field("FA Posting Date";"FA Posting Date")
                {
                }
                field("Depreciation Book Code";"Depreciation Book Code")
                {
                }
                field("Depr. until FA Posting Date";"Depr. until FA Posting Date")
                {
                }
                field("Duplicate in Depreciation Book";"Duplicate in Depreciation Book")
                {
                }
                field("Use Duplication List";"Use Duplication List")
                {
                }
                field("Responsibility Center";"Responsibility Center")
                {
                }
                field("Out-of-Stock Substitution";"Out-of-Stock Substitution")
                {
                }
                field("Substitution Available";"Substitution Available")
                {
                }
                field("Originally Ordered No.";"Originally Ordered No.")
                {
                }
                field("Originally Ordered Var. Code";"Originally Ordered Var. Code")
                {
                }
                field("Cross-Reference No.";"Cross-Reference No.")
                {
                }
                field("Unit of Measure (Cross Ref.)";"Unit of Measure (Cross Ref.)")
                {
                }
                field("Cross-Reference Type";"Cross-Reference Type")
                {
                }
                field("Cross-Reference Type No.";"Cross-Reference Type No.")
                {
                }
                field("Item Category Code";"Item Category Code")
                {
                }
                field(Nonstock;Nonstock)
                {
                }
                field("Purchasing Code";"Purchasing Code")
                {
                }
                field("Product Group Code";"Product Group Code")
                {
                }
                field("Special Order";"Special Order")
                {
                }
                field("Special Order Purchase No.";"Special Order Purchase No.")
                {
                }
                field("Special Order Purch. Line No.";"Special Order Purch. Line No.")
                {
                }
                field("Whse. Outstanding Qty.";"Whse. Outstanding Qty.")
                {
                }
                field("Whse. Outstanding Qty. (Base)";"Whse. Outstanding Qty. (Base)")
                {
                }
                field("Completely Shipped";"Completely Shipped")
                {
                }
                field("Requested Delivery Date";"Requested Delivery Date")
                {
                }
                field("Promised Delivery Date";"Promised Delivery Date")
                {
                }
                field("Shipping Time";"Shipping Time")
                {
                }
                field("Outbound Whse. Handling Time";"Outbound Whse. Handling Time")
                {
                }
                field("Planned Delivery Date";"Planned Delivery Date")
                {
                }
                field("Planned Shipment Date";"Planned Shipment Date")
                {
                }
                field("Shipping Agent Code";"Shipping Agent Code")
                {
                }
                field("Shipping Agent Service Code";"Shipping Agent Service Code")
                {
                }
                field("Allow Item Charge Assignment";"Allow Item Charge Assignment")
                {
                }
                field("Qty. to Assign";"Qty. to Assign")
                {
                }
                field("Qty. Assigned";"Qty. Assigned")
                {
                }
                field("Return Qty. to Receive";"Return Qty. to Receive")
                {
                }
                field("Return Qty. to Receive (Base)";"Return Qty. to Receive (Base)")
                {
                }
                field("Return Qty. Rcd. Not Invd.";"Return Qty. Rcd. Not Invd.")
                {
                }
                field("Ret. Qty. Rcd. Not Invd.(Base)";"Ret. Qty. Rcd. Not Invd.(Base)")
                {
                }
                field("Return Rcd. Not Invd.";"Return Rcd. Not Invd.")
                {
                }
                field("Return Rcd. Not Invd. (LCY)";"Return Rcd. Not Invd. (LCY)")
                {
                }
                field("Return Qty. Received";"Return Qty. Received")
                {
                }
                field("Return Qty. Received (Base)";"Return Qty. Received (Base)")
                {
                }
                field("Appl.-from Item Entry";"Appl.-from Item Entry")
                {
                }
                field("BOM Item No.";"BOM Item No.")
                {
                }
                field("Return Receipt No.";"Return Receipt No.")
                {
                }
                field("Return Receipt Line No.";"Return Receipt Line No.")
                {
                }
                field("Return Reason Code";"Return Reason Code")
                {
                }
                field("Allow Line Disc.";"Allow Line Disc.")
                {
                }
                field("Customer Disc. Group";"Customer Disc. Group")
                {
                }
                field("Tax Amount";"Tax Amount")
                {
                }
                field("Excise Bus. Posting Group";"Excise Bus. Posting Group")
                {
                }
                field("Excise Prod. Posting Group";"Excise Prod. Posting Group")
                {
                }
                field("Excise Amount";"Excise Amount")
                {
                }
                field("Amount Including Excise";"Amount Including Excise")
                {
                }
                field("Excise Base Amount";"Excise Base Amount")
                {
                }
                field("Excise Accounting Type";"Excise Accounting Type")
                {
                }
                field("Excise Base Quantity";"Excise Base Quantity")
                {
                }
                field("Tax %";"Tax %")
                {
                }
                field("Amount Including Tax";"Amount Including Tax")
                {
                }
                field("Amount Added to Excise Base";"Amount Added to Excise Base")
                {
                }
                field("Amount Added to Tax Base";"Amount Added to Tax Base")
                {
                }
                field("Tax Base Amount";"Tax Base Amount")
                {
                }
                field("Surcharge %";"Surcharge %")
                {
                }
                field("Surcharge Amount";"Surcharge Amount")
                {
                }
                field("Concessional Code";"Concessional Code")
                {
                }
                field("Assessee Code";"Assessee Code")
                {
                }
                field("TDS/TCS %";"TDS/TCS %")
                {
                }
                field("Bal. TDS/TCS Including SHECESS";"Bal. TDS/TCS Including SHECESS")
                {
                }
                field("Claim Deferred Excise";"Claim Deferred Excise")
                {
                }
                field("Capital Item";"Capital Item")
                {
                }
                field("BED Amount";"BED Amount")
                {
                }
                field("AED(GSI) Amount";"AED(GSI) Amount")
                {
                }
                field("SED Amount";"SED Amount")
                {
                }
                field("SAED Amount";"SAED Amount")
                {
                }
                field("CESS Amount";"CESS Amount")
                {
                }
                field("NCCD Amount";"NCCD Amount")
                {
                }
                field("eCess Amount";"eCess Amount")
                {
                }
                field("Form Code";"Form Code")
                {
                }
                field("Form No.";"Form No.")
                {
                }
                field(State;State)
                {
                }
                field("TDS/TCS Amount";"TDS/TCS Amount")
                {
                }
                field("Amount To Customer";"Amount To Customer")
                {
                }
                field("Charges To Customer";"Charges To Customer")
                {
                }
                field("TDS/TCS Base Amount";"TDS/TCS Base Amount")
                {
                }
                field("Surcharge Base Amount";"Surcharge Base Amount")
                {
                }
                field("Temp TDS/TCS Base";"Temp TDS/TCS Base")
                {
                }
                field("Service Tax Group";"Service Tax Group")
                {
                }
                field("Service Tax Base";"Service Tax Base")
                {
                }
                field("Service Tax Amount";"Service Tax Amount")
                {
                }
                field("Service Tax Registration No.";"Service Tax Registration No.")
                {
                }
                field("eCESS % on TDS/TCS";"eCESS % on TDS/TCS")
                {
                }
                field("eCESS on TDS/TCS Amount";"eCESS on TDS/TCS Amount")
                {
                }
                field("Total TDS/TCS Incl. SHE CESS";"Total TDS/TCS Incl. SHE CESS")
                {
                }
                field("Per Contract";"Per Contract")
                {
                }
                field("Service Tax eCess Amount";"Service Tax eCess Amount")
                {
                }
                field("ADET Amount";"ADET Amount")
                {
                }
                field("AED(TTA) Amount";"AED(TTA) Amount")
                {
                }
                field("Free Supply";"Free Supply")
                {
                }
                field("ADE Amount";"ADE Amount")
                {
                }
                field("Assessable Value";"Assessable Value")
                {
                }
                field("VAT Type";"VAT Type")
                {
                }
                field("SHE Cess Amount";"SHE Cess Amount")
                {
                }
                field("Service Tax SHE Cess Amount";"Service Tax SHE Cess Amount")
                {
                }
                field("Direct Debit To PLA / RG";"Direct Debit To PLA / RG")
                {
                }
                field("TCS Nature of Collection";"TCS Nature of Collection")
                {
                }
                field("TCS Type";"TCS Type")
                {
                }
                field("Standard Deduction %";"Standard Deduction %")
                {
                }
                field("Standard Deduction Amount";"Standard Deduction Amount")
                {
                }
                field(Supplementary;Supplementary)
                {
                }
                field("Source Document Type";"Source Document Type")
                {
                }
                field("Source Document No.";"Source Document No.")
                {
                }
                field("ADC VAT Amount";"ADC VAT Amount")
                {
                }
                field("CIF Amount";"CIF Amount")
                {
                }
                field("BCD Amount";"BCD Amount")
                {
                }
                field(CVD;CVD)
                {
                }
                field("Process Carried Out";"Process Carried Out")
                {
                }
                field("Identification Mark";"Identification Mark")
                {
                }
                field("Re-Dispatch";"Re-Dispatch")
                {
                }
                field("Return Rcpt Line No.";"Return Rcpt Line No.")
                {
                }
                field("Qty. to be Re-Dispatched";"Qty. to be Re-Dispatched")
                {
                }
                field("Return Re-Dispatch Rcpt. No.";"Return Re-Dispatch Rcpt. No.")
                {
                }
                field("SHE Cess % on TDS/TCS";"SHE Cess % on TDS/TCS")
                {
                }
                field("SHE Cess on TDS/TCS Amount";"SHE Cess on TDS/TCS Amount")
                {
                }
                field("MRP Price";"MRP Price")
                {
                }
                field(MRP;MRP)
                {
                }
                field("Abatement %";"Abatement %")
                {
                }
                field("PIT Structure";"PIT Structure")
                {
                }
                field("Price Inclusive of Tax";"Price Inclusive of Tax")
                {
                }
                field("Unit Price Incl. of Tax";"Unit Price Incl. of Tax")
                {
                }
                field("Excise Base Variable";"Excise Base Variable")
                {
                }
                field("Tax Base Variable";"Tax Base Variable")
                {
                }
                field("Amount To Customer UPIT";"Amount To Customer UPIT")
                {
                }
                field("UPIT Rounding Inserted";"UPIT Rounding Inserted")
                {
                }
                field("Total UPIT Amount";"Total UPIT Amount")
                {
                }
                field("Inv Discount Fixed";"Inv Discount Fixed")
                {
                }
                field("Inv Discount Variable";"Inv Discount Variable")
                {
                }
                field("Custom eCess Amount";"Custom eCess Amount")
                {
                }
                field("Custom SHECess Amount";"Custom SHECess Amount")
                {
                }
                field("Excise Effective Rate";"Excise Effective Rate")
                {
                }
                field("Item Charge Entry";"Item Charge Entry")
                {
                }
                field("Tot. Serv Tax Amount (Intm)";"Tot. Serv Tax Amount (Intm)")
                {
                }
                field("S. Tax Base Amount (Intm)";"S. Tax Base Amount (Intm)")
                {
                }
                field("S. Tax Amount (Intm)";"S. Tax Amount (Intm)")
                {
                }
                field("S. Tax eCess Amount (Intm)";"S. Tax eCess Amount (Intm)")
                {
                }
                field("S. Tax SHE Cess Amount (Intm)";"S. Tax SHE Cess Amount (Intm)")
                {
                }
                field("Amt. Incl. Service Tax (Intm)";"Amt. Incl. Service Tax (Intm)")
                {
                }
                field("Service Tax SBC %";"Service Tax SBC %")
                {
                }
                field("Service Tax SBC Amount";"Service Tax SBC Amount")
                {
                }
                field("Service Tax SBC Amount (Intm)";"Service Tax SBC Amount (Intm)")
                {
                }
                field("KK Cess%";"KK Cess%")
                {
                }
                field("KK Cess Amount";"KK Cess Amount")
                {
                }
                field("KK Cess Amount (Intm)";"KK Cess Amount (Intm)")
                {
                }
                field("GST Place of Supply";"GST Place of Supply")
                {
                }
                field("GST Group Code";"GST Group Code")
                {
                }
                field("GST Group Type";"GST Group Type")
                {
                }
                field("GST Base Amount";"GST Base Amount")
                {
                }
                field("GST %";"GST %")
                {
                }
                field("Total GST Amount";"Total GST Amount")
                {
                }
                field("HSN/SAC Code";"HSN/SAC Code")
                {
                }
                field("GST Jurisdiction Type";"GST Jurisdiction Type")
                {
                }
                field("Invoice Type";"Invoice Type")
                {
                }
                field(Exempted;Exempted)
                {
                }
                field("Package No.";"Package No.")
                {
                }
                field(Weight;Weight)
                {
                }
                field("Confirm Shipping Date";"Confirm Shipping Date")
                {
                }
                field(Notification;Notification)
                {
                }
                field("Order Date";OrderDate)
                {
                    Caption = 'Order Date';
                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetRecord()
    begin
        CLEAR(InventoryStock);
        CLEAR(InventoryNippon);           //ZE_LIJO 26.6.19
        CLEAR(InventoryQuarantine);       //ZE_LIJO 26.6.19
        CLEAR(OrderDate);
        IF Item.GET("No.") THEN BEGIN
          Item.CALCFIELDS(Inventory,"Inventory-Nippon","Inventory-Quarantine");      //ZE_LIJO 26.6.19
          InventoryStock :=Item.Inventory;
          InventoryNippon :=Item."Inventory-Nippon";                                 //ZE_LIJO 26.6.19
          InventoryQuarantine :=Item."Inventory-Quarantine";                         //ZE_LIJO 26.6.19
        END;
        SalesHeader.RESET;
        SalesHeader.SETRANGE("No.","Document No.");
        IF SalesHeader.FINDSET THEN BEGIN
          OrderDate :=SalesHeader."Order Date";
        END;
    end;

    var
        SalesInfoPaneMgt: Codeunit "7171";
        ItemAvailFormsMgt: Codeunit "353";
        InventoryStock: Decimal;
        Item: Record "27";
        OrderDate: Date;
        SalesHeader: Record "36";
        InventoryNippon: Decimal;
        InventoryQuarantine: Decimal;
}

