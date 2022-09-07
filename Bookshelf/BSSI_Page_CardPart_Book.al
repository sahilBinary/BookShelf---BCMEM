page 50119 BSSI_Page_CardPart_Book
{
    Caption = 'Book';
    PageType = CardPart;
    //ApplicationArea = All;
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
                    TableRelation = BSSI_Table_Book;
                    ToolTip = 'Specifies the Book No.';
                }
                field(BSSI_Field_Title; Rec.BSSI_Field_Title)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the Book Name.';

                }
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


