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
    end;
}