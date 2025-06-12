pageextension 50070 CreateOpportunity extends "Create Opportunity"
{

    //Unsupported feature: Property Modification (PageType) on ""Create Opportunity"(Page 5126)".

    layout
    {
        addafter("Sales Cycle Code")
        {
            field("Calendar Week"; rec."Calendar Week")
            {
                ToolTip = 'Specifies the value of the Calendar Week field.';
                ApplicationArea = All;
            }
        }
    }
}

