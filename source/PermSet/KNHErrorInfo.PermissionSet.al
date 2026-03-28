/// <summary>
/// PermSet ErrorInfo (ID 52000).
/// </summary>
permissionset 52050 KNHErrorInfo
{
    Assignable = true;
    Caption = 'ErrorInfo', MaxLength = 30;
    Permissions =
        codeunit KNHResolveIt = X,
        codeunit KNHFunctionManagement = X;
}
