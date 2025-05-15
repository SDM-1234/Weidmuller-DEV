tableextension 50033 tableextension50033 extends "Purchase Header"
{
    fields
    {
        modify("Your Reference")
        {

            //Unsupported feature: Property Modification (Data type) on ""Your Reference"(Field 11)".

            Description = 'changed to 35 to 100';
        }

        //Unsupported feature: Code Modification on ""Order Address Code"(Field 95).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        IF "Order Address Code" <> '' THEN BEGIN
          OrderAddr.GET("Buy-from Vendor No.","Order Address Code");
          "Buy-from Vendor Name" := OrderAddr.Name;
        #4..57
          "Buy-from Post Code" := Vend."Post Code";
          "Buy-from County" := Vend.County;
          "Buy-from Country/Region Code" := Vend."Country/Region Code";
          "GST Order Address State" := '';
          "Order Address GST Reg. No." := '';
          PurchLine.SETRANGE("Document Type","Document Type");
        #64..67
              PurchLine."Buy-From GST Registration No" := "Vendor GST Reg. No.";
              PurchLine.MODIFY
            UNTIL PurchLine.NEXT = 0;
          IF ("Document Type" = "Document Type"::"Return Order") OR
             ("Document Type" = "Document Type"::"Credit Memo")
          THEN BEGIN
        #74..88
        END;
        CheckReferenceInvoiceNo;
        "POS Out Of India" := FALSE;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        #1..60

        #61..70

        #71..91
        */
        //end;
    }
    keys
    {
    }

    procedure CheckAttachment(GRec: Record "38")
    var
        IncomingDocumentAttachment: Record "133";
        RecordLink: Record "2000000068";
    begin
        RecordLink.SETRANGE("Record ID", GRec.RECORDID);
        IF NOT RecordLink.FINDFIRST THEN
            ERROR('Link attachment is mandatory to send approval request');
    end;

    var
        GSTRegNoErr: Label 'You cannot select GST Reg. No. for Vendor Type.';
}

