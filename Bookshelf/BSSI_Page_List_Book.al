page 50101 BSSI_Page_List_Book
{
    Caption = 'Book List';
    PageType = List;
    SourceTable = BSSI_Table_Book;
    UsageCategory = Administration;
    ApplicationArea = All;
    Editable = false;
    CardPageId = BSSI_Page_Card_Book;

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
                field(BSSI_Field_Author; Rec.BSSI_Field_Author)
                {
                    ApplicationArea = All;
                }
            }
        }
        area(FactBoxes)
        {
            part(BSSI_Factbox_part1; BSSI_Page_CardPart_Book)
            {
                ApplicationArea = all;
                SubPageLink = BSSI_Field_BookNo = field(BSSI_Field_BookNo);
            }
            part(BSSI_Factbox_part2; BSSI_Page_CardPart_BookSales)
            {
                ApplicationArea = all;
                SubPageLink = BSSI_Field_BookNo = field(BSSI_Field_BookNo);
            }
            systempart(Notes; Notes)
            {
                ApplicationArea = all;
            }
            systempart(Links; Links)
            {
                ApplicationArea = all;
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
                Image = XMLFile;
                ApplicationArea = All;

                trigger OnAction()
                begin
                    Xmlport.Run(50100);
                end;
            }
        }
    }


}



