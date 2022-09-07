xmlport 50100 BSSI_Xmlport_BookList_1
{
    schema
    {
        textelement(BookList)
        {
            tableelement(Book; BSSI_Table_Book)
            {

                fieldelement(BookNo; Book.BSSI_Field_BookNo)
                {

                }
                fieldelement(BookTitle; Book.BSSI_Field_Title)
                {

                }
                fieldelement(Author; Book.BSSI_Field_Author)
                {

                }
                fieldelement(PageCount; Book.BSSI_Field_PageCount)
                {

                }
                fieldelement(Price; Book.BSSI_Field_Price)
                {

                }
                fieldelement(Hardcover; Book.BSSI_Field_Hardcover)
                {

                }
            }

        }

    }
    var
        text001: Label 'Import/Export Book List';
}