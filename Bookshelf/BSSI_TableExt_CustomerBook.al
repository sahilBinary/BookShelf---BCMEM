tableextension 50100 BSSI_TableExt_CustomerBook extends Customer
{
    fields
    {
        field(50100; "Favourite Book No."; Code[20])
        {
            TableRelation = BSSI_Table_Book;
            Caption = 'Favourite Book No.';
            DataClassification = CustomerContent;
            trigger OnValidate()
            var
                myRec: Record BSSI_Table_Book;
            begin
                Rec.Reset();
                myRec.Get(Rec."Favourite Book No.");
                Rec."Favourite Book Name" := myRec.BSSI_Field_Title;
            end;
        }

        field(50103; "Favourite Book Name"; Text[50])
        {
            Caption = 'Favourite Book Name';
            DataClassification = CustomerContent;
        }

        field(50101; "Total Books Read"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count(BSSI_Table_BooksRead where(BSSI_Field_PersonID = field("No.")));

        }
        field(50102; "Total Reading Time"; Duration)
        {
            FieldClass = FlowField;
            CalcFormula = sum(BSSI_Table_BooksRead.BSSI_Field_TimeToRead where(BSSI_Field_PersonID = FIELD("No.")));

        }
        field(50104; "TotalOrdersPlaced"; Integer)
        {
            Caption = 'Orders Placed';
            FieldClass = FlowField;
            CalcFormula = count(BSSI_Table_BookOrders where(BSSI_Field_PersonID = field("No.")));
        }
        field(50105; "TotalBooksPurchased"; Integer)
        {
            Caption = 'Books Purchased';
            FieldClass = FlowField;
            CalcFormula = sum(BSSI_Table_BookSalesLines.BSSI_Field_Quantity where(BSSI_Field_PersonID = field("No.")));
        }
        field(50106; "BookSales"; Decimal)
        {
            Caption = 'Book Sales ($)';
            FieldClass = FlowField;
            CalcFormula = sum(BSSI_Table_BookSalesLines.BSSI_Field_LineAmount where(BSSI_Field_PersonID = field("No.")));
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
        CustomerCode: Codeunit BSSI_Codeunit_Customer;

    begin
        CustomerCode.CelebrateCustomer(Rec, 'Congrats from the Table Extension');
    end;


    trigger OnBeforeInsert();
    begin
        if (ShoeSize = 0) then
            ShoeSize := Random(42);
    end;

}