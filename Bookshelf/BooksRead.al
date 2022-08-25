table 50101 BooksRead
{
    Caption = 'Books Read';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'Book No.';
            DataClassification = ToBeClassified;
            TableRelation = Book;
        }
        field(2; "Title"; Text[50])
        {
            Caption = 'Title';
            DataClassification = ToBeClassified;
        }
        field(3; "Person ID"; Code[20])
        {
            Caption = 'Person ID';
            DataClassification = ToBeClassified;
            TableRelation = Customer;
        }
        field(4; "Time to Read"; Duration)
        {
            Caption = 'Time to Read';
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(PK; "No.", "Person ID")
        {
            Clustered = true;
        }
    }

}