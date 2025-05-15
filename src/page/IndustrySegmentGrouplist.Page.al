page 50009 "Industry Segment Group list"
{
    DelayedInsert = true;
    PageType = List;
    SourceTable = Table50000;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Code; Code)
                {
                }
                field(Description; Description)
                {
                }
            }
        }
    }

    actions
    {
    }
}

