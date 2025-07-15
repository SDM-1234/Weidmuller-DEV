tableextension 50024 Customer extends Customer
{
    fields
    {

        modify(Name)
        {
            trigger OnAfterValidate()
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
                    TESTFIELD("Customer Posting Group", 'LOCAL|EMPOYEE')
            end;
        }

        modify("E-Mail")

        {
            trigger OnAfterValidate()
            begin
                MailManagement.CheckValidEmailAddress("E-Mail");
            end;
        }

        field(50000; "No. of Industry Segments"; Integer)
        {
            CalcFormula = Count("Industry Segment" WHERE("Customer No." = FIELD("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50001; "Invoice Print Check"; Boolean)
        {
            DataClassification = ToBeClassified;
            Description = 'E963 To Restrict Multiple Sales Shpmnt Selection from Sales Invoice';
        }
        field(50002; Freight; Boolean)
        {
            DataClassification = ToBeClassified;
            Description = 'SE_E969';
        }
        field(50003; "Freight GL Account"; Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'SE_E969';
            TableRelation = "G/L Account" WHERE("Direct Posting" = CONST(true), "Account Type" = CONST(Posting), Blocked = CONST(false));
        }
    }

    var
        MailManagement: Codeunit "Mail Management";

}

