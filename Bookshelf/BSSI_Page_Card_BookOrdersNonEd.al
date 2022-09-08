page 50115 BSSI_Page_Card_BookOrdersNonEd
{
    Caption = 'Books Order Card';
    PageType = Card;
    //ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = BSSI_Table_BookOrders;
    //Editable = false;
    //ModifyAllowed = false;

    layout
    {
        area(Content)
        {
            group(Details)
            {
                field(BSSI_Field_OrderID; Rec.BSSI_Field_OrderID)
                {
                    ApplicationArea = all;
                }

                field(BSSI_Field_PersonID; Rec.BSSI_Field_PersonID)
                {
                    ApplicationArea = all;
                    ToolTip = 'Enter the ID of the customer : Code[20]';
                }
                field(BSSI_Field_DateOfPurchase; Rec.BSSI_Field_DateOfPurchase)
                {
                    ApplicationArea = all;
                    ToolTip = 'Enter the date of purchase.';
                }
                field(BSSI_Field_Status; Rec.BSSI_Field_Status)
                {
                    ApplicationArea = All;
                    Editable = false;
                    StyleExpr = StatusStyleTxt;
                }

            }
            group(BookSalesLines)
            {
                Caption = 'Book Sales Lines';
                part(Lines; BSSI_Page_ListPart_BookSalesP)
                {
                    ApplicationArea = all;
                    SubPageLink = BSSI_Field_OrderID = field(BSSI_Field_OrderID);
                }
            }

        }
    }

    actions
    {
        area(Processing)
        {
            action(ConfirmOrder)
            {
                Caption = 'Confirm Order';
                ApplicationArea = All;
                trigger OnAction()
                begin
                    Rec.BSSI_Field_Status := Rec.BSSI_Field_Status::"Order Confirmed";
                    StatusStyleTxt := 'Strong';
                end;
            }
            action(ReopenOrder)
            {
                Caption = 'Reopen Order';
                ApplicationArea = All;

                trigger OnAction()
                begin
                    Rec.BSSI_Field_Status := Rec.BSSI_Field_Status::Open;
                    StatusStyleTxt := 'Favorable';
                end;
            }
        }
    }

    trigger OnOpenPage()
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


