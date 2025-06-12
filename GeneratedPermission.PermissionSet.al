permissionset 50100 GeneratedPermission
{
    Assignable = true;
    Permissions = tabledata "Industry Segment" = RIMD,
        tabledata "Industry Segment Group" = RIMD,
        table "Industry Segment" = X,
        table "Industry Segment Group" = X,
        codeunit ChangeNameSubscriber = X,
        codeunit CustNameChaneEvent = X,
        codeunit "Customer Credit Check" = X,
        codeunit "Sales Price Management" = X,
        codeunit SalesSubscriber = X,
        codeunit "Single Instance CU" = X,
        codeunit "Subscriber CodeUnit" = X,
        codeunit "Test CU" = X;
}