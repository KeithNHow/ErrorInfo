/// <summary>
/// PageExtension "KNH_CustomerListExt" (ID 52000) extends Record Customer.
/// </summary>
pageextension 52000 "KNH_CustomerListExt" extends "Customer List"
{
    actions
    {
        addfirst(processing)
        {
            action(KNH_Test)
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
