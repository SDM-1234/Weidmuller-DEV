page 50007 "Sales Shipment line Details"
{
    Editable = false;
    PageType = List;
    SourceTable = Table111;
    SourceTableView = WHERE (Quantity = FILTER (<> 0));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Sell-to Customer No."; "Sell-to Customer No.")
                {
                }
                field("Document No."; "Document No.")
                {
                }
                field("Line No."; "Line No.")
                {
                }
                field(Type; Type)
                {
                }
                field("No."; "No.")
                {
                }
                field("Location Code"; "Location Code")
                {
                }
                field("Posting Group"; "Posting Group")
                {
                }
                field("Shipment Date"; "Shipment Date")
                {
                }
                field(Description; Description)
                {
                }
                field("Description 2"; "Description 2")
                {
                }
                field("Unit of Measure"; "Unit of Measure")
                {
                }
                field(Quantity; Quantity)
                {
                }
                field("Unit Price"; "Unit Price")
                {
                }
                field("Unit Cost (LCY)"; "Unit Cost (LCY)")
                {
                }
                field("VAT %"; "VAT %")
                {
                }
                field("Line Discount %"; "Line Discount %")
                {
                }
                field("Allow Invoice Disc."; "Allow Invoice Disc.")
                {
                }
                field("Gross Weight"; "Gross Weight")
                {
                }
                field("Net Weight"; "Net Weight")
                {
                }
                field("Units per Parcel"; "Units per Parcel")
                {
                }
                field("Unit Volume"; "Unit Volume")
                {
                }
                field("Appl.-to Item Entry"; "Appl.-to Item Entry")
                {
                }
                field("Item Shpt. Entry No."; "Item Shpt. Entry No.")
                {
                }
                field("Shortcut Dimension 1 Code"; "Shortcut Dimension 1 Code")
                {
                }
                field("Shortcut Dimension 2 Code"; "Shortcut Dimension 2 Code")
                {
                }
                field("Customer Price Group"; "Customer Price Group")
                {
                }
                field("Job No."; "Job No.")
                {
                }
                field("Work Type Code"; "Work Type Code")
                {
                }
                field("Qty. Shipped Not Invoiced"; "Qty. Shipped Not Invoiced")
                {
                }
                field("Quantity Invoiced"; "Quantity Invoiced")
                {
                }
                field("Order No."; "Order No.")
                {
                }
                field("Order Line No."; "Order Line No.")
                {
                }
                field("Bill-to Customer No."; "Bill-to Customer No.")
                {
                }
                field("Purchase Order No."; "Purchase Order No.")
                {
                }
                field("Purch. Order Line No."; "Purch. Order Line No.")
                {
                }
                field("Drop Shipment"; "Drop Shipment")
                {
                }
                field("Gen. Bus. Posting Group"; "Gen. Bus. Posting Group")
                {
                }
                field("Gen. Prod. Posting Group"; "Gen. Prod. Posting Group")
                {
                }
                field("VAT Calculation Type"; "VAT Calculation Type")
                {
                }
                field("Transaction Type"; "Transaction Type")
                {
                }
                field("Transport Method"; "Transport Method")
                {
                }
                field("Attached to Line No."; "Attached to Line No.")
                {
                }
                field("Exit Point"; "Exit Point")
                {
                }
                field(Area;Area)
        {
        }
                field("Transaction Specification";"Transaction Specification")
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
                field("VAT Bus. Posting Group";"VAT Bus. Posting Group")
                {
                }
                field("VAT Prod. Posting Group";"VAT Prod. Posting Group")
                {
                }
                field("Currency Code";"Currency Code")
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
                field("Posting Date";"Posting Date")
                {
                }
                field("Dimension Set ID";"Dimension Set ID")
                {
                }
                field("Authorized for Credit Card";"Authorized for Credit Card")
                {
                }
                field("Job Task No.";"Job Task No.")
                {
                }
                field("Job Contract Entry No.";"Job Contract Entry No.")
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
                field("Unit of Measure Code";"Unit of Measure Code")
                {
                }
                field("Quantity (Base)";"Quantity (Base)")
                {
                }
                field("Qty. Invoiced (Base)";"Qty. Invoiced (Base)")
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
                field("Appl.-from Item Entry";"Appl.-from Item Entry")
                {
                }
                field("Item Charge Base Amount";"Item Charge Base Amount")
                {
                }
                field(Correction;Correction)
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
                field("Service Tax Group";"Service Tax Group")
                {
                }
                field("Service Tax %";"Service Tax %")
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
                field("SHE Cess Amount";"SHE Cess Amount")
                {
                }
                field("Direct Debit To PLA / RG";"Direct Debit To PLA / RG")
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
                field("Return Rcpt line No.";"Return Rcpt line No.")
                {
                }
                field("Qty. to be Re-Dispatched";"Qty. to be Re-Dispatched")
                {
                }
                field("Return Re-Dispatch Rcpt. No.";"Return Re-Dispatch Rcpt. No.")
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
                field("Amount To Customer UPIT";"Amount To Customer UPIT")
                {
                }
                field("UPIT Rounding Inserted";"UPIT Rounding Inserted")
                {
                }
                field("Custom eCess Amount";"Custom eCess Amount")
                {
                }
                field("Custom SHECess Amount";"Custom SHECess Amount")
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
            }
        }
    }

    actions
    {
    }
}

