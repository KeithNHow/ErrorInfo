/// <summary>
/// PermSet ErrorInfo (ID 52000).
/// </summary>
permissionset 52000 "KNH_ErrorInfo"
{
    Assignable = true;
    Caption = 'ErrorInfo', MaxLength = 30;
    Permissions =
        codeunit KNH_TKAResolveIt = X,
        codeunit KNH_FunctionManagement = X;
}
