page 50100 BookCard
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
                }
                field(Title; Rec.Title)
                {
                    ApplicationArea = All;
                }


            }

            group(Details)
            {
                Caption = 'Details';
                field(Author; Rec.Author)
                {
                    ApplicationArea = All;

                }
                field(Hardcover; Rec.Hardcover)
                {
                    ApplicationArea = All;

                }
                field("Page Count"; Rec."Page Count")
                {
                    ApplicationArea = All;

                }
            }

        }
    }

}


  