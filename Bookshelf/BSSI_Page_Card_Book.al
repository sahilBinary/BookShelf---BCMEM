page 50100 BSSI_Page_Card_Book
{
    Caption = 'Book Card';
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = BSSI_Table_Book;

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                field(BSSI_Field_BookNo; Rec.BSSI_Field_BookNo)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the Book No.';
                }
                field(BSSI_Field_Title; Rec.BSSI_Field_Title)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the Book Name.';
                }
                field(BSSI_Field_InventoryCapacity; Rec.BSSI_Field_InventoryCapacity)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the total inventory capacity';
                    trigger OnValidate()
                    var
                        myInt: Integer;
                    begin
                        Rec.BSSI_Field_AvailableInventory := Rec.BSSI_Field_InventoryCapacity - Rec.BSSI_Field_QuantitySold;
                    end;
                }
                // field(BSSI_Field_QuantitySold;Rec.BSSI_Field_QuantitySold)
                // {
                //     ApplicationArea = All;
                // }
                // field(BSSI_Field_AvailableInventory;Rec.BSSI_Field_AvailableInventory)
                // {
                //     ApplicationArea = All;
                // }
            }

            group(Details)
            {
                Caption = 'Details';
                field(BSSI_Field_Author; Rec.BSSI_Field_Author)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the Author name';

                }
                field(BSSI_Field_Hardcover; Rec.BSSI_Field_Hardcover)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies whether the book is of type hardcover';

                }
                field(BSSI_Field_PageCount; Rec.BSSI_Field_PageCount)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the number of pages in the Book';
                }
                field(BSSI_Field_Price; Rec.BSSI_Field_Price)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the unit price of the Book';
                }
            }

        }
    }

}


