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
                            Message(text001,Rec.BSSI_Field_OrderID);
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
            action("Confirm Purchase")
            {
                ApplicationArea = All;

                trigger OnAction()
                begin
                    Rec.ConfirmPurchase(Rec);
                    CurrPage.Lines.Page.PunchRecord();
                end;
            }
        }
    }
}