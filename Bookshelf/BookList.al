page 50101 BookList
{
    Caption = 'Books';
    PageType = List;
    SourceTable = Book;
    UsageCategory = Administration;
    ApplicationArea = All;
    Editable = false;
    CardPageId = "Book Card";

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
                field(Title; Rec.Title)
                {
                    ApplicationArea = All;
                }
                field(Author; Rec.Author)
                {
                    ApplicationArea = All;
                }
                field("Page Count"; Rec."Page Count")
                {
                    ApplicationArea = All;
                }
                field("Price"; Rec.Price)
                {
                    ApplicationArea = All;
                }
            }
        }

    }

    actions
    {
        area(Reporting)
        {
            action(xmlport)
            {
                Promoted = true;
                Caption = 'Export/Import data';
                ApplicationArea = All;
                
                trigger OnAction()
                begin
                    Xmlport.Run(50100);
                end;
            }
        }
    }


}

