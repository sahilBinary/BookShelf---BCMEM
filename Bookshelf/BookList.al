page 50101 BookList
{
    PageType = List;
    SourceTable = Book;
    UsageCategory = Administration;
    ApplicationArea = All;
    Editable = false;
    CardPageId = BookCard;
    
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                }
                field(Title;Rec.Title)
                {
                    ApplicationArea = All;
                }
                field(Author;Rec.Author)
                {
                    ApplicationArea = All;
                }
                

            }
        }

    }
    
    
}

