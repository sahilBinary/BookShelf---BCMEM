page 50102 BSSI_Page_Card_BooksRead
{
    Caption = 'Book Read Card';
    PageType = Card;
    //ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = BSSI_Table_BooksRead;

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
                    trigger OnValidate()
                    var
                        myRec: Record BSSI_Table_Book;
                    begin
                        myRec.Reset();
                        if myRec.Get(Rec.BSSI_Field_BookNo) then begin
                            Rec.BSSI_Field_Title := myRec.BSSI_Field_Title;
                        end;
                    end;
                }
                field(BSSI_Field_Title; Rec.BSSI_Field_Title)
                {
                    ApplicationArea = All; 
                    Editable = false;                 
                }
                field(BSSI_Field_PersonID; Rec.BSSI_Field_PersonID)
                {
                    ApplicationArea = All;
                }

                field(BSSI_Field_TimeToRead; Rec.BSSI_Field_TimeToRead)
                {
                    ApplicationArea = All;
                }
            }

        }

    }
}




