page 50102 BooksReadCard
{
    Caption = 'Book Read Card';
    PageType = Card;
    //ApplicationArea = All;
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
                    trigger OnValidate()
                    var
                        myRec: Record Book;
                    begin
                        myRec.Reset();
                        if myRec.Get(Rec."No.") then begin
                            Rec.Title := myRec.Title;
                        end;
                    end;
                }
                field("Title"; Rec.Title)
                {
                    ApplicationArea = All; 
                    Editable = false;                 
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




