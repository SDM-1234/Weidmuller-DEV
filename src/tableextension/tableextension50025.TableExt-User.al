tableextension 50025 tableextension50025 extends User
{
    fields
    {
        field(50000; "Team Code"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = Team;
        }
    }
}

