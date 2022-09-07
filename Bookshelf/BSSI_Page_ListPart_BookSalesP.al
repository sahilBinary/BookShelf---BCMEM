page 50118 BSSI_Page_ListPart_BookSalesP
{
    Caption = 'Book Sales Lines Perm';
    PageType = ListPart;
    SourceTable = BSSI_Table_BookSalesLines;
    UsageCategory = Administration;
    //ApplicationArea = All;
    Editable = false;
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(BSSI_Field_OrderID; rec.BSSI_Field_OrderID)
                {
                    ApplicationArea = All;
                }
                field(BSSI_Field_DateOfPurchase; rec.BSSI_Field_DateOfPurchase)
                {
                    ApplicationArea = All;
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
                    ApplicationArea = all;
                }
            }
        }

    }

}
