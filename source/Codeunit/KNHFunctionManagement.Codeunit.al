/// <summary>
/// Codeunit KNH_FunctionManagement (ID 50101).
/// </summary>
codeunit 52000 "KNH_FunctionManagement"
{
    var
        ErrorTxt: Label 'There is something wrong with the sales setup as the customer %1, %2 could not be used.', Comment = '%1 = Customer.No. %2 = Customer.Name';

    /// <summary>
    /// DoSomething - The error message is shown with a custom title and text and two buttons – standard OK that just close the dialogue and the new “Navigate” action.
    /// </summary>
    /// <param name="Customer">Record Customer.</param>
    procedure DoSomething(Customer: Record Customer)
    var
        MyErrorInfo: ErrorInfo;
    begin
        MyErrorInfo.Title := 'Ouu noo!';
        MyErrorInfo.Message(StrSubstNo(ErrorTxt, Customer."No.", Customer.Name));
        MyErrorInfo.PageNo(Page::"Customer Card");
        MyErrorInfo.FieldNo(Customer.FieldNo("Customer Posting Group"));
        MyErrorInfo.RecordId(Customer.RecordId());
        MyErrorInfo.AddNavigationAction();
        Error(MyErrorInfo);
    end;

    /// <summary>
    /// DoSomething2 - If we want to open a page and we do not care about the specific record. We do not need to initialize the record variable. We just need to set the page we want to open.
    /// </summary>
    /// <param name="Customer">Record Customer.</param>
    procedure DoSomething2(Customer: Record Customer)
    var
        MyErrorInfo: ErrorInfo;
    begin
        MyErrorInfo.Title := 'Ouu noo!';
        MyErrorInfo.Message(StrSubstNo(ErrorTxt, Customer."No.", Customer.Name));
        MyErrorInfo.PageNo(Page::"Sales & Receivables Setup");
        MyErrorInfo.AddNavigationAction();
        Error(MyErrorInfo);
    end;

    /// <summary>
    /// DoSomething3 - We can even combine NavigationAction with our custom actions.
    /// </summary>
    /// <param name="Customer">Record Customer.</param>
    procedure DoSomething3(Customer: Record Customer)
    var
        MyErrorInfo: ErrorInfo;
    begin
        MyErrorInfo.Title := 'Ouu noo!';
        MyErrorInfo.Message(StrSubstNo(ErrorTxt, Customer."No.", Customer.Name));
        MyErrorInfo.PageNo(Page::"Sales & Receivables Setup");
        MyErrorInfo.AddNavigationAction();
        MyErrorInfo.AddAction('Why?!', Codeunit::"KNH_TKAResolveIt", 'TrySolve2');
        Error(MyErrorInfo);
    end;
}
