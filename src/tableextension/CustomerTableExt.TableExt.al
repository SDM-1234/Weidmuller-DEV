tableextension 50024 "CustomerTableExt" extends Customer
{
    fields
    {
        modify(Name)
        {
            trigger OnAftervalidate()
            begin
                IF "E-Mail" = '' THEN
                    ERROR('Kindly enter Customer mail');
            end;
        }

        modify("Customer Posting Group")
        {
            trigger OnAfterValidate()
            begin
                IF "Customer Posting Group" = 'LOCAL' THEN
                    "Currency Code" := 'INR';
            end;
        }
        modify("Currency Code")
        {
            trigger OnAfterValidate()
            begin
                IF ("Customer Posting Group" = 'LOCAL') OR ("Customer Posting Group" = 'EMPLOYEE') THEN
                    TESTFIELD("Currency Code", 'INR');

                IF "Currency Code" = 'INR' THEN
                    TESTFIELD("Customer Posting Group", 'LOCAL|EMPLOYEE');
            end;
        }
        modify("E-Mail")
        {
            trigger OnAfterValidate()
            var
                mailManagement: Codeunit "Email Account";
            begin
                mailManagement.ValidateEmailAddress("E-Mail");
            end;
        }
        field(50000; "WM_WMNo. of Industry Segments"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = Count("Industry Segment" WHERE("Customer No." = FIELD("No.")));
            Editable = false;
            ToolTip = 'Number of Industry Segments for this Customer';

        }
        field(50001; "WM_WMInvoice Print Check"; Boolean)
        {
            DataClassification = ToBeClassified;
            Description = 'E963 To Restrict Multiple Sales Shpmnt Selection from Sales Invoice';
        }
        field(50002; WM_WMFreight; Boolean)
        {
            DataClassification = ToBeClassified;
            Description = 'SE_E969';
        }
        field(50003; "WM_WMFreight GL Account"; Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'SE_E969';
            TableRelation = "G/L Account" WHERE("Direct Posting" = CONST(true),
                                                 "Account Type" = CONST(Posting),
                                                 Blocked = CONST(false));
        }
    }

    procedure SetBlockParameterFromDocs()
    begin
        SetBlockParameterFromDocsValue := TRUE;
    end;

    procedure GetBlockParameterFromDocs(): Boolean
    begin
        Exit(SetBlockParameterFromDocsValue);
    end;

    protected var
        SetBlockParameterFromDocsValue: Boolean;
}

