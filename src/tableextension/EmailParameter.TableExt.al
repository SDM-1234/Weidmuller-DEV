tableextension 50036 tableextension50036 extends "SMTP Mail Setup"
{
    fields
    {
        field(8; CC; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(9; BCC; Text[30])
        {
            DataClassification = ToBeClassified;
        }
    }
}

