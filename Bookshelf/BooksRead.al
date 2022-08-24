table 50119 BooksRead
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
        field(2; "Person ID"; Code[20])
        {
            Caption = 'Person ID';
            DataClassification = ToBeClassified;
            TableRelation = Customer;
        }
        field(3; "Time to Read"; Duration)
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