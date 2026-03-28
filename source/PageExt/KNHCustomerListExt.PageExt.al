/// <summary>
/// PageExtension extends Customer List page. The page extension adds a new action to the processing action pane. The new action is called KNHTest, and when clicked, it will display an error message with the title 'More Informative Error'.
/// </summary>
namespace KNHErrorInfo;
using Microsoft.Sales.Customer;

pageextension 52000 KNHCustomerListExt extends "Customer List"
{
    actions
    {
        addfirst(processing)
        {
            action(KNHTest)
            {
                ApplicationArea = All;
                Caption = 'Test';
                ToolTip = 'Test';
                Image = PrintCover;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    MyErrorInfo: ErrorInfo;
                begin
                    MyErrorInfo.Title := 'More Informative Error';
                end;
            }
        }
    }
}
