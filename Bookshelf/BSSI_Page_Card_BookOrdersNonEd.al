page 50115 BSSI_Page_Card_BookOrdersNonEd
{
    Caption = 'Books Order Card non-editable';
    PageType = Card;
    //ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = BSSI_Table_BookOrders;
    Editable = false;
    ModifyAllowed = false;

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

            }
            group(BookSalesLines)
            {
                part(Lines; BSSI_Page_ListPart_BookSalesP)
                {
                    ApplicationArea = all;
                    SubPageLink = BSSI_Field_OrderID = field(BSSI_Field_OrderID);
                }
            }

        }
    }

}



