page 50103 BookReadList
{
    Caption = 'Books Read Record';
    PageType = List;
    SourceTable = BooksRead;
    UsageCategory = Administration;
    ApplicationArea = All;
    Editable = false;
    CardPageId = BooksReadCard;
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
                field("Title"; Rec.Title)
                {
                    ApplicationArea = All;
                }
                field("Person ID";Rec."Person ID")
                {
                    ApplicationArea = All;
                }
                field("Time to Read";Rec."Time to Read")
                {
                    ApplicationArea = All;
                }
                

            }
        }

    }
    
    
}

page 50110 BookReadListPart
{
    Caption = 'Books Read Record';
    PageType = ListPart;
    SourceTable = BooksRead;
    UsageCategory = Administration;
    //ApplicationArea = All;
    Editable = false;
    CardPageId = BooksReadCard;
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
                field("Title"; Rec.Title)
                {
                    ApplicationArea = All;
                }
                field("Time to Read";Rec."Time to Read")
                {
                    ApplicationArea = All;
                }
                

            }
        }

    }
    
    
}



