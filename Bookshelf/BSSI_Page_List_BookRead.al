page 50103 BSSI_Page_List_BookRead
{
    Caption = 'Books Read Record';
    PageType = List;
    SourceTable = BSSI_Table_BooksRead;
    UsageCategory = Administration;
    ApplicationArea = All;
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
                field(BSSI_Field_PersonID;Rec.BSSI_Field_PersonID)
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




