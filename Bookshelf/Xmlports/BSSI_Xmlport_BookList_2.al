xmlport 50103 BSSI_Xmlport_BookList_2
{
    Caption = 'BookList XML';
    Direction = Export;
    Format = Xml;

    schema
    {
        textelement(Root)
        {
            XmlName = 'Root';
            tableelement(Book; BSSI_Table_Book)
            {
                fieldattribute(BookNo; Book.BSSI_Field_BookNo) { }
                fieldelement(Title; Book.BSSI_Field_Title) { }
                fieldelement(Author; Book.BSSI_Field_Author) { }
                textelement(Details)
                {
                    XmlName = 'Details';
                    fieldelement(pagecount; Book.BSSI_Field_PageCount) { }
                    fieldelement(Price; Book.BSSI_Field_Price) { }
                    fieldelement(Hardcover; Book.BSSI_Field_Hardcover) { }
                }
            }
        }
    }
}