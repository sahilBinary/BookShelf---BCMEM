table 50107 BSSI_Table_BookSalesLines
{
    Caption = 'Book Sales Lines';
    DataClassification = CustomerContent;
    fields
    {
        field(1; BSSI_Field_OrderID; Code[20])
        {
            Caption = 'Order ID';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(2; BSSI_Field_PersonID; Code[20])
        {
            Caption = 'Person ID';
            FieldClass = FlowField;
            CalcFormula = lookup(BSSI_Table_BookOrders.BSSI_Field_PersonID where(BSSI_Field_OrderID = field(BSSI_Field_OrderID)));
        }
        field(3; BSSI_Field_BookNo; Code[20])
        {
            Caption = 'Book No.';
            DataClassification = CustomerContent;
            TableRelation = BSSI_Table_Book;
        }
        field(4; BSSI_Field_Quantity; Integer)
        {
            Caption = 'Quantity';
            DataClassification = CustomerContent;
            // trigger OnValidate()
            // begin
            //     if Rec.BSSI_Field_DateOfPurchase = today then begin
            //         Rec.BSSI_Field_TodayCheck := true;
            //     end else begin
            //         Rec.BSSI_Field_TodayCheck := false;
            //     end;

            //     if ((DATE2DMY(Rec.BSSI_Field_DateOfPurchase, 2) = DATE2DMY(Today, 2))
            //        and (DATE2DMY(Rec.BSSI_Field_DateOfPurchase, 3) = DATE2DMY(Today, 3))) then begin
            //         Rec.BSSI_Field_CurrentMonthCheck := true;
            //     end else begin
            //         Rec.BSSI_Field_CurrentMonthCheck := false;
            //     end;
            // end;
        }
        field(5; BSSI_Field_DateOfPurchase; Date)
        {
            Caption = 'Date of Purchase';
            FieldClass = FlowField;
            CalcFormula = lookup(BSSI_Table_BookOrders.BSSI_Field_DateOfPurchase where(BSSI_Field_OrderID = field(BSSI_Field_OrderID)));
        }
        field(6; BSSI_Field_LineAmount; Decimal)
        {
            Caption = 'Line Amount ($)';
            DataClassification = CustomerContent;
        }
        field(7; BSSI_Field_Status; Enum "Book Sales Status")
        {
            Caption = 'Status';
            FieldClass = FlowField;
            CalcFormula = lookup(BSSI_Table_BookOrders.BSSI_Field_Status where(BSSI_Field_OrderID = field(BSSI_Field_OrderID)));
        }
        field(8; BSSI_Field_TodayCheck; Boolean)
        {
            Caption = 'Today Check';
            DataClassification = CustomerContent;
        }
        field(9; BSSI_Field_CurrentMonthCheck; Boolean)
        {
            Caption = 'Current Month Check';
            DataClassification = CustomerContent;
        }

    }

    keys
    {
        key(PK; BSSI_Field_OrderID, BSSI_Field_BookNo)
        {
            Clustered = true;
        }
    }



    trigger OnInsert()
    var
        myrec: Record BSSI_Table_Book;
        myrec2: Record BSSI_Table_BookOrders;
    begin
        if myrec.Get(Rec.BSSI_Field_BookNo) then begin
            Rec.BSSI_Field_LineAmount := Rec.BSSI_Field_Quantity * myrec.BSSI_Field_Price;
        end;

        if Rec.BSSI_Field_DateOfPurchase = today then begin
            Rec.BSSI_Field_TodayCheck := true;
        end else begin
            Rec.BSSI_Field_TodayCheck := false;
        end;

        if ((DATE2DMY(Rec.BSSI_Field_DateOfPurchase, 2) = DATE2DMY(Today, 2))
           and (DATE2DMY(Rec.BSSI_Field_DateOfPurchase, 3) = DATE2DMY(Today, 3))) then begin
            Rec.BSSI_Field_CurrentMonthCheck := true;
        end else begin
            Rec.BSSI_Field_CurrentMonthCheck := false;
        end;

    end;
}