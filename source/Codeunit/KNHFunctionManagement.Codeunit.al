/// <summary>
/// Codeunit contains three procedures that demonstrate different ways of using the ErrorInfo data type to show error messages with custom titles, messages, and actions. 
/// The DoSomething procedure shows how to create an error message with a custom title and message, and add a navigation action to it. 
/// The DoSomething2 procedure shows how to create an error message that navigates to a specific page without needing to specify a record. 
/// The DoSomething3 procedure shows how to combine a navigation action with a custom action in the same error message.
/// </summary>
codeunit 52000 KNHFunctionManagement
{
    var
        ErrorTxt: Label 'There is something wrong with the sales setup as the customer %1, %2 could not be used.', Comment = '%1 = Customer.No. %2 = Customer.Name';

    procedure DoSomething(Customer: Record Customer)
    var
        MyErrorInfo: ErrorInfo;
    begin
        MyErrorInfo.Title := 'Oh no!';
        MyErrorInfo.Message(StrSubstNo(this.ErrorTxt, Customer."No.", Customer.Name));
        MyErrorInfo.PageNo(Page::"Customer Card");
        MyErrorInfo.FieldNo(Customer.FieldNo("Customer Posting Group"));
        MyErrorInfo.RecordId(Customer.RecordId());
        MyErrorInfo.AddNavigationAction();
        Error(MyErrorInfo);
    end;

    procedure DoSomething2(Customer: Record Customer)
    var
        MyErrorInfo: ErrorInfo;
    begin
        MyErrorInfo.Title := 'Oh no!';
        MyErrorInfo.Message(StrSubstNo(this.ErrorTxt, Customer."No.", Customer.Name));
        MyErrorInfo.PageNo(Page::"Sales & Receivables Setup");
        MyErrorInfo.AddNavigationAction();
        Error(MyErrorInfo);
    end;

    procedure DoSomething3(Customer: Record Customer)
    var
        newLbl: Label 'TrySolve2';
        MyErrorInfo: ErrorInfo;
    begin
        MyErrorInfo.Title := 'Oh no!';
        MyErrorInfo.Message(StrSubstNo(this.ErrorTxt, Customer."No.", Customer.Name));
        MyErrorInfo.PageNo(Page::"Sales & Receivables Setup");
        MyErrorInfo.AddNavigationAction();
        MyErrorInfo.AddAction('Why?!', Codeunit::KNHResolveIt, newLbl);
        Error(MyErrorInfo);
    end;
}
