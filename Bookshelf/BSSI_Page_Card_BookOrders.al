page 50111 BSSI_Page_Card_BookOrders
{
    Caption = 'Books Order Card';
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = BSSI_Table_BookOrders;
    SourceTableTemporary = true;

    layout
    {
        area(Content)
        {
            group(Details)
            {
                field(BSSI_Field_OrderID; Rec.BSSI_Field_OrderID)
                {
                    ApplicationArea = all;
                    trigger OnValidate()
                    var
                        myRec: Record BSSI_Table_BookOrders;
                        text001: Label 'An order with Order ID : %1 is already present. Enter a unique Order ID.';
                    begin
                        if myRec.Get(rec.BSSI_Field_OrderID) then begin
                            Message(text001, Rec.BSSI_Field_OrderID);
                            Rec.BSSI_Field_OrderID := 'b-ord';
                        end;
                    end;
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
                    ApplicationArea = all;
                    Importance = Promoted;
                    QuickEntry = false;
                    StyleExpr = StatusStyleTxt;
                    Editable = false;
                    ToolTip = 'Specifies whether the Order is open or confirmed';
                }

            }
            group(BookSalesLines)
            {
                part(Lines; BSSI_Page_ListPart_BookSales)
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
                    Rec.ConfirmPurchase(Rec);
                    CurrPage.Lines.Page.PunchRecord();
                end;
            }
            action(SaveOpenOrder)
            {
                Caption = 'Save Open Order';
                ApplicationArea = All;

                trigger OnAction()
                begin
                    Rec.BSSI_Field_Status := Rec.BSSI_Field_Status::Open;
                    StatusStyleTxt := 'Open';
                    Rec.ConfirmPurchase(Rec);
                    CurrPage.Lines.Page.PunchRecord();
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