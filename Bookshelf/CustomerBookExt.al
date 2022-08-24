tableextension 50100 CustomerBookExtension extends Customer
{
    fields
    {
        field(50100; "Favourite Book No."; Code[20])
        {
            TableRelation = Book."No.";
            Caption = 'Favourite Book No.';
            DataClassification = ToBeClassified;
        }

        field(50101; "Total Books Read"; Integer)
        {
            //flow field calculate using booksread table
            FieldClass = FlowField;
            CalcFormula = count(BooksRead where("Person ID" = FIELD("No.")));

        }
        field(50102; "Total Reading Time"; Duration)
        {
            //flow field calculate using booksread table
            FieldClass = FlowField;
            CalcFormula = sum(BooksRead."Time to Read" where("Person ID" = FIELD("No.")));

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