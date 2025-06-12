tableextension 50053 CompanyInformationWM extends "Company Information"
{
    fields
    {

        field(50001; "Home Page 2"; Text[80])
        {
            Caption = 'Home Page';
            ExtendedDatatype = URL;
        }
        field(50002; CIN; Code[30])
        {
        }
        field(50003; "IFSC Code"; Code[11])
        {
        }
        field(50004; "Terms Picture"; Media)
        {
            Caption = 'Picture';
        }
        field(50005; "LUT No."; Code[30])
        {
        }
        field(50006; "Digital Signature"; BLOB)
        {
            Caption = 'Digital Signature';
            DataClassification = ToBeClassified;
            Description = 'SE-E969';
            SubType = Bitmap;
        }
    }
}

