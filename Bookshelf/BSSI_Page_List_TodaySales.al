page 50128 BSSI_Page_List_TodaySales
{
    Caption = 'Book Sales For Today';
    PageType = List;
    SourceTable = BSSI_Table_BookSalesLines;
    SourceTableView = where (BSSI_Field_TodayCheck = const(true));
    UsageCategory = Administration;
    ApplicationArea = All;
    //Editable = false;
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(BSSI_Field_OrderID; rec.BSSI_Field_OrderID)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field(BSSI_Field_PersonID; rec.BSSI_Field_PersonID)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field(BSSI_Field_DateOfPurchase; rec.BSSI_Field_DateOfPurchase)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field(BSSI_Field_BookNo; Rec.BSSI_Field_BookNo)
                {
                    ApplicationArea = all;
                }
                field(BSSI_Field_Quantity; Rec.BSSI_Field_Quantity)
                {
                    ApplicationArea = all;
                }
                field(BSSI_Field_LineAmount; Rec.BSSI_Field_LineAmount)
                {
                    Caption = ' Line Amount ($)';
                    ApplicationArea = all;
                    Editable = false;
                }
                field(BSSI_Field_Status; Rec.BSSI_Field_Status)
                {
                    ApplicationArea = all;
                    Editable = false;
                    StyleExpr = StatusStyleTxt;
                }
                field(BSSI_Field_CurrentMonthCheck; Rec.BSSI_Field_CurrentMonthCheck)
                {
                    ApplicationArea = All;
                    Editable = false;
                    Visible = false;
                }
                field(BSSI_Field_TodayCheck; Rec.BSSI_Field_TodayCheck)
                {
                    ApplicationArea = All;
                    Editable = false;
                    Visible = false;
                }

            }
        }

    }

    trigger OnAfterGetRecord()
    begin
        if Rec.BSSI_Field_Status = Rec.BSSI_Field_Status::Open then begin
            StatusStyleTxt := 'Favorable';
        end else begin
            StatusStyleTxt := 'Strong';
        end;
    end;

    var
        StatusStyleTxt: Text;
}