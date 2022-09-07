table 50104 BSSI_Table_BookOrders
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; BSSI_Field_OrderID; Code[20])
        {
            Caption = 'Order ID';
            DataClassification = CustomerContent;
        }
        field(2; BSSI_Field_PersonID; Code[20])
        {
            Caption = 'Person ID';
            DataClassification = CustomerContent;
            TableRelation = Customer;
        }

        field(3; BSSI_Field_DateOfPurchase; Date)
        {
            Caption = 'Date of Purchase';
            DataClassification = CustomerContent;
        }
        field(4; BSSI_Field_TotalAmount; Decimal)
        {
            Caption = 'Total Amount ($)';
            FieldClass = FlowField;
            CalcFormula = sum(BSSI_Table_BookSalesLines.BSSI_Field_LineAmount where(BSSI_Field_OrderID = field(BSSI_Field_OrderID)));
        }

    }

    keys
    {
        key(PK; BSSI_Field_OrderID)
        {
            Clustered = true;
        }
    }
    procedure ConfirmPurchase(var myRec1: Record BSSI_Table_BookOrders)
    var
        punch1: Record BSSI_Table_BookOrders;
        check: Record BSSI_Table_BookOrders;
    begin

        punch1.Init();
        punch1.TransferFields(myRec1);
        punch1.Insert();

    end;

}