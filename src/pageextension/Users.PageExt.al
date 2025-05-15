pageextension 50120 Users extends Users
{
    layout
    {
        addafter("License Type")
        {
            field("Team Code"; "Team Code")
            {
            }
        }
        addafter("Authentication Email")
        {
            field(State; State)
            {
            }
        }
    }
}

