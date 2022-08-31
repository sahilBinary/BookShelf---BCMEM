table 50104 BooksPurchase
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Order ID"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Person ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Customer;
        }

        field(3; "Date of Purchase"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Total Amount"; Decimal)
        {
            Caption = 'Total Amount ($)';
            //DataClassification = ToBeClassified;
            FieldClass = FlowField;
            CalcFormula = sum(BookSalesLines.LineAmount where ("Order ID" = field("Order ID")));
        }

    }

    keys
    {
        key(PK; "Order ID")
        {
            Clustered = true;
        }
    }
    procedure ConfirmPurchase(var myRec1: Record BooksPurchase)
    var
        punch1: Record BooksPurchase;
    begin
        punch1.Init();
        punch1.TransferFields(myRec1);
        punch1.Insert();
        // if myRec2.FindSet() then begin
        //     repeat begin
        //         punch2.Reset();
        //         punch2.Init();
        //         punch2.TransferFields(myRec2);
        //         punch2.Insert();
        //     end until myRec2.next() = 0;
        // end;
    end;



    // procedure CalcAmount(var myrec: record BooksPurchase)
    // var
    //     MyBook: Record Book;
    // begin
    //     MyBook.Get(myrec."Book No.");
    //     myrec.Amount := myrec.Quantity * MyBook.Price;
    // end;

    // trigger OnInsert()
    // var
    //     myrec: Record BooksPurchase;
    // begin
    //     Rec."Order ID" := myrec.Count() + 1;
    // end;

    // trigger OnDelete()
    // var
    //     myrec: Record BooksPurchase;
    // begin
    //     myrec.SetFilter("Order ID",'<>%1',rec."Order ID");
    //     if myrec.FindSet() then begin
    //         repeat begin
    //             myrec."Order ID" := myrec."Order ID" - 1;
    //             //Rec.Modify();
    //         end until myrec.Next() = 0;
    //     end;

    // end;

}