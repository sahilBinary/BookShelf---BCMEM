table 50101 BSSI_Table_BooksRead
{
    Caption = 'Books Read';
    DataClassification = CustomerContent;

    fields
    {
        field(1; BSSI_Field_BookNo; Code[20])
        {
            Caption = 'Book No.';
            DataClassification = CustomerContent;
            TableRelation = BSSI_Table_Book;
        }
        field(2; BSSI_Field_Title; Text[50])
        {
            Caption = 'Title';
            DataClassification = CustomerContent;
        }
        field(3; BSSI_Field_PersonID; Code[20])
        {
            Caption = 'Person ID';
            DataClassification = CustomerContent;
            TableRelation = Customer;
        }
        field(4; BSSI_Field_TimeToRead; Duration)
        {
            Caption = 'Time to Read';
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(PK; BSSI_Field_BookNo, BSSI_Field_PersonID)
        {
            Clustered = true;
        }
    }

}