permissionset 50100 GeneratedPermission
{
    Assignable = true;
    Permissions = tabledata "Dunning Remarks" = RIMD,
        tabledata "Industry Segment" = RIMD,
        tabledata "Industry Segment Group" = RIMD,
        tabledata "Sales Segment" = RIMD,
        table "Dunning Remarks" = X,
        table "Industry Segment" = X,
        table "Industry Segment Group" = X,
        table "Sales Segment" = X,
        codeunit ChangeNameSubscriber = X,
        codeunit CustNameChaneEvent = X,
        codeunit "Customer Credit Check" = X,
        codeunit "Sales Price Management" = X,
        codeunit SalesSubscriber = X,
        codeunit "Single Instance CU" = X,
        codeunit "Subscriber CodeUnit" = X,
        codeunit "Test CU" = X,
        page "Actual Inventory" = X,
        page "BinContent FactBox" = X,
        page "Industry Segment Group list" = X,
        page "Industry Segments" = X,
        page "Sales Segments" = X;
}