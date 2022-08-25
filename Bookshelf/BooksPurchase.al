table 50104 BooksPurchase
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Order ID"; Integer)
        {
            DataClassification = ToBeClassified;
            AutoIncrement = true; 
        }

        field(2; "Book No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Book;
        }
        field(3; "Quantity"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Person ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Customer;
        }

        field(5; "Date of Purchase"; Date)
        {
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; "Order ID")
        {
            Clustered = true;
        }
    }
    procedure ConfirmPurchase(var myRec: Record BooksPurchase)
    var
        punch: Record BooksPurchase;
    begin
        punch.Init();
        punch.TransferFields(myRec);
        punch.Insert();

    end;

}