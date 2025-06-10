namespace WMPermission;

permissionset 50000 PermissionSet
{
    Assignable = true;
    Permissions = tabledata "Industry Segment" = RIMD,
        tabledata "Industry Segment Group" = RIMD,
        table "Industry Segment" = X,
        table "Industry Segment Group" = X
}