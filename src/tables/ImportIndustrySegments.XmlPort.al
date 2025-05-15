xmlport 50000 "Import Industry Segments"
{
    FieldDelimiter = '<None>';
    FieldSeparator = '<TAB>';
    Format = VariableText;

    schema
    {
        textelement(Root)
        {
            tableelement(Table50004; Table50004)
            {
                AutoSave = false;
                XmlName = 'IndustrySegment';
                UseTemporary = true;
                textelement(CustomerNo)
                {
                }
                textelement(IndustrySegmentCode)
                {
                }
                textelement(SalesPercentage)
                {
                }

                trigger OnBeforeInsertRecord()
                var
                    IndustrySegment: Record "50004";
                begin
                    IF Firstline THEN BEGIN
                        Firstline := FALSE;
                        currXMLport.SKIP;
                    END;
                    IndustrySegment.RESET;
                    IndustrySegment.INIT;
                    IndustrySegment."Customer No." := CustomerNo;
                    IndustrySegment."Industry Group Code" := IndustrySegmentCode;
                    EVALUATE(IndustrySegment."Sales %", SalesPercentage);
                    IndustrySegment.INSERT;
                end;
            }
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

    trigger OnPreXmlPort()
    begin
        Firstline := TRUE;
    end;

    var
        Firstline: Boolean;
}

