page 50100 "Book Card"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = Book;

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Enter your Book No. Data Type : Code[20]';
                }
                field(Title; Rec.Title)
                {
                    ApplicationArea = All;
                     ToolTip = 'Enter your Book Name. Data Type : Text[50]';
                }


            }

            group(Details)
            {
                Caption = 'Details';
                field(Author; Rec.Author)
                {
                    ApplicationArea = All;
                    ToolTip = 'Enter the Author name. Data Type : Text[50]';

                }
                field(Hardcover; Rec.Hardcover)
                {
                    ApplicationArea = All;
                    ToolTip = 'Is of type hardcover?';

                }
                field("Page Count"; Rec."Page Count")
                {
                    ApplicationArea = All;
                    ToolTip = 'Enter the no of pages in your Book. Data Type : Intger';
                }
                field("Price"; Rec.Price)
                {
                    ApplicationArea = All;
                    ToolTip = 'Enter the price of your Book. Data Type : Decimal';
                }
            }

        }
    }

}


  