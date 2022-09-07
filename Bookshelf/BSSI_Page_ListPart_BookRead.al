page 50110 BSSI_Page_ListPart_BookRead
{
    Caption = 'Books Read Record';
    PageType = ListPart;
    SourceTable = BSSI_Table_BooksRead;
    UsageCategory = Administration;
    //ApplicationArea = All;
    Editable = false;
    CardPageId = BSSI_Page_Card_BooksRead;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(BSSI_Field_BookNo; Rec.BSSI_Field_BookNo)
                {
                    ApplicationArea = All;
                }
                field(BSSI_Field_Title; Rec.BSSI_Field_Title)
                {
                    ApplicationArea = All;
                }
                field(BSSI_Field_TimeToRead;Rec.BSSI_Field_TimeToRead)
                {
                    ApplicationArea = All;
                }
                

            }
        }

    }
    
    
}