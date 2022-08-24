page 50121 BooksReadCard
{
    Caption = 'Books Read';
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = BooksRead;

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
                field("Person ID"; Rec."Person ID")
                {
                    ApplicationArea = All;
                }

                field("Time To Read"; Rec."Time to Read")
                {
                    ApplicationArea = All;
                }
            }

        }

    }
}




