tableextension 50100 CustomerBookExtension extends Customer
{
    fields
    {
        field(50100; "Favourite Book No."; Code[20])
        {
            TableRelation = Book;
            Caption = 'Favourite Book No.';
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var
                myRec: Record Book;
            begin
                Rec.Reset();
                myRec.Get(Rec."Favourite Book No.");
                Rec."Favourite Book Name" := myRec.Title;
            end;
        }

        field(50103; "Favourite Book Name"; Text[50])
        {
            Caption = 'Favourite Book Name';
            DataClassification = ToBeClassified;
        }

        field(50101; "Total Books Read"; Integer)
        {
            //flow field calculate using booksread table
            FieldClass = FlowField;
            CalcFormula = count(BooksRead where("Person ID" = field("No.")));

        }
        field(50102; "Total Reading Time"; Duration)
        {
            //flow field calculate using booksread table
            FieldClass = FlowField;
            CalcFormula = sum(BooksRead."Time to Read" where("Person ID" = FIELD("No.")));

        }
        field(50104; "TotalOrdersPlaced"; Integer)
        {
            Caption = 'Orders Placed';
            FieldClass = FlowField;
            CalcFormula = count(BooksPurchase where ("Person ID" = field("No.")));
        }
        field(50105; "TotalBooksPurchased"; Integer)
        {
            Caption = 'Books Purchased';
            FieldClass = FlowField;
            CalcFormula = sum(BookSalesLines.Quantity where ("Person ID" = field("No.")));
        }
        field(50106; "BookSales"; Decimal)
        {
            Caption = 'Book Sales ($)';
            FieldClass = FlowField;
            CalcFormula = sum(BookSalesLines.LineAmount where ("Person ID" =field("No.")));
        }
        field(50116; ShoeSize; Integer)
        {
            trigger OnValidate();
            var
            begin
                if (ShoeSize < 0) then begin
                    message('Shoe size not valid: %1', rec.ShoeSize);
                    Rec.ShoeSize := xRec.ShoeSize; // reverting to the older shoe size if entered input is invlaid
                end;

            end;
        }


    }

    trigger OnAfterInsert()
    var
        CustomerCode: Codeunit CustomerCode;

    begin
        CustomerCode.CelebrateCustomer(Rec, 'Congrats from the Table Extension');
    end;


    trigger OnBeforeInsert();
    begin
        if (ShoeSize = 0) then
            ShoeSize := Random(42);
    end;

}