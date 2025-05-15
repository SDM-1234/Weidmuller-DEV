table 50090 "Record Deletion Table"
{
    // **************************************************************************************************************************
    // Created and Designed by Olof Simren 2014
    // Downloaded from olofsimren.com
    // 
    // For illustration only, without warranty, free to use as you want.
    // **************************************************************************************************************************


    fields
    {
        field(1; "Table ID"; Integer)
        {
            Editable = false;
        }
        field(2; "Table Name"; Text[250])
        {
            CalcFormula = Lookup (AllObjWithCaption."Object Name" WHERE (Object Type=CONST(Table),
                                                                        Object ID=FIELD(Table ID)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(3;"No. of Records";Integer)
        {
            CalcFormula = Lookup("Table Information"."No. of Records" WHERE (Company Name=FIELD(Company),
                                                                             Table No.=FIELD(Table ID)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(4;"No. of Table Relation Errors";Integer)
        {
            CalcFormula = Count("Record Del. Table Rel. Error" WHERE (Table ID=FIELD(Table ID)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(5;"Delete Records";Boolean)
        {
        }
        field(6;Company;Text[30])
        {
        }
    }

    keys
    {
        key(Key1;"Table ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        Company := COMPANYNAME;
    end;
}

